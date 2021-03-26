import argparse
import re
import os
import os.path
import ipaddress

import pynetbox
import requests
from jinja2 import Environment, FileSystemLoader, select_autoescape


def get_device_list_from_role(nb, roles):
    """
    Query netbox for devices based on a role or set of roles

    :param nb: A Pynetbox API session
    :type nb: pynetbox.core.api.Api
    :param roles: The name(s) of a device role in Netbox
    :type roles: list
    :return: A list of Netbox devices 
    :rtype: list(pynetbox.core.response.Record)

    """
    devices = list()
    for role in roles:
        try:
            devices.extend(nb.dcim.devices.filter(role=role))
        except pynetbox.core.query.RequestError:
            print("Role '{}' not found\n".format(role))
            raise

    return devices

def get_device_list_from_site(nb, site):
    """
    Query netbox for devices based on a site

    :param nb: A Pynetbox API session
    :type nb: pynetbox.core.api.Api
    :param site: The name of a site in Netbox
    :type site: string
    :return: A list of Netbox devices 
    :rtype: list(pynetbox.core.response.Record)

    """
    try:
        devices_filtered = nb.dcim.devices.filter(site=site.lower())
    except pynetbox.core.query.RequestError:
        print("Site '{}' not found\n".format(role))
        raise

    devices = [d for d in devices_filtered if str(d.device_role)[0:4] == 'spin' or str(d.device_role)[0:4] == 'leaf']

    return devices

def get_device_vrfs(nb, role, vrfs):
    """
    Iterate through all of the VRFs in Netbox and return which VRFs
    map to the given role

    :param nb: A Pynetbox API session
    :type nb: pynetbox.core.api.Api
    :param role: A Netbox device role
    :type role: string
    :param vrfs: A list of Pynetbox VRF responses
    :type vrfs: list(pynetbox.core.response.Record)
    :return: A list of VRFs (strings) that map to the role
    :rtype: list(string)

    """
    device_vrfs = list()
    for vrf in vrfs:
        for tag in vrf.tags:
            if tag.name == 'role-' + role:
                device_vrfs.append(vrf.name)
    
    return device_vrfs

def get_intf_template_vars(enabled_intfs):
    """
    Iterate through a device's enabled interfaces, generate and
    return all of its template variables

    :param enabled_intfs: A Pynetbox Response containing a list of
                          the device's enabled interfaces
    :type enabled_intfs: list(pynetbox.core.response.Record) 
    :return: A list of dictionaries each of which contains the template
             data for an enabled interface
    :rtype: list(dictionary)

    """

    template_intfs = list()
    for intf in enabled_intfs:
        intf_dict = dict()
        intf_dict['name'] = intf.name

        for tag in intf.tags:
            if tag.name == 'interface-type-fabric-base':
                intf_dict['base_routed_int'] = True
            elif tag.name == 'interface-type-fabric-transit':
                intf_dict['fabric_transit'] = True

        # Check to see if the interface is a dot1q subint
        subint_re = re.compile(r'Ethernet\d+(/\d+)*\.(\d+)')
        subint_match = subint_re.match(intf.name)
        if subint_match:
            intf_dict['dot1q_encap'] = subint_match.group(2)

        # Generate a description. If there is one already in Netbox,
        # prefer that. If not and the interface is connected, generate
        # a name based on the destination. Otherwise, no description.
        if intf.description:
            intf_dict['description'] = intf.description
        elif intf.connected_endpoint:
            intf_dict['description'] = "DEST: {} [{}]".format(intf.connected_endpoint.device.name, 
                                                              intf.connected_endpoint.name)
        else:
            intf_dict['description'] = False

        template_intfs.append(intf_dict)

    return template_intfs

def get_ip_template_vars(nb, device_name):
    """
    Iterate through a device's IP addresses, generate and
    return all of its template variables

    :param nb: A Pynetbox API session
    :type nb: pynetbox.core.api.Api
    :param device_name: The name of a device in Netbox
    :type device_name: string
    :return: A list of dictionaries each of which contains template
             data for an IP address
    :rtype: list(dictionary)

    """

    device_ips = nb.ipam.ip_addresses.filter(device=device_name)
    template_ips = list()
    for ip in device_ips:
        ip_int = nb.dcim.interfaces.get(device=device_name, name=ip.assigned_object.name)
        if not ip_int.enabled:
            continue
        ip_dict = dict()
        ip_dict['interface_name'] = ip.assigned_object.name
        ip_dict['vrf'] = ip.vrf.name
        ip_dict['address'] = ip.address
        template_ips.append(ip_dict)

    return template_ips

def get_ip_network(ip_address):
    """
    Return the base IP network from an interface IP address

    :param ip_address: An interface IP address in string format,
                       (e.g. '10.1.1.20/24')
    :type ip_address: string
    :return: The base IP network  
    :rtype: string

    """

    ip_intf = ipaddress.IPv4Interface(ip_address)
    return str(ip_intf.network)

def get_router_ids(nb, device_name):
    """
    Iterate through a device's IP addresses, generate and
    return a list of router IDs (per VRF)

    :param nb: A Pynetbox API session
    :type nb: pynetbox.core.api.Api
    :param device_name: The name of a device in Netbox
    :type device_name: string
    :return: A dictionary with a device's VRFs as keys containing
             an IP address to use as a router ID
    :rtype: dictionary(string)

    """

    router_ids = dict()
    device_ips = nb.ipam.ip_addresses.filter(device=device_name)
    for ip in device_ips:
        router_id_tags = [ip.address for tag in ip.tags if tag.name == 'router-id']
        if len(router_id_tags) > 0:
            # Use the first IP as the router ID and slice off the prefix
            router_ids[ip.vrf.name] = router_id_tags[0][:-3]

    return router_ids

def get_bgp_networks(nb, device_name):
    """
    Iterate through a device's IP addresses, generate and
    return a list of BGP networks that the device will originate 
    (per VRF)

    :param nb: A Pynetbox API session
    :type nb: pynetbox.core.api.Api
    :param device_name: The name of a device in Netbox
    :type device_name: string
    :return: A dictionary with a device's VRFs as keys containing
             a list of BGP networks to originate
    :rtype: dictionary(list)

    """

    bgp_networks = dict()
    device_ips = nb.ipam.ip_addresses.filter(device=device_name)
    for ip in device_ips:
        if ip.vrf.name not in bgp_networks:
            bgp_networks[ip.vrf.name] = list()
        bgp_networks[ip.vrf.name].extend([get_ip_network(ip.address) for tag in ip.tags if tag.name == 'bgp-originate'])

    return bgp_networks

def get_leaf_bgp_peers(nb, device_name, vrf_list):
    """
    Iterate through a device's IP addresses, generate a list of
    the leaf's BGP peers (per VRF)

    :param nb: A Pynetbox API session
    :type nb: pynetbox.core.api.Api
    :param device_name: The name of a device in Netbox
    :type device_name: string
    :param vrf_list: A list of the device's VRFs
    :type vrf_list: list(string)
    :return: A dictionary with a device's VRFs as keys containing
             a list of BGP peers
    :rtype: dictionary(list)

    """

    bgp_peers = dict()
    for vrf in vrf_list:
        bgp_peers[vrf] = list()
    
    device_ips = nb.ipam.ip_addresses.filter(device=device_name)
    for ip in device_ips:
        ip_int = nb.dcim.interfaces.get(device=device_name, name=ip.assigned_object.name)
        if not ip_int.enabled:
            continue

        for tag in ip_int.tags:
            if tag.name == 'interface-type-fabric-transit':
                leaf_ip = ipaddress.IPv4Address(ip.address[:-3])
                bgp_peers[ip.vrf.name].append(str(leaf_ip - 1))
    
    return bgp_peers


def main():
    arg_parser = argparse.ArgumentParser()
    arg_parser.add_argument('--write', help='Write the configuration to the cfg directory', action='store_true')
    group = arg_parser.add_mutually_exclusive_group(required=True)
    group.add_argument('--hostname', help='The name of a device in Netbox')
    group.add_argument('--roles', nargs='+', help='A list of device roles defined in Netbox')
    group.add_argument('--site', help='A site in Netbox')
    args = arg_parser.parse_args()

    env = Environment(
        loader=FileSystemLoader('templates'),
        autoescape=select_autoescape(['html', 'xml']),
        trim_blocks=True
    )

    s = requests.Session()
    s.verify = False
    nb = pynetbox.api('http://localhost:8000', token='0123456789abcdef0123456789abcdef01234567')
    nb.http_session = s

    # Compile a list of device objects
    if args.hostname:
        devices = list()
        devices.append(nb.dcim.devices.get(name=args.hostname))
    elif args.roles:
        devices = get_device_list_from_role(nb, args.roles)
    elif args.site:
        devices = get_device_list_from_site(nb, args.site)
    
    # Compile a list of vrf objects
    vrfs = nb.ipam.vrfs.all()

    for device in devices:
        enabled_intfs = nb.dcim.interfaces.filter(device=device.name, enabled=True)
        role = device.device_role.name
        template_vars = dict()
        template_vars['device'] = vars(device)
        vrf_list = get_device_vrfs(nb, role, vrfs)
        template_vars['vrfs'] = vrf_list
        template_vars['intfs'] = get_intf_template_vars(enabled_intfs)
        template_vars['ip_addresses'] = get_ip_template_vars(nb, device.name)
        template_vars['bgp_networks'] = get_bgp_networks(nb, device.name)
        template_vars['router_ids'] = get_router_ids(nb, device.name)

        if role[0:4] == 'leaf':
            template = env.get_template('leaf.j2')
            template_vars['spine_neighbors'] = get_leaf_bgp_peers(nb, device.name, vrf_list)
        else:
            template = env.get_template(role + '.j2')
        
        rendered_device_cfg = template.render(template_vars)

        print("Generating config for device {}".format(device.name))
        if args.write:
            filename = device.name + '.cfg'
            if not os.path.exists('cfg/'):
                os.makedirs('cfg')
            filepath = 'cfg/{}'.format(filename) 
            with open(filepath, 'w') as f:
                f.write(rendered_device_cfg)
        else:
            print(rendered_device_cfg)

if __name__ == "__main__":
    main()