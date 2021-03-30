--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6
-- Dumped by pg_dump version 12.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO netbox;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO netbox;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO netbox;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO netbox;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO netbox;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO netbox;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO netbox;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO netbox;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO netbox;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO netbox;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO netbox;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO netbox;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: circuits_circuit; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_circuit (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    cid character varying(100) NOT NULL,
    install_date date,
    commit_rate integer,
    comments text NOT NULL,
    provider_id integer NOT NULL,
    type_id integer NOT NULL,
    tenant_id integer,
    description character varying(200) NOT NULL,
    status character varying(50) NOT NULL,
    custom_field_data jsonb NOT NULL,
    CONSTRAINT circuits_circuit_commit_rate_check CHECK ((commit_rate >= 0))
);


ALTER TABLE public.circuits_circuit OWNER TO netbox;

--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_circuit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_circuit_id_seq OWNER TO netbox;

--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_circuit_id_seq OWNED BY public.circuits_circuit.id;


--
-- Name: circuits_circuittermination; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_circuittermination (
    id integer NOT NULL,
    term_side character varying(1) NOT NULL,
    port_speed integer,
    upstream_speed integer,
    xconnect_id character varying(50) NOT NULL,
    pp_info character varying(100) NOT NULL,
    circuit_id integer NOT NULL,
    site_id integer NOT NULL,
    cable_id integer,
    description character varying(200) NOT NULL,
    _cable_peer_id integer,
    _cable_peer_type_id integer,
    _path_id integer,
    CONSTRAINT circuits_circuittermination__cable_peer_id_check CHECK ((_cable_peer_id >= 0)),
    CONSTRAINT circuits_circuittermination_port_speed_check CHECK ((port_speed >= 0)),
    CONSTRAINT circuits_circuittermination_upstream_speed_check CHECK ((upstream_speed >= 0))
);


ALTER TABLE public.circuits_circuittermination OWNER TO netbox;

--
-- Name: circuits_circuittermination_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_circuittermination_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_circuittermination_id_seq OWNER TO netbox;

--
-- Name: circuits_circuittermination_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_circuittermination_id_seq OWNED BY public.circuits_circuittermination.id;


--
-- Name: circuits_circuittype; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_circuittype (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    created date,
    last_updated timestamp with time zone,
    description character varying(200) NOT NULL
);


ALTER TABLE public.circuits_circuittype OWNER TO netbox;

--
-- Name: circuits_circuittype_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_circuittype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_circuittype_id_seq OWNER TO netbox;

--
-- Name: circuits_circuittype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_circuittype_id_seq OWNED BY public.circuits_circuittype.id;


--
-- Name: circuits_provider; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_provider (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    asn bigint,
    account character varying(30) NOT NULL,
    portal_url character varying(200) NOT NULL,
    noc_contact text NOT NULL,
    admin_contact text NOT NULL,
    comments text NOT NULL,
    custom_field_data jsonb NOT NULL
);


ALTER TABLE public.circuits_provider OWNER TO netbox;

--
-- Name: circuits_provider_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_provider_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_provider_id_seq OWNER TO netbox;

--
-- Name: circuits_provider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_provider_id_seq OWNED BY public.circuits_provider.id;


--
-- Name: dcim_cable; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_cable (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    termination_a_id integer NOT NULL,
    termination_b_id integer NOT NULL,
    type character varying(50) NOT NULL,
    status character varying(50) NOT NULL,
    label character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    length smallint,
    length_unit character varying(50) NOT NULL,
    _abs_length numeric(10,4),
    termination_a_type_id integer NOT NULL,
    termination_b_type_id integer NOT NULL,
    _termination_a_device_id integer,
    _termination_b_device_id integer,
    custom_field_data jsonb NOT NULL,
    CONSTRAINT dcim_cable_length_check CHECK ((length >= 0)),
    CONSTRAINT dcim_cable_termination_a_id_check CHECK ((termination_a_id >= 0)),
    CONSTRAINT dcim_cable_termination_b_id_check CHECK ((termination_b_id >= 0))
);


ALTER TABLE public.dcim_cable OWNER TO netbox;

--
-- Name: dcim_cable_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_cable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_cable_id_seq OWNER TO netbox;

--
-- Name: dcim_cable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_cable_id_seq OWNED BY public.dcim_cable.id;


--
-- Name: dcim_cablepath; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_cablepath (
    id integer NOT NULL,
    origin_id integer NOT NULL,
    destination_id integer,
    path character varying(40)[] NOT NULL,
    is_active boolean NOT NULL,
    is_split boolean NOT NULL,
    destination_type_id integer,
    origin_type_id integer NOT NULL,
    CONSTRAINT dcim_cablepath_destination_id_check CHECK ((destination_id >= 0)),
    CONSTRAINT dcim_cablepath_origin_id_check CHECK ((origin_id >= 0))
);


ALTER TABLE public.dcim_cablepath OWNER TO netbox;

--
-- Name: dcim_cablepath_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_cablepath_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_cablepath_id_seq OWNER TO netbox;

--
-- Name: dcim_cablepath_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_cablepath_id_seq OWNED BY public.dcim_cablepath.id;


--
-- Name: dcim_consoleport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleport (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    device_id integer NOT NULL,
    cable_id integer,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    _cable_peer_id integer,
    _cable_peer_type_id integer,
    _path_id integer,
    CONSTRAINT dcim_consoleport__cable_peer_id_check CHECK ((_cable_peer_id >= 0))
);


ALTER TABLE public.dcim_consoleport OWNER TO netbox;

--
-- Name: dcim_consoleport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleport_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleport_id_seq OWNED BY public.dcim_consoleport.id;


--
-- Name: dcim_consoleporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleporttemplate (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    device_type_id integer NOT NULL,
    type character varying(50) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_consoleporttemplate OWNER TO netbox;

--
-- Name: dcim_consoleporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleporttemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleporttemplate_id_seq OWNED BY public.dcim_consoleporttemplate.id;


--
-- Name: dcim_consoleserverport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleserverport (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    device_id integer NOT NULL,
    cable_id integer,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    _cable_peer_id integer,
    _cable_peer_type_id integer,
    _path_id integer,
    CONSTRAINT dcim_consoleserverport__cable_peer_id_check CHECK ((_cable_peer_id >= 0))
);


ALTER TABLE public.dcim_consoleserverport OWNER TO netbox;

--
-- Name: dcim_consoleserverport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleserverport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleserverport_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleserverport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleserverport_id_seq OWNED BY public.dcim_consoleserverport.id;


--
-- Name: dcim_consoleserverporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleserverporttemplate (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    device_type_id integer NOT NULL,
    type character varying(50) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_consoleserverporttemplate OWNER TO netbox;

--
-- Name: dcim_consoleserverporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleserverporttemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleserverporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleserverporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleserverporttemplate_id_seq OWNED BY public.dcim_consoleserverporttemplate.id;


--
-- Name: dcim_device; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_device (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(64),
    serial character varying(50) NOT NULL,
    "position" smallint,
    face character varying(50) NOT NULL,
    status character varying(50) NOT NULL,
    comments text NOT NULL,
    device_role_id integer NOT NULL,
    device_type_id integer NOT NULL,
    platform_id integer,
    rack_id integer,
    primary_ip4_id integer,
    primary_ip6_id integer,
    tenant_id integer,
    asset_tag character varying(50),
    site_id integer NOT NULL,
    cluster_id integer,
    virtual_chassis_id integer,
    vc_position smallint,
    vc_priority smallint,
    local_context_data jsonb,
    _name character varying(100),
    custom_field_data jsonb NOT NULL,
    CONSTRAINT dcim_device_position_check CHECK (("position" >= 0)),
    CONSTRAINT dcim_device_vc_position_check CHECK ((vc_position >= 0)),
    CONSTRAINT dcim_device_vc_priority_check CHECK ((vc_priority >= 0))
);


ALTER TABLE public.dcim_device OWNER TO netbox;

--
-- Name: dcim_device_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_device_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_device_id_seq OWNER TO netbox;

--
-- Name: dcim_device_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_device_id_seq OWNED BY public.dcim_device.id;


--
-- Name: dcim_devicebay; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicebay (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    device_id integer NOT NULL,
    installed_device_id integer,
    description character varying(200) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL
);


ALTER TABLE public.dcim_devicebay OWNER TO netbox;

--
-- Name: dcim_devicebay_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicebay_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicebay_id_seq OWNER TO netbox;

--
-- Name: dcim_devicebay_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicebay_id_seq OWNED BY public.dcim_devicebay.id;


--
-- Name: dcim_devicebaytemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicebaytemplate (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    device_type_id integer NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_devicebaytemplate OWNER TO netbox;

--
-- Name: dcim_devicebaytemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicebaytemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicebaytemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_devicebaytemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicebaytemplate_id_seq OWNED BY public.dcim_devicebaytemplate.id;


--
-- Name: dcim_devicerole; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicerole (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    vm_role boolean NOT NULL,
    created date,
    last_updated timestamp with time zone,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_devicerole OWNER TO netbox;

--
-- Name: dcim_devicerole_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicerole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicerole_id_seq OWNER TO netbox;

--
-- Name: dcim_devicerole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicerole_id_seq OWNED BY public.dcim_devicerole.id;


--
-- Name: dcim_devicetype; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicetype (
    id integer NOT NULL,
    model character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    u_height smallint NOT NULL,
    is_full_depth boolean NOT NULL,
    manufacturer_id integer NOT NULL,
    subdevice_role character varying(50) NOT NULL,
    part_number character varying(50) NOT NULL,
    comments text NOT NULL,
    created date,
    last_updated timestamp with time zone,
    front_image character varying(100) NOT NULL,
    rear_image character varying(100) NOT NULL,
    custom_field_data jsonb NOT NULL,
    CONSTRAINT dcim_devicetype_u_height_check CHECK ((u_height >= 0))
);


ALTER TABLE public.dcim_devicetype OWNER TO netbox;

--
-- Name: dcim_devicetype_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicetype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicetype_id_seq OWNER TO netbox;

--
-- Name: dcim_devicetype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicetype_id_seq OWNED BY public.dcim_devicetype.id;


--
-- Name: dcim_frontport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_frontport (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    type character varying(50) NOT NULL,
    rear_port_position smallint NOT NULL,
    description character varying(200) NOT NULL,
    device_id integer NOT NULL,
    rear_port_id integer NOT NULL,
    cable_id integer,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    _cable_peer_id integer,
    _cable_peer_type_id integer,
    CONSTRAINT dcim_frontport__cable_peer_id_check CHECK ((_cable_peer_id >= 0)),
    CONSTRAINT dcim_frontport_rear_port_position_check CHECK ((rear_port_position >= 0))
);


ALTER TABLE public.dcim_frontport OWNER TO netbox;

--
-- Name: dcim_frontport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_frontport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_frontport_id_seq OWNER TO netbox;

--
-- Name: dcim_frontport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_frontport_id_seq OWNED BY public.dcim_frontport.id;


--
-- Name: dcim_frontporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_frontporttemplate (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    type character varying(50) NOT NULL,
    rear_port_position smallint NOT NULL,
    device_type_id integer NOT NULL,
    rear_port_id integer NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    CONSTRAINT dcim_frontporttemplate_rear_port_position_check CHECK ((rear_port_position >= 0))
);


ALTER TABLE public.dcim_frontporttemplate OWNER TO netbox;

--
-- Name: dcim_frontporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_frontporttemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_frontporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_frontporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_frontporttemplate_id_seq OWNED BY public.dcim_frontporttemplate.id;


--
-- Name: dcim_interface; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interface (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    type character varying(50) NOT NULL,
    mgmt_only boolean NOT NULL,
    description character varying(200) NOT NULL,
    device_id integer NOT NULL,
    mac_address macaddr,
    lag_id integer,
    enabled boolean NOT NULL,
    mtu integer,
    mode character varying(50) NOT NULL,
    untagged_vlan_id integer,
    cable_id integer,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    _cable_peer_id integer,
    _cable_peer_type_id integer,
    _path_id integer,
    CONSTRAINT dcim_interface__cable_peer_id_check CHECK ((_cable_peer_id >= 0)),
    CONSTRAINT dcim_interface_mtu_check CHECK ((mtu >= 0))
);


ALTER TABLE public.dcim_interface OWNER TO netbox;

--
-- Name: dcim_interface_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_interface_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interface_id_seq OWNER TO netbox;

--
-- Name: dcim_interface_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_interface_id_seq OWNED BY public.dcim_interface.id;


--
-- Name: dcim_interface_tagged_vlans; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interface_tagged_vlans (
    id integer NOT NULL,
    interface_id integer NOT NULL,
    vlan_id integer NOT NULL
);


ALTER TABLE public.dcim_interface_tagged_vlans OWNER TO netbox;

--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_interface_tagged_vlans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interface_tagged_vlans_id_seq OWNER TO netbox;

--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_interface_tagged_vlans_id_seq OWNED BY public.dcim_interface_tagged_vlans.id;


--
-- Name: dcim_interfacetemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interfacetemplate (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    type character varying(50) NOT NULL,
    mgmt_only boolean NOT NULL,
    device_type_id integer NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_interfacetemplate OWNER TO netbox;

--
-- Name: dcim_interfacetemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_interfacetemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interfacetemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_interfacetemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_interfacetemplate_id_seq OWNED BY public.dcim_interfacetemplate.id;


--
-- Name: dcim_inventoryitem; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_inventoryitem (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    part_id character varying(50) NOT NULL,
    serial character varying(50) NOT NULL,
    discovered boolean NOT NULL,
    device_id integer NOT NULL,
    parent_id integer,
    manufacturer_id integer,
    asset_tag character varying(50),
    description character varying(200) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    level integer NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    CONSTRAINT dcim_inventoryitem_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_inventoryitem_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_inventoryitem_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_inventoryitem_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_inventoryitem OWNER TO netbox;

--
-- Name: dcim_manufacturer; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_manufacturer (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    created date,
    last_updated timestamp with time zone,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_manufacturer OWNER TO netbox;

--
-- Name: dcim_manufacturer_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_manufacturer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_manufacturer_id_seq OWNER TO netbox;

--
-- Name: dcim_manufacturer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_manufacturer_id_seq OWNED BY public.dcim_manufacturer.id;


--
-- Name: dcim_module_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_module_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_module_id_seq OWNER TO netbox;

--
-- Name: dcim_module_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_module_id_seq OWNED BY public.dcim_inventoryitem.id;


--
-- Name: dcim_platform; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_platform (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    napalm_driver character varying(50) NOT NULL,
    manufacturer_id integer,
    created date,
    last_updated timestamp with time zone,
    napalm_args jsonb,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_platform OWNER TO netbox;

--
-- Name: dcim_platform_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_platform_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_platform_id_seq OWNER TO netbox;

--
-- Name: dcim_platform_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_platform_id_seq OWNED BY public.dcim_platform.id;


--
-- Name: dcim_powerfeed; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerfeed (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(100) NOT NULL,
    status character varying(50) NOT NULL,
    type character varying(50) NOT NULL,
    supply character varying(50) NOT NULL,
    phase character varying(50) NOT NULL,
    voltage smallint NOT NULL,
    amperage smallint NOT NULL,
    max_utilization smallint NOT NULL,
    available_power integer NOT NULL,
    comments text NOT NULL,
    cable_id integer,
    power_panel_id integer NOT NULL,
    rack_id integer,
    custom_field_data jsonb NOT NULL,
    _cable_peer_id integer,
    _cable_peer_type_id integer,
    _path_id integer,
    CONSTRAINT dcim_powerfeed__cable_peer_id_check CHECK ((_cable_peer_id >= 0)),
    CONSTRAINT dcim_powerfeed_amperage_check CHECK ((amperage >= 0)),
    CONSTRAINT dcim_powerfeed_available_power_check CHECK ((available_power >= 0)),
    CONSTRAINT dcim_powerfeed_max_utilization_check CHECK ((max_utilization >= 0))
);


ALTER TABLE public.dcim_powerfeed OWNER TO netbox;

--
-- Name: dcim_powerfeed_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerfeed_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerfeed_id_seq OWNER TO netbox;

--
-- Name: dcim_powerfeed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerfeed_id_seq OWNED BY public.dcim_powerfeed.id;


--
-- Name: dcim_poweroutlet; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_poweroutlet (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    device_id integer NOT NULL,
    cable_id integer,
    description character varying(200) NOT NULL,
    feed_leg character varying(50) NOT NULL,
    power_port_id integer,
    type character varying(50) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    _cable_peer_id integer,
    _cable_peer_type_id integer,
    _path_id integer,
    CONSTRAINT dcim_poweroutlet__cable_peer_id_check CHECK ((_cable_peer_id >= 0))
);


ALTER TABLE public.dcim_poweroutlet OWNER TO netbox;

--
-- Name: dcim_poweroutlet_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_poweroutlet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_poweroutlet_id_seq OWNER TO netbox;

--
-- Name: dcim_poweroutlet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_poweroutlet_id_seq OWNED BY public.dcim_poweroutlet.id;


--
-- Name: dcim_poweroutlettemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_poweroutlettemplate (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    device_type_id integer NOT NULL,
    feed_leg character varying(50) NOT NULL,
    power_port_id integer,
    type character varying(50) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_poweroutlettemplate OWNER TO netbox;

--
-- Name: dcim_poweroutlettemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_poweroutlettemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_poweroutlettemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_poweroutlettemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_poweroutlettemplate_id_seq OWNED BY public.dcim_poweroutlettemplate.id;


--
-- Name: dcim_powerpanel; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerpanel (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(100) NOT NULL,
    rack_group_id integer,
    site_id integer NOT NULL,
    custom_field_data jsonb NOT NULL
);


ALTER TABLE public.dcim_powerpanel OWNER TO netbox;

--
-- Name: dcim_powerpanel_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerpanel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerpanel_id_seq OWNER TO netbox;

--
-- Name: dcim_powerpanel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerpanel_id_seq OWNED BY public.dcim_powerpanel.id;


--
-- Name: dcim_powerport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerport (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    device_id integer NOT NULL,
    cable_id integer,
    description character varying(200) NOT NULL,
    allocated_draw smallint,
    maximum_draw smallint,
    type character varying(50) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    _cable_peer_id integer,
    _cable_peer_type_id integer,
    _path_id integer,
    CONSTRAINT dcim_powerport__cable_peer_id_check CHECK ((_cable_peer_id >= 0)),
    CONSTRAINT dcim_powerport_allocated_draw_check CHECK ((allocated_draw >= 0)),
    CONSTRAINT dcim_powerport_maximum_draw_check CHECK ((maximum_draw >= 0))
);


ALTER TABLE public.dcim_powerport OWNER TO netbox;

--
-- Name: dcim_powerport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerport_id_seq OWNER TO netbox;

--
-- Name: dcim_powerport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerport_id_seq OWNED BY public.dcim_powerport.id;


--
-- Name: dcim_powerporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerporttemplate (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    device_type_id integer NOT NULL,
    allocated_draw smallint,
    maximum_draw smallint,
    type character varying(50) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    CONSTRAINT dcim_powerporttemplate_allocated_draw_check CHECK ((allocated_draw >= 0)),
    CONSTRAINT dcim_powerporttemplate_maximum_draw_check CHECK ((maximum_draw >= 0))
);


ALTER TABLE public.dcim_powerporttemplate OWNER TO netbox;

--
-- Name: dcim_powerporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerporttemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_powerporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerporttemplate_id_seq OWNED BY public.dcim_powerporttemplate.id;


--
-- Name: dcim_rack; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rack (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(100) NOT NULL,
    facility_id character varying(50),
    u_height smallint NOT NULL,
    comments text NOT NULL,
    group_id integer,
    site_id integer NOT NULL,
    tenant_id integer,
    type character varying(50) NOT NULL,
    width smallint NOT NULL,
    role_id integer,
    desc_units boolean NOT NULL,
    serial character varying(50) NOT NULL,
    status character varying(50) NOT NULL,
    asset_tag character varying(50),
    outer_depth smallint,
    outer_unit character varying(50) NOT NULL,
    outer_width smallint,
    _name character varying(100) NOT NULL,
    custom_field_data jsonb NOT NULL,
    CONSTRAINT dcim_rack_outer_depth_check CHECK ((outer_depth >= 0)),
    CONSTRAINT dcim_rack_outer_width_check CHECK ((outer_width >= 0)),
    CONSTRAINT dcim_rack_u_height_check CHECK ((u_height >= 0)),
    CONSTRAINT dcim_rack_width_check CHECK ((width >= 0))
);


ALTER TABLE public.dcim_rack OWNER TO netbox;

--
-- Name: dcim_rack_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rack_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rack_id_seq OWNER TO netbox;

--
-- Name: dcim_rack_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rack_id_seq OWNED BY public.dcim_rack.id;


--
-- Name: dcim_rackgroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rackgroup (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    site_id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    parent_id integer,
    level integer NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    description character varying(200) NOT NULL,
    CONSTRAINT dcim_rackgroup_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_rackgroup_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_rackgroup_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_rackgroup_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_rackgroup OWNER TO netbox;

--
-- Name: dcim_rackgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rackgroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rackgroup_id_seq OWNER TO netbox;

--
-- Name: dcim_rackgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rackgroup_id_seq OWNED BY public.dcim_rackgroup.id;


--
-- Name: dcim_rackreservation; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rackreservation (
    id integer NOT NULL,
    units smallint[] NOT NULL,
    created date,
    description character varying(200) NOT NULL,
    rack_id integer NOT NULL,
    user_id integer NOT NULL,
    tenant_id integer,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL
);


ALTER TABLE public.dcim_rackreservation OWNER TO netbox;

--
-- Name: dcim_rackreservation_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rackreservation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rackreservation_id_seq OWNER TO netbox;

--
-- Name: dcim_rackreservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rackreservation_id_seq OWNED BY public.dcim_rackreservation.id;


--
-- Name: dcim_rackrole; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rackrole (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    created date,
    last_updated timestamp with time zone,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_rackrole OWNER TO netbox;

--
-- Name: dcim_rackrole_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rackrole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rackrole_id_seq OWNER TO netbox;

--
-- Name: dcim_rackrole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rackrole_id_seq OWNED BY public.dcim_rackrole.id;


--
-- Name: dcim_rearport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rearport (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    type character varying(50) NOT NULL,
    positions smallint NOT NULL,
    description character varying(200) NOT NULL,
    device_id integer NOT NULL,
    cable_id integer,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    _cable_peer_id integer,
    _cable_peer_type_id integer,
    CONSTRAINT dcim_rearport__cable_peer_id_check CHECK ((_cable_peer_id >= 0)),
    CONSTRAINT dcim_rearport_positions_check CHECK ((positions >= 0))
);


ALTER TABLE public.dcim_rearport OWNER TO netbox;

--
-- Name: dcim_rearport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rearport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rearport_id_seq OWNER TO netbox;

--
-- Name: dcim_rearport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rearport_id_seq OWNED BY public.dcim_rearport.id;


--
-- Name: dcim_rearporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rearporttemplate (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    type character varying(50) NOT NULL,
    positions smallint NOT NULL,
    device_type_id integer NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    CONSTRAINT dcim_rearporttemplate_positions_check CHECK ((positions >= 0))
);


ALTER TABLE public.dcim_rearporttemplate OWNER TO netbox;

--
-- Name: dcim_rearporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rearporttemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rearporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_rearporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rearporttemplate_id_seq OWNED BY public.dcim_rearporttemplate.id;


--
-- Name: dcim_region; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_region (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id integer,
    created date,
    last_updated timestamp with time zone,
    description character varying(200) NOT NULL,
    CONSTRAINT dcim_region_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_region_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_region_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_region_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_region OWNER TO netbox;

--
-- Name: dcim_region_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_region_id_seq OWNER TO netbox;

--
-- Name: dcim_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_region_id_seq OWNED BY public.dcim_region.id;


--
-- Name: dcim_site; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_site (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    facility character varying(50) NOT NULL,
    asn bigint,
    physical_address character varying(200) NOT NULL,
    shipping_address character varying(200) NOT NULL,
    comments text NOT NULL,
    tenant_id integer,
    contact_email character varying(254) NOT NULL,
    contact_name character varying(50) NOT NULL,
    contact_phone character varying(20) NOT NULL,
    region_id integer,
    description character varying(200) NOT NULL,
    status character varying(50) NOT NULL,
    time_zone character varying(63) NOT NULL,
    latitude numeric(8,6),
    longitude numeric(9,6),
    _name character varying(100) NOT NULL,
    custom_field_data jsonb NOT NULL
);


ALTER TABLE public.dcim_site OWNER TO netbox;

--
-- Name: dcim_site_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_site_id_seq OWNER TO netbox;

--
-- Name: dcim_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_site_id_seq OWNED BY public.dcim_site.id;


--
-- Name: dcim_virtualchassis; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_virtualchassis (
    id integer NOT NULL,
    domain character varying(30) NOT NULL,
    master_id integer,
    created date,
    last_updated timestamp with time zone,
    name character varying(64) NOT NULL,
    custom_field_data jsonb NOT NULL
);


ALTER TABLE public.dcim_virtualchassis OWNER TO netbox;

--
-- Name: dcim_virtualchassis_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_virtualchassis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_virtualchassis_id_seq OWNER TO netbox;

--
-- Name: dcim_virtualchassis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_virtualchassis_id_seq OWNED BY public.dcim_virtualchassis.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO netbox;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO netbox;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO netbox;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO netbox;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO netbox;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO netbox;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO netbox;

--
-- Name: extras_configcontext; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    weight smallint NOT NULL,
    description character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    data jsonb NOT NULL,
    created date,
    last_updated timestamp with time zone,
    CONSTRAINT extras_configcontext_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_configcontext OWNER TO netbox;

--
-- Name: extras_configcontext_cluster_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_cluster_groups (
    id integer NOT NULL,
    configcontext_id integer NOT NULL,
    clustergroup_id integer NOT NULL
);


ALTER TABLE public.extras_configcontext_cluster_groups OWNER TO netbox;

--
-- Name: extras_configcontext_cluster_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_cluster_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_cluster_groups_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_cluster_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_cluster_groups_id_seq OWNED BY public.extras_configcontext_cluster_groups.id;


--
-- Name: extras_configcontext_clusters; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_clusters (
    id integer NOT NULL,
    configcontext_id integer NOT NULL,
    cluster_id integer NOT NULL
);


ALTER TABLE public.extras_configcontext_clusters OWNER TO netbox;

--
-- Name: extras_configcontext_clusters_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_clusters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_clusters_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_clusters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_clusters_id_seq OWNED BY public.extras_configcontext_clusters.id;


--
-- Name: extras_configcontext_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_id_seq OWNED BY public.extras_configcontext.id;


--
-- Name: extras_configcontext_platforms; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_platforms (
    id integer NOT NULL,
    configcontext_id integer NOT NULL,
    platform_id integer NOT NULL
);


ALTER TABLE public.extras_configcontext_platforms OWNER TO netbox;

--
-- Name: extras_configcontext_platforms_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_platforms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_platforms_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_platforms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_platforms_id_seq OWNED BY public.extras_configcontext_platforms.id;


--
-- Name: extras_configcontext_regions; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_regions (
    id integer NOT NULL,
    configcontext_id integer NOT NULL,
    region_id integer NOT NULL
);


ALTER TABLE public.extras_configcontext_regions OWNER TO netbox;

--
-- Name: extras_configcontext_regions_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_regions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_regions_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_regions_id_seq OWNED BY public.extras_configcontext_regions.id;


--
-- Name: extras_configcontext_roles; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_roles (
    id integer NOT NULL,
    configcontext_id integer NOT NULL,
    devicerole_id integer NOT NULL
);


ALTER TABLE public.extras_configcontext_roles OWNER TO netbox;

--
-- Name: extras_configcontext_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_roles_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_roles_id_seq OWNED BY public.extras_configcontext_roles.id;


--
-- Name: extras_configcontext_sites; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_sites (
    id integer NOT NULL,
    configcontext_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.extras_configcontext_sites OWNER TO netbox;

--
-- Name: extras_configcontext_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_sites_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_sites_id_seq OWNED BY public.extras_configcontext_sites.id;


--
-- Name: extras_configcontext_tags; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_tags (
    id integer NOT NULL,
    configcontext_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.extras_configcontext_tags OWNER TO netbox;

--
-- Name: extras_configcontext_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_tags_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_tags_id_seq OWNED BY public.extras_configcontext_tags.id;


--
-- Name: extras_configcontext_tenant_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_tenant_groups (
    id integer NOT NULL,
    configcontext_id integer NOT NULL,
    tenantgroup_id integer NOT NULL
);


ALTER TABLE public.extras_configcontext_tenant_groups OWNER TO netbox;

--
-- Name: extras_configcontext_tenant_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_tenant_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_tenant_groups_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_tenant_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_tenant_groups_id_seq OWNED BY public.extras_configcontext_tenant_groups.id;


--
-- Name: extras_configcontext_tenants; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_tenants (
    id integer NOT NULL,
    configcontext_id integer NOT NULL,
    tenant_id integer NOT NULL
);


ALTER TABLE public.extras_configcontext_tenants OWNER TO netbox;

--
-- Name: extras_configcontext_tenants_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_tenants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_tenants_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_tenants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_tenants_id_seq OWNED BY public.extras_configcontext_tenants.id;


--
-- Name: extras_customfield; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_customfield (
    id integer NOT NULL,
    type character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    label character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    required boolean NOT NULL,
    weight smallint NOT NULL,
    filter_logic character varying(50) NOT NULL,
    choices character varying(100)[],
    "default" jsonb,
    validation_maximum integer,
    validation_minimum integer,
    validation_regex character varying(500) NOT NULL,
    CONSTRAINT extras_customfield_validation_maximum_check CHECK ((validation_maximum >= 0)),
    CONSTRAINT extras_customfield_validation_minimum_check CHECK ((validation_minimum >= 0)),
    CONSTRAINT extras_customfield_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_customfield OWNER TO netbox;

--
-- Name: extras_customfield_content_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_customfield_content_types (
    id integer NOT NULL,
    customfield_id integer NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_customfield_content_types OWNER TO netbox;

--
-- Name: extras_customfield_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_customfield_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customfield_id_seq OWNER TO netbox;

--
-- Name: extras_customfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_customfield_id_seq OWNED BY public.extras_customfield.id;


--
-- Name: extras_customfield_obj_type_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_customfield_obj_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customfield_obj_type_id_seq OWNER TO netbox;

--
-- Name: extras_customfield_obj_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_customfield_obj_type_id_seq OWNED BY public.extras_customfield_content_types.id;


--
-- Name: extras_customlink; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_customlink (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    text character varying(500) NOT NULL,
    url character varying(500) NOT NULL,
    weight smallint NOT NULL,
    group_name character varying(50) NOT NULL,
    button_class character varying(30) NOT NULL,
    new_window boolean NOT NULL,
    content_type_id integer NOT NULL,
    CONSTRAINT extras_customlink_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_customlink OWNER TO netbox;

--
-- Name: extras_customlink_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_customlink_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customlink_id_seq OWNER TO netbox;

--
-- Name: extras_customlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_customlink_id_seq OWNED BY public.extras_customlink.id;


--
-- Name: extras_exporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_exporttemplate (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    template_code text NOT NULL,
    mime_type character varying(50) NOT NULL,
    file_extension character varying(15) NOT NULL,
    content_type_id integer NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.extras_exporttemplate OWNER TO netbox;

--
-- Name: extras_exporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_exporttemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_exporttemplate_id_seq OWNER TO netbox;

--
-- Name: extras_exporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_exporttemplate_id_seq OWNED BY public.extras_exporttemplate.id;


--
-- Name: extras_imageattachment; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_imageattachment (
    id integer NOT NULL,
    object_id integer NOT NULL,
    image character varying(100) NOT NULL,
    image_height smallint NOT NULL,
    image_width smallint NOT NULL,
    name character varying(50) NOT NULL,
    created timestamp with time zone NOT NULL,
    content_type_id integer NOT NULL,
    CONSTRAINT extras_imageattachment_image_height_check CHECK ((image_height >= 0)),
    CONSTRAINT extras_imageattachment_image_width_check CHECK ((image_width >= 0)),
    CONSTRAINT extras_imageattachment_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.extras_imageattachment OWNER TO netbox;

--
-- Name: extras_imageattachment_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_imageattachment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_imageattachment_id_seq OWNER TO netbox;

--
-- Name: extras_imageattachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_imageattachment_id_seq OWNED BY public.extras_imageattachment.id;


--
-- Name: extras_jobresult; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_jobresult (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    completed timestamp with time zone,
    status character varying(30) NOT NULL,
    data jsonb,
    job_id uuid NOT NULL,
    obj_type_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.extras_jobresult OWNER TO netbox;

--
-- Name: extras_jobresult_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_jobresult_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_jobresult_id_seq OWNER TO netbox;

--
-- Name: extras_jobresult_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_jobresult_id_seq OWNED BY public.extras_jobresult.id;


--
-- Name: extras_objectchange; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_objectchange (
    id integer NOT NULL,
    "time" timestamp with time zone NOT NULL,
    user_name character varying(150) NOT NULL,
    request_id uuid NOT NULL,
    action character varying(50) NOT NULL,
    changed_object_id integer NOT NULL,
    related_object_id integer,
    object_repr character varying(200) NOT NULL,
    object_data jsonb NOT NULL,
    changed_object_type_id integer NOT NULL,
    related_object_type_id integer,
    user_id integer,
    CONSTRAINT extras_objectchange_changed_object_id_check CHECK ((changed_object_id >= 0)),
    CONSTRAINT extras_objectchange_related_object_id_check CHECK ((related_object_id >= 0))
);


ALTER TABLE public.extras_objectchange OWNER TO netbox;

--
-- Name: extras_objectchange_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_objectchange_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_objectchange_id_seq OWNER TO netbox;

--
-- Name: extras_objectchange_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_objectchange_id_seq OWNED BY public.extras_objectchange.id;


--
-- Name: extras_tag; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    description character varying(200) NOT NULL,
    created date,
    last_updated timestamp with time zone
);


ALTER TABLE public.extras_tag OWNER TO netbox;

--
-- Name: extras_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_tag_id_seq OWNER TO netbox;

--
-- Name: extras_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_tag_id_seq OWNED BY public.extras_tag.id;


--
-- Name: extras_taggeditem; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.extras_taggeditem OWNER TO netbox;

--
-- Name: extras_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_taggeditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_taggeditem_id_seq OWNER TO netbox;

--
-- Name: extras_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_taggeditem_id_seq OWNED BY public.extras_taggeditem.id;


--
-- Name: extras_webhook; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_webhook (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    type_create boolean NOT NULL,
    type_update boolean NOT NULL,
    type_delete boolean NOT NULL,
    payload_url character varying(500) NOT NULL,
    http_content_type character varying(100) NOT NULL,
    secret character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    ssl_verification boolean NOT NULL,
    ca_file_path character varying(4096),
    additional_headers text NOT NULL,
    http_method character varying(30) NOT NULL,
    body_template text NOT NULL
);


ALTER TABLE public.extras_webhook OWNER TO netbox;

--
-- Name: extras_webhook_content_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_webhook_content_types (
    id integer NOT NULL,
    webhook_id integer NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_webhook_content_types OWNER TO netbox;

--
-- Name: extras_webhook_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_webhook_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_webhook_id_seq OWNER TO netbox;

--
-- Name: extras_webhook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_webhook_id_seq OWNED BY public.extras_webhook.id;


--
-- Name: extras_webhook_obj_type_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_webhook_obj_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_webhook_obj_type_id_seq OWNER TO netbox;

--
-- Name: extras_webhook_obj_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_webhook_obj_type_id_seq OWNED BY public.extras_webhook_content_types.id;


--
-- Name: ipam_aggregate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_aggregate (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    prefix cidr NOT NULL,
    date_added date,
    description character varying(200) NOT NULL,
    rir_id integer NOT NULL,
    custom_field_data jsonb NOT NULL,
    tenant_id integer
);


ALTER TABLE public.ipam_aggregate OWNER TO netbox;

--
-- Name: ipam_aggregate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_aggregate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_aggregate_id_seq OWNER TO netbox;

--
-- Name: ipam_aggregate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_aggregate_id_seq OWNED BY public.ipam_aggregate.id;


--
-- Name: ipam_ipaddress; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_ipaddress (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    address inet NOT NULL,
    description character varying(200) NOT NULL,
    assigned_object_id integer,
    nat_inside_id integer,
    vrf_id integer,
    tenant_id integer,
    status character varying(50) NOT NULL,
    role character varying(50) NOT NULL,
    dns_name character varying(255) NOT NULL,
    assigned_object_type_id integer,
    custom_field_data jsonb NOT NULL,
    CONSTRAINT ipam_ipaddress_assigned_object_id_cff64474_check CHECK ((assigned_object_id >= 0))
);


ALTER TABLE public.ipam_ipaddress OWNER TO netbox;

--
-- Name: ipam_ipaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_ipaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_ipaddress_id_seq OWNER TO netbox;

--
-- Name: ipam_ipaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_ipaddress_id_seq OWNED BY public.ipam_ipaddress.id;


--
-- Name: ipam_prefix; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_prefix (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    prefix cidr NOT NULL,
    status character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    role_id integer,
    site_id integer,
    vlan_id integer,
    vrf_id integer,
    tenant_id integer,
    is_pool boolean NOT NULL,
    custom_field_data jsonb NOT NULL
);


ALTER TABLE public.ipam_prefix OWNER TO netbox;

--
-- Name: ipam_prefix_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_prefix_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_prefix_id_seq OWNER TO netbox;

--
-- Name: ipam_prefix_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_prefix_id_seq OWNED BY public.ipam_prefix.id;


--
-- Name: ipam_rir; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_rir (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    is_private boolean NOT NULL,
    created date,
    last_updated timestamp with time zone,
    description character varying(200) NOT NULL
);


ALTER TABLE public.ipam_rir OWNER TO netbox;

--
-- Name: ipam_rir_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_rir_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_rir_id_seq OWNER TO netbox;

--
-- Name: ipam_rir_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_rir_id_seq OWNED BY public.ipam_rir.id;


--
-- Name: ipam_role; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_role (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    weight smallint NOT NULL,
    created date,
    last_updated timestamp with time zone,
    description character varying(200) NOT NULL,
    CONSTRAINT ipam_role_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.ipam_role OWNER TO netbox;

--
-- Name: ipam_role_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_role_id_seq OWNER TO netbox;

--
-- Name: ipam_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_role_id_seq OWNED BY public.ipam_role.id;


--
-- Name: ipam_routetarget; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_routetarget (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    name character varying(21) NOT NULL,
    description character varying(200) NOT NULL,
    tenant_id integer
);


ALTER TABLE public.ipam_routetarget OWNER TO netbox;

--
-- Name: ipam_routetarget_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_routetarget_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_routetarget_id_seq OWNER TO netbox;

--
-- Name: ipam_routetarget_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_routetarget_id_seq OWNED BY public.ipam_routetarget.id;


--
-- Name: ipam_service; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_service (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(100) NOT NULL,
    protocol character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    device_id integer,
    virtual_machine_id integer,
    custom_field_data jsonb NOT NULL,
    ports integer[] NOT NULL
);


ALTER TABLE public.ipam_service OWNER TO netbox;

--
-- Name: ipam_service_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_service_id_seq OWNER TO netbox;

--
-- Name: ipam_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_service_id_seq OWNED BY public.ipam_service.id;


--
-- Name: ipam_service_ipaddresses; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_service_ipaddresses (
    id integer NOT NULL,
    service_id integer NOT NULL,
    ipaddress_id integer NOT NULL
);


ALTER TABLE public.ipam_service_ipaddresses OWNER TO netbox;

--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_service_ipaddresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_service_ipaddresses_id_seq OWNER TO netbox;

--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_service_ipaddresses_id_seq OWNED BY public.ipam_service_ipaddresses.id;


--
-- Name: ipam_vlan; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vlan (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    vid smallint NOT NULL,
    name character varying(64) NOT NULL,
    status character varying(50) NOT NULL,
    role_id integer,
    site_id integer,
    group_id integer,
    description character varying(200) NOT NULL,
    tenant_id integer,
    custom_field_data jsonb NOT NULL,
    CONSTRAINT ipam_vlan_vid_check CHECK ((vid >= 0))
);


ALTER TABLE public.ipam_vlan OWNER TO netbox;

--
-- Name: ipam_vlan_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vlan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vlan_id_seq OWNER TO netbox;

--
-- Name: ipam_vlan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vlan_id_seq OWNED BY public.ipam_vlan.id;


--
-- Name: ipam_vlangroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vlangroup (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    site_id integer,
    created date,
    last_updated timestamp with time zone,
    description character varying(200) NOT NULL
);


ALTER TABLE public.ipam_vlangroup OWNER TO netbox;

--
-- Name: ipam_vlangroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vlangroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vlangroup_id_seq OWNER TO netbox;

--
-- Name: ipam_vlangroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vlangroup_id_seq OWNED BY public.ipam_vlangroup.id;


--
-- Name: ipam_vrf; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vrf (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(100) NOT NULL,
    rd character varying(21),
    description character varying(200) NOT NULL,
    enforce_unique boolean NOT NULL,
    tenant_id integer,
    custom_field_data jsonb NOT NULL
);


ALTER TABLE public.ipam_vrf OWNER TO netbox;

--
-- Name: ipam_vrf_export_targets; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vrf_export_targets (
    id integer NOT NULL,
    vrf_id integer NOT NULL,
    routetarget_id integer NOT NULL
);


ALTER TABLE public.ipam_vrf_export_targets OWNER TO netbox;

--
-- Name: ipam_vrf_export_targets_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vrf_export_targets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vrf_export_targets_id_seq OWNER TO netbox;

--
-- Name: ipam_vrf_export_targets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vrf_export_targets_id_seq OWNED BY public.ipam_vrf_export_targets.id;


--
-- Name: ipam_vrf_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vrf_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vrf_id_seq OWNER TO netbox;

--
-- Name: ipam_vrf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vrf_id_seq OWNED BY public.ipam_vrf.id;


--
-- Name: ipam_vrf_import_targets; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vrf_import_targets (
    id integer NOT NULL,
    vrf_id integer NOT NULL,
    routetarget_id integer NOT NULL
);


ALTER TABLE public.ipam_vrf_import_targets OWNER TO netbox;

--
-- Name: ipam_vrf_import_targets_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vrf_import_targets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vrf_import_targets_id_seq OWNER TO netbox;

--
-- Name: ipam_vrf_import_targets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vrf_import_targets_id_seq OWNED BY public.ipam_vrf_import_targets.id;


--
-- Name: secrets_secret; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.secrets_secret (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(100) NOT NULL,
    ciphertext bytea NOT NULL,
    hash character varying(128) NOT NULL,
    role_id integer NOT NULL,
    custom_field_data jsonb NOT NULL,
    assigned_object_id integer NOT NULL,
    assigned_object_type_id integer NOT NULL,
    CONSTRAINT secrets_secret_assigned_object_id_check CHECK ((assigned_object_id >= 0))
);


ALTER TABLE public.secrets_secret OWNER TO netbox;

--
-- Name: secrets_secret_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.secrets_secret_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secrets_secret_id_seq OWNER TO netbox;

--
-- Name: secrets_secret_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.secrets_secret_id_seq OWNED BY public.secrets_secret.id;


--
-- Name: secrets_secretrole; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.secrets_secretrole (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    created date,
    last_updated timestamp with time zone,
    description character varying(200) NOT NULL
);


ALTER TABLE public.secrets_secretrole OWNER TO netbox;

--
-- Name: secrets_secretrole_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.secrets_secretrole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secrets_secretrole_id_seq OWNER TO netbox;

--
-- Name: secrets_secretrole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.secrets_secretrole_id_seq OWNED BY public.secrets_secretrole.id;


--
-- Name: secrets_sessionkey; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.secrets_sessionkey (
    id integer NOT NULL,
    cipher bytea NOT NULL,
    hash character varying(128) NOT NULL,
    created timestamp with time zone NOT NULL,
    userkey_id integer NOT NULL
);


ALTER TABLE public.secrets_sessionkey OWNER TO netbox;

--
-- Name: secrets_sessionkey_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.secrets_sessionkey_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secrets_sessionkey_id_seq OWNER TO netbox;

--
-- Name: secrets_sessionkey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.secrets_sessionkey_id_seq OWNED BY public.secrets_sessionkey.id;


--
-- Name: secrets_userkey; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.secrets_userkey (
    id integer NOT NULL,
    created date NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    public_key text NOT NULL,
    master_key_cipher bytea,
    user_id integer NOT NULL
);


ALTER TABLE public.secrets_userkey OWNER TO netbox;

--
-- Name: secrets_userkey_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.secrets_userkey_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secrets_userkey_id_seq OWNER TO netbox;

--
-- Name: secrets_userkey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.secrets_userkey_id_seq OWNED BY public.secrets_userkey.id;


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE public.taggit_tag OWNER TO netbox;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.taggit_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_tag_id_seq OWNER TO netbox;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.taggit_tag_id_seq OWNED BY public.taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.taggit_taggeditem OWNER TO netbox;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.taggit_taggeditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_taggeditem_id_seq OWNER TO netbox;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.taggit_taggeditem_id_seq OWNED BY public.taggit_taggeditem.id;


--
-- Name: tenancy_tenant; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.tenancy_tenant (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    comments text NOT NULL,
    group_id integer,
    custom_field_data jsonb NOT NULL
);


ALTER TABLE public.tenancy_tenant OWNER TO netbox;

--
-- Name: tenancy_tenant_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.tenancy_tenant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenancy_tenant_id_seq OWNER TO netbox;

--
-- Name: tenancy_tenant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.tenancy_tenant_id_seq OWNED BY public.tenancy_tenant.id;


--
-- Name: tenancy_tenantgroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.tenancy_tenantgroup (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    created date,
    last_updated timestamp with time zone,
    parent_id integer,
    level integer NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    description character varying(200) NOT NULL,
    CONSTRAINT tenancy_tenantgroup_level_check CHECK ((level >= 0)),
    CONSTRAINT tenancy_tenantgroup_lft_check CHECK ((lft >= 0)),
    CONSTRAINT tenancy_tenantgroup_rght_check CHECK ((rght >= 0)),
    CONSTRAINT tenancy_tenantgroup_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.tenancy_tenantgroup OWNER TO netbox;

--
-- Name: tenancy_tenantgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.tenancy_tenantgroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenancy_tenantgroup_id_seq OWNER TO netbox;

--
-- Name: tenancy_tenantgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.tenancy_tenantgroup_id_seq OWNED BY public.tenancy_tenantgroup.id;


--
-- Name: users_objectpermission; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_objectpermission (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    enabled boolean NOT NULL,
    constraints jsonb,
    actions character varying(30)[] NOT NULL
);


ALTER TABLE public.users_objectpermission OWNER TO netbox;

--
-- Name: users_objectpermission_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_objectpermission_groups (
    id integer NOT NULL,
    objectpermission_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_objectpermission_groups OWNER TO netbox;

--
-- Name: users_objectpermission_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_objectpermission_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_groups_id_seq OWNER TO netbox;

--
-- Name: users_objectpermission_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_objectpermission_groups_id_seq OWNED BY public.users_objectpermission_groups.id;


--
-- Name: users_objectpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_objectpermission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_id_seq OWNER TO netbox;

--
-- Name: users_objectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_objectpermission_id_seq OWNED BY public.users_objectpermission.id;


--
-- Name: users_objectpermission_object_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_objectpermission_object_types (
    id integer NOT NULL,
    objectpermission_id integer NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.users_objectpermission_object_types OWNER TO netbox;

--
-- Name: users_objectpermission_object_types_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_objectpermission_object_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_object_types_id_seq OWNER TO netbox;

--
-- Name: users_objectpermission_object_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_objectpermission_object_types_id_seq OWNED BY public.users_objectpermission_object_types.id;


--
-- Name: users_objectpermission_users; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_objectpermission_users (
    id integer NOT NULL,
    objectpermission_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_objectpermission_users OWNER TO netbox;

--
-- Name: users_objectpermission_users_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_objectpermission_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_users_id_seq OWNER TO netbox;

--
-- Name: users_objectpermission_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_objectpermission_users_id_seq OWNED BY public.users_objectpermission_users.id;


--
-- Name: users_token; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_token (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    expires timestamp with time zone,
    key character varying(40) NOT NULL,
    write_enabled boolean NOT NULL,
    description character varying(200) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_token OWNER TO netbox;

--
-- Name: users_token_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_token_id_seq OWNER TO netbox;

--
-- Name: users_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_token_id_seq OWNED BY public.users_token.id;


--
-- Name: users_userconfig; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_userconfig (
    id integer NOT NULL,
    data jsonb NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_userconfig OWNER TO netbox;

--
-- Name: users_userconfig_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_userconfig_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_userconfig_id_seq OWNER TO netbox;

--
-- Name: users_userconfig_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_userconfig_id_seq OWNED BY public.users_userconfig.id;


--
-- Name: virtualization_cluster; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_cluster (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(100) NOT NULL,
    comments text NOT NULL,
    group_id integer,
    type_id integer NOT NULL,
    site_id integer,
    tenant_id integer,
    custom_field_data jsonb NOT NULL
);


ALTER TABLE public.virtualization_cluster OWNER TO netbox;

--
-- Name: virtualization_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_cluster_id_seq OWNER TO netbox;

--
-- Name: virtualization_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_cluster_id_seq OWNED BY public.virtualization_cluster.id;


--
-- Name: virtualization_clustergroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_clustergroup (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    created date,
    last_updated timestamp with time zone,
    description character varying(200) NOT NULL
);


ALTER TABLE public.virtualization_clustergroup OWNER TO netbox;

--
-- Name: virtualization_clustergroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_clustergroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_clustergroup_id_seq OWNER TO netbox;

--
-- Name: virtualization_clustergroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_clustergroup_id_seq OWNED BY public.virtualization_clustergroup.id;


--
-- Name: virtualization_clustertype; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_clustertype (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    created date,
    last_updated timestamp with time zone,
    description character varying(200) NOT NULL
);


ALTER TABLE public.virtualization_clustertype OWNER TO netbox;

--
-- Name: virtualization_clustertype_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_clustertype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_clustertype_id_seq OWNER TO netbox;

--
-- Name: virtualization_clustertype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_clustertype_id_seq OWNED BY public.virtualization_clustertype.id;


--
-- Name: virtualization_virtualmachine; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_virtualmachine (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(64) NOT NULL,
    vcpus smallint,
    memory integer,
    disk integer,
    comments text NOT NULL,
    cluster_id integer NOT NULL,
    platform_id integer,
    primary_ip4_id integer,
    primary_ip6_id integer,
    tenant_id integer,
    status character varying(50) NOT NULL,
    role_id integer,
    local_context_data jsonb,
    custom_field_data jsonb NOT NULL,
    CONSTRAINT virtualization_virtualmachine_disk_check CHECK ((disk >= 0)),
    CONSTRAINT virtualization_virtualmachine_memory_check CHECK ((memory >= 0)),
    CONSTRAINT virtualization_virtualmachine_vcpus_check CHECK ((vcpus >= 0))
);


ALTER TABLE public.virtualization_virtualmachine OWNER TO netbox;

--
-- Name: virtualization_virtualmachine_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_virtualmachine_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_virtualmachine_id_seq OWNER TO netbox;

--
-- Name: virtualization_virtualmachine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_virtualmachine_id_seq OWNED BY public.virtualization_virtualmachine.id;


--
-- Name: virtualization_vminterface; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_vminterface (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    enabled boolean NOT NULL,
    mac_address macaddr,
    mtu integer,
    mode character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    untagged_vlan_id integer,
    virtual_machine_id integer NOT NULL,
    CONSTRAINT virtualization_vminterface_mtu_check CHECK ((mtu >= 0))
);


ALTER TABLE public.virtualization_vminterface OWNER TO netbox;

--
-- Name: virtualization_vminterface_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_vminterface_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_vminterface_id_seq OWNER TO netbox;

--
-- Name: virtualization_vminterface_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_vminterface_id_seq OWNED BY public.virtualization_vminterface.id;


--
-- Name: virtualization_vminterface_tagged_vlans; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_vminterface_tagged_vlans (
    id integer NOT NULL,
    vminterface_id integer NOT NULL,
    vlan_id integer NOT NULL
);


ALTER TABLE public.virtualization_vminterface_tagged_vlans OWNER TO netbox;

--
-- Name: virtualization_vminterface_tagged_vlans_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_vminterface_tagged_vlans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_vminterface_tagged_vlans_id_seq OWNER TO netbox;

--
-- Name: virtualization_vminterface_tagged_vlans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_vminterface_tagged_vlans_id_seq OWNED BY public.virtualization_vminterface_tagged_vlans.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: circuits_circuit id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit ALTER COLUMN id SET DEFAULT nextval('public.circuits_circuit_id_seq'::regclass);


--
-- Name: circuits_circuittermination id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination ALTER COLUMN id SET DEFAULT nextval('public.circuits_circuittermination_id_seq'::regclass);


--
-- Name: circuits_circuittype id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype ALTER COLUMN id SET DEFAULT nextval('public.circuits_circuittype_id_seq'::regclass);


--
-- Name: circuits_provider id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider ALTER COLUMN id SET DEFAULT nextval('public.circuits_provider_id_seq'::regclass);


--
-- Name: dcim_cable id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable ALTER COLUMN id SET DEFAULT nextval('public.dcim_cable_id_seq'::regclass);


--
-- Name: dcim_cablepath id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cablepath ALTER COLUMN id SET DEFAULT nextval('public.dcim_cablepath_id_seq'::regclass);


--
-- Name: dcim_consoleport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleport_id_seq'::regclass);


--
-- Name: dcim_consoleporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleporttemplate_id_seq'::regclass);


--
-- Name: dcim_consoleserverport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleserverport_id_seq'::regclass);


--
-- Name: dcim_consoleserverporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleserverporttemplate_id_seq'::regclass);


--
-- Name: dcim_device id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device ALTER COLUMN id SET DEFAULT nextval('public.dcim_device_id_seq'::regclass);


--
-- Name: dcim_devicebay id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicebay_id_seq'::regclass);


--
-- Name: dcim_devicebaytemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicebaytemplate_id_seq'::regclass);


--
-- Name: dcim_devicerole id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicerole_id_seq'::regclass);


--
-- Name: dcim_devicetype id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicetype_id_seq'::regclass);


--
-- Name: dcim_frontport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport ALTER COLUMN id SET DEFAULT nextval('public.dcim_frontport_id_seq'::regclass);


--
-- Name: dcim_frontporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_frontporttemplate_id_seq'::regclass);


--
-- Name: dcim_interface id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface ALTER COLUMN id SET DEFAULT nextval('public.dcim_interface_id_seq'::regclass);


--
-- Name: dcim_interface_tagged_vlans id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans ALTER COLUMN id SET DEFAULT nextval('public.dcim_interface_tagged_vlans_id_seq'::regclass);


--
-- Name: dcim_interfacetemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_interfacetemplate_id_seq'::regclass);


--
-- Name: dcim_inventoryitem id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem ALTER COLUMN id SET DEFAULT nextval('public.dcim_module_id_seq'::regclass);


--
-- Name: dcim_manufacturer id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer ALTER COLUMN id SET DEFAULT nextval('public.dcim_manufacturer_id_seq'::regclass);


--
-- Name: dcim_platform id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform ALTER COLUMN id SET DEFAULT nextval('public.dcim_platform_id_seq'::regclass);


--
-- Name: dcim_powerfeed id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerfeed_id_seq'::regclass);


--
-- Name: dcim_poweroutlet id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet ALTER COLUMN id SET DEFAULT nextval('public.dcim_poweroutlet_id_seq'::regclass);


--
-- Name: dcim_poweroutlettemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_poweroutlettemplate_id_seq'::regclass);


--
-- Name: dcim_powerpanel id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerpanel_id_seq'::regclass);


--
-- Name: dcim_powerport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerport_id_seq'::regclass);


--
-- Name: dcim_powerporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerporttemplate_id_seq'::regclass);


--
-- Name: dcim_rack id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack ALTER COLUMN id SET DEFAULT nextval('public.dcim_rack_id_seq'::regclass);


--
-- Name: dcim_rackgroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackgroup ALTER COLUMN id SET DEFAULT nextval('public.dcim_rackgroup_id_seq'::regclass);


--
-- Name: dcim_rackreservation id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation ALTER COLUMN id SET DEFAULT nextval('public.dcim_rackreservation_id_seq'::regclass);


--
-- Name: dcim_rackrole id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole ALTER COLUMN id SET DEFAULT nextval('public.dcim_rackrole_id_seq'::regclass);


--
-- Name: dcim_rearport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport ALTER COLUMN id SET DEFAULT nextval('public.dcim_rearport_id_seq'::regclass);


--
-- Name: dcim_rearporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_rearporttemplate_id_seq'::regclass);


--
-- Name: dcim_region id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region ALTER COLUMN id SET DEFAULT nextval('public.dcim_region_id_seq'::regclass);


--
-- Name: dcim_site id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site ALTER COLUMN id SET DEFAULT nextval('public.dcim_site_id_seq'::regclass);


--
-- Name: dcim_virtualchassis id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis ALTER COLUMN id SET DEFAULT nextval('public.dcim_virtualchassis_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: extras_configcontext id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_id_seq'::regclass);


--
-- Name: extras_configcontext_cluster_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_cluster_groups_id_seq'::regclass);


--
-- Name: extras_configcontext_clusters id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_clusters_id_seq'::regclass);


--
-- Name: extras_configcontext_platforms id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_platforms_id_seq'::regclass);


--
-- Name: extras_configcontext_regions id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_regions_id_seq'::regclass);


--
-- Name: extras_configcontext_roles id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_roles_id_seq'::regclass);


--
-- Name: extras_configcontext_sites id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_sites_id_seq'::regclass);


--
-- Name: extras_configcontext_tags id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_tags_id_seq'::regclass);


--
-- Name: extras_configcontext_tenant_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_tenant_groups_id_seq'::regclass);


--
-- Name: extras_configcontext_tenants id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_tenants_id_seq'::regclass);


--
-- Name: extras_customfield id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield ALTER COLUMN id SET DEFAULT nextval('public.extras_customfield_id_seq'::regclass);


--
-- Name: extras_customfield_content_types id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types ALTER COLUMN id SET DEFAULT nextval('public.extras_customfield_obj_type_id_seq'::regclass);


--
-- Name: extras_customlink id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink ALTER COLUMN id SET DEFAULT nextval('public.extras_customlink_id_seq'::regclass);


--
-- Name: extras_exporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate ALTER COLUMN id SET DEFAULT nextval('public.extras_exporttemplate_id_seq'::regclass);


--
-- Name: extras_imageattachment id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_imageattachment ALTER COLUMN id SET DEFAULT nextval('public.extras_imageattachment_id_seq'::regclass);


--
-- Name: extras_jobresult id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult ALTER COLUMN id SET DEFAULT nextval('public.extras_jobresult_id_seq'::regclass);


--
-- Name: extras_objectchange id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange ALTER COLUMN id SET DEFAULT nextval('public.extras_objectchange_id_seq'::regclass);


--
-- Name: extras_tag id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_tag ALTER COLUMN id SET DEFAULT nextval('public.extras_tag_id_seq'::regclass);


--
-- Name: extras_taggeditem id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.extras_taggeditem_id_seq'::regclass);


--
-- Name: extras_webhook id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook ALTER COLUMN id SET DEFAULT nextval('public.extras_webhook_id_seq'::regclass);


--
-- Name: extras_webhook_content_types id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types ALTER COLUMN id SET DEFAULT nextval('public.extras_webhook_obj_type_id_seq'::regclass);


--
-- Name: ipam_aggregate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate ALTER COLUMN id SET DEFAULT nextval('public.ipam_aggregate_id_seq'::regclass);


--
-- Name: ipam_ipaddress id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress ALTER COLUMN id SET DEFAULT nextval('public.ipam_ipaddress_id_seq'::regclass);


--
-- Name: ipam_prefix id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix ALTER COLUMN id SET DEFAULT nextval('public.ipam_prefix_id_seq'::regclass);


--
-- Name: ipam_rir id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir ALTER COLUMN id SET DEFAULT nextval('public.ipam_rir_id_seq'::regclass);


--
-- Name: ipam_role id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role ALTER COLUMN id SET DEFAULT nextval('public.ipam_role_id_seq'::regclass);


--
-- Name: ipam_routetarget id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_routetarget ALTER COLUMN id SET DEFAULT nextval('public.ipam_routetarget_id_seq'::regclass);


--
-- Name: ipam_service id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service ALTER COLUMN id SET DEFAULT nextval('public.ipam_service_id_seq'::regclass);


--
-- Name: ipam_service_ipaddresses id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses ALTER COLUMN id SET DEFAULT nextval('public.ipam_service_ipaddresses_id_seq'::regclass);


--
-- Name: ipam_vlan id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan ALTER COLUMN id SET DEFAULT nextval('public.ipam_vlan_id_seq'::regclass);


--
-- Name: ipam_vlangroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup ALTER COLUMN id SET DEFAULT nextval('public.ipam_vlangroup_id_seq'::regclass);


--
-- Name: ipam_vrf id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf ALTER COLUMN id SET DEFAULT nextval('public.ipam_vrf_id_seq'::regclass);


--
-- Name: ipam_vrf_export_targets id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets ALTER COLUMN id SET DEFAULT nextval('public.ipam_vrf_export_targets_id_seq'::regclass);


--
-- Name: ipam_vrf_import_targets id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets ALTER COLUMN id SET DEFAULT nextval('public.ipam_vrf_import_targets_id_seq'::regclass);


--
-- Name: secrets_secret id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secret ALTER COLUMN id SET DEFAULT nextval('public.secrets_secret_id_seq'::regclass);


--
-- Name: secrets_secretrole id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole ALTER COLUMN id SET DEFAULT nextval('public.secrets_secretrole_id_seq'::regclass);


--
-- Name: secrets_sessionkey id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_sessionkey ALTER COLUMN id SET DEFAULT nextval('public.secrets_sessionkey_id_seq'::regclass);


--
-- Name: secrets_userkey id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_userkey ALTER COLUMN id SET DEFAULT nextval('public.secrets_userkey_id_seq'::regclass);


--
-- Name: taggit_tag id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_tag ALTER COLUMN id SET DEFAULT nextval('public.taggit_tag_id_seq'::regclass);


--
-- Name: taggit_taggeditem id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.taggit_taggeditem_id_seq'::regclass);


--
-- Name: tenancy_tenant id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant ALTER COLUMN id SET DEFAULT nextval('public.tenancy_tenant_id_seq'::regclass);


--
-- Name: tenancy_tenantgroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup ALTER COLUMN id SET DEFAULT nextval('public.tenancy_tenantgroup_id_seq'::regclass);


--
-- Name: users_objectpermission id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_id_seq'::regclass);


--
-- Name: users_objectpermission_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_groups_id_seq'::regclass);


--
-- Name: users_objectpermission_object_types id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_object_types_id_seq'::regclass);


--
-- Name: users_objectpermission_users id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_users_id_seq'::regclass);


--
-- Name: users_token id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token ALTER COLUMN id SET DEFAULT nextval('public.users_token_id_seq'::regclass);


--
-- Name: users_userconfig id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_userconfig ALTER COLUMN id SET DEFAULT nextval('public.users_userconfig_id_seq'::regclass);


--
-- Name: virtualization_cluster id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster ALTER COLUMN id SET DEFAULT nextval('public.virtualization_cluster_id_seq'::regclass);


--
-- Name: virtualization_clustergroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup ALTER COLUMN id SET DEFAULT nextval('public.virtualization_clustergroup_id_seq'::regclass);


--
-- Name: virtualization_clustertype id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype ALTER COLUMN id SET DEFAULT nextval('public.virtualization_clustertype_id_seq'::regclass);


--
-- Name: virtualization_virtualmachine id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine ALTER COLUMN id SET DEFAULT nextval('public.virtualization_virtualmachine_id_seq'::regclass);


--
-- Name: virtualization_vminterface id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface ALTER COLUMN id SET DEFAULT nextval('public.virtualization_vminterface_id_seq'::regclass);


--
-- Name: virtualization_vminterface_tagged_vlans id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans ALTER COLUMN id SET DEFAULT nextval('public.virtualization_vminterface_tagged_vlans_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	14	add_logentry
2	Can change log entry	14	change_logentry
3	Can delete log entry	14	delete_logentry
4	Can view log entry	14	view_logentry
5	Can add permission	15	add_permission
6	Can change permission	15	change_permission
7	Can delete permission	15	delete_permission
8	Can view permission	15	view_permission
9	Can add group	16	add_group
10	Can change group	16	change_group
11	Can delete group	16	delete_group
12	Can view group	16	view_group
13	Can add user	17	add_user
14	Can change user	17	change_user
15	Can delete user	17	delete_user
16	Can view user	17	view_user
17	Can add content type	18	add_contenttype
18	Can change content type	18	change_contenttype
19	Can delete content type	18	delete_contenttype
20	Can view content type	18	view_contenttype
21	Can add session	19	add_session
22	Can change session	19	change_session
23	Can delete session	19	delete_session
24	Can view session	19	view_session
25	Can add tag	20	add_tag
26	Can change tag	20	change_tag
27	Can delete tag	20	delete_tag
28	Can view tag	20	view_tag
29	Can add tagged item	21	add_taggeditem
30	Can change tagged item	21	change_taggeditem
31	Can delete tagged item	21	delete_taggeditem
32	Can view tagged item	21	view_taggeditem
33	Can add circuit	22	add_circuit
34	Can change circuit	22	change_circuit
35	Can delete circuit	22	delete_circuit
36	Can view circuit	22	view_circuit
37	Can add circuit type	23	add_circuittype
38	Can change circuit type	23	change_circuittype
39	Can delete circuit type	23	delete_circuittype
40	Can view circuit type	23	view_circuittype
41	Can add provider	24	add_provider
42	Can change provider	24	change_provider
43	Can delete provider	24	delete_provider
44	Can view provider	24	view_provider
45	Can add circuit termination	7	add_circuittermination
46	Can change circuit termination	7	change_circuittermination
47	Can delete circuit termination	7	delete_circuittermination
48	Can view circuit termination	7	view_circuittermination
49	Can add console port	1	add_consoleport
50	Can change console port	1	change_consoleport
51	Can delete console port	1	delete_consoleport
52	Can view console port	1	view_consoleport
53	Can add console port template	25	add_consoleporttemplate
54	Can change console port template	25	change_consoleporttemplate
55	Can delete console port template	25	delete_consoleporttemplate
56	Can view console port template	25	view_consoleporttemplate
57	Can add console server port	2	add_consoleserverport
58	Can change console server port	2	change_consoleserverport
59	Can delete console server port	2	delete_consoleserverport
60	Can view console server port	2	view_consoleserverport
61	Can add console server port template	26	add_consoleserverporttemplate
62	Can change console server port template	26	change_consoleserverporttemplate
63	Can delete console server port template	26	delete_consoleserverporttemplate
64	Can view console server port template	26	view_consoleserverporttemplate
65	Can add device	13	add_device
66	Can change device	13	change_device
67	Can delete device	13	delete_device
68	Can view device	13	view_device
69	Can add device role	27	add_devicerole
70	Can change device role	27	change_devicerole
71	Can delete device role	27	delete_devicerole
72	Can view device role	27	view_devicerole
73	Can add device type	28	add_devicetype
74	Can change device type	28	change_devicetype
75	Can delete device type	28	delete_devicetype
76	Can view device type	28	view_devicetype
77	Can add interface	5	add_interface
78	Can change interface	5	change_interface
79	Can delete interface	5	delete_interface
80	Can view interface	5	view_interface
81	Can add interface template	29	add_interfacetemplate
82	Can change interface template	29	change_interfacetemplate
83	Can delete interface template	29	delete_interfacetemplate
84	Can view interface template	29	view_interfacetemplate
85	Can add manufacturer	30	add_manufacturer
86	Can change manufacturer	30	change_manufacturer
87	Can delete manufacturer	30	delete_manufacturer
88	Can view manufacturer	30	view_manufacturer
89	Can add platform	31	add_platform
90	Can change platform	31	change_platform
91	Can delete platform	31	delete_platform
92	Can view platform	31	view_platform
93	Can add power outlet	4	add_poweroutlet
94	Can change power outlet	4	change_poweroutlet
95	Can delete power outlet	4	delete_poweroutlet
96	Can view power outlet	4	view_poweroutlet
97	Can add power outlet template	32	add_poweroutlettemplate
98	Can change power outlet template	32	change_poweroutlettemplate
99	Can delete power outlet template	32	delete_poweroutlettemplate
100	Can view power outlet template	32	view_poweroutlettemplate
101	Can add power port	3	add_powerport
102	Can change power port	3	change_powerport
103	Can delete power port	3	delete_powerport
104	Can view power port	3	view_powerport
105	Can add power port template	33	add_powerporttemplate
106	Can change power port template	33	change_powerporttemplate
107	Can delete power port template	33	delete_powerporttemplate
108	Can view power port template	33	view_powerporttemplate
109	Can add rack	34	add_rack
110	Can change rack	34	change_rack
111	Can delete rack	34	delete_rack
112	Can view rack	34	view_rack
113	Can add rack group	35	add_rackgroup
114	Can change rack group	35	change_rackgroup
115	Can delete rack group	35	delete_rackgroup
116	Can view rack group	35	view_rackgroup
117	Can add site	36	add_site
118	Can change site	36	change_site
119	Can delete site	36	delete_site
120	Can view site	36	view_site
121	Can add device bay	37	add_devicebay
122	Can change device bay	37	change_devicebay
123	Can delete device bay	37	delete_devicebay
124	Can view device bay	37	view_devicebay
125	Can add device bay template	38	add_devicebaytemplate
126	Can change device bay template	38	change_devicebaytemplate
127	Can delete device bay template	38	delete_devicebaytemplate
128	Can view device bay template	38	view_devicebaytemplate
129	Can add rack role	39	add_rackrole
130	Can change rack role	39	change_rackrole
131	Can delete rack role	39	delete_rackrole
132	Can view rack role	39	view_rackrole
133	Can add rack reservation	40	add_rackreservation
134	Can change rack reservation	40	change_rackreservation
135	Can delete rack reservation	40	delete_rackreservation
136	Can view rack reservation	40	view_rackreservation
137	Can add region	41	add_region
138	Can change region	41	change_region
139	Can delete region	41	delete_region
140	Can view region	41	view_region
141	Can add inventory item	42	add_inventoryitem
142	Can change inventory item	42	change_inventoryitem
143	Can delete inventory item	42	delete_inventoryitem
144	Can view inventory item	42	view_inventoryitem
145	Can add virtual chassis	43	add_virtualchassis
146	Can change virtual chassis	43	change_virtualchassis
147	Can delete virtual chassis	43	delete_virtualchassis
148	Can view virtual chassis	43	view_virtualchassis
149	Can add front port	9	add_frontport
150	Can change front port	9	change_frontport
151	Can delete front port	9	delete_frontport
152	Can view front port	9	view_frontport
153	Can add front port template	44	add_frontporttemplate
154	Can change front port template	44	change_frontporttemplate
155	Can delete front port template	44	delete_frontporttemplate
156	Can view front port template	44	view_frontporttemplate
157	Can add rear port	10	add_rearport
158	Can change rear port	10	change_rearport
159	Can delete rear port	10	delete_rearport
160	Can view rear port	10	view_rearport
161	Can add rear port template	45	add_rearporttemplate
162	Can change rear port template	45	change_rearporttemplate
163	Can delete rear port template	45	delete_rearporttemplate
164	Can view rear port template	45	view_rearporttemplate
165	Can add cable	46	add_cable
166	Can change cable	46	change_cable
167	Can delete cable	46	delete_cable
168	Can view cable	46	view_cable
169	Can add power feed	11	add_powerfeed
170	Can change power feed	11	change_powerfeed
171	Can delete power feed	11	delete_powerfeed
172	Can view power feed	11	view_powerfeed
173	Can add power panel	47	add_powerpanel
174	Can change power panel	47	change_powerpanel
175	Can delete power panel	47	delete_powerpanel
176	Can view power panel	47	view_powerpanel
177	Can add cable path	48	add_cablepath
178	Can change cable path	48	change_cablepath
179	Can delete cable path	48	delete_cablepath
180	Can view cable path	48	view_cablepath
181	Can add aggregate	49	add_aggregate
182	Can change aggregate	49	change_aggregate
183	Can delete aggregate	49	delete_aggregate
184	Can view aggregate	49	view_aggregate
185	Can add IP address	50	add_ipaddress
186	Can change IP address	50	change_ipaddress
187	Can delete IP address	50	delete_ipaddress
188	Can view IP address	50	view_ipaddress
189	Can add prefix	51	add_prefix
190	Can change prefix	51	change_prefix
191	Can delete prefix	51	delete_prefix
192	Can view prefix	51	view_prefix
193	Can add RIR	52	add_rir
194	Can change RIR	52	change_rir
195	Can delete RIR	52	delete_rir
196	Can view RIR	52	view_rir
197	Can add role	53	add_role
198	Can change role	53	change_role
199	Can delete role	53	delete_role
200	Can view role	53	view_role
201	Can add VLAN	54	add_vlan
202	Can change VLAN	54	change_vlan
203	Can delete VLAN	54	delete_vlan
204	Can view VLAN	54	view_vlan
205	Can add VRF	55	add_vrf
206	Can change VRF	55	change_vrf
207	Can delete VRF	55	delete_vrf
208	Can view VRF	55	view_vrf
209	Can add VLAN group	56	add_vlangroup
210	Can change VLAN group	56	change_vlangroup
211	Can delete VLAN group	56	delete_vlangroup
212	Can view VLAN group	56	view_vlangroup
213	Can add service	57	add_service
214	Can change service	57	change_service
215	Can delete service	57	delete_service
216	Can view service	57	view_service
217	Can add route target	58	add_routetarget
218	Can change route target	58	change_routetarget
219	Can delete route target	58	delete_routetarget
220	Can view route target	58	view_routetarget
221	Can add export template	59	add_exporttemplate
222	Can change export template	59	change_exporttemplate
223	Can delete export template	59	delete_exporttemplate
224	Can view export template	59	view_exporttemplate
225	Can add custom field	60	add_customfield
226	Can change custom field	60	change_customfield
227	Can delete custom field	60	delete_customfield
228	Can view custom field	60	view_customfield
229	Can add image attachment	61	add_imageattachment
230	Can change image attachment	61	change_imageattachment
231	Can delete image attachment	61	delete_imageattachment
232	Can view image attachment	61	view_imageattachment
233	Can add webhook	62	add_webhook
234	Can change webhook	62	change_webhook
235	Can delete webhook	62	delete_webhook
236	Can view webhook	62	view_webhook
237	Can add object change	63	add_objectchange
238	Can change object change	63	change_objectchange
239	Can delete object change	63	delete_objectchange
240	Can view object change	63	view_objectchange
241	Can add config context	64	add_configcontext
242	Can change config context	64	change_configcontext
243	Can delete config context	64	delete_configcontext
244	Can view config context	64	view_configcontext
245	Can add tag	65	add_tag
246	Can change tag	65	change_tag
247	Can delete tag	65	delete_tag
248	Can view tag	65	view_tag
249	Can add tagged item	66	add_taggeditem
250	Can change tagged item	66	change_taggeditem
251	Can delete tagged item	66	delete_taggeditem
252	Can view tagged item	66	view_taggeditem
253	Can add custom link	67	add_customlink
254	Can change custom link	67	change_customlink
255	Can delete custom link	67	delete_customlink
256	Can view custom link	67	view_customlink
257	Can add script	68	add_script
258	Can change script	68	change_script
259	Can delete script	68	delete_script
260	Can view script	68	view_script
261	Can add report	12	add_report
262	Can change report	12	change_report
263	Can delete report	12	delete_report
264	Can view report	12	view_report
265	Can add job result	69	add_jobresult
266	Can change job result	69	change_jobresult
267	Can delete job result	69	delete_jobresult
268	Can view job result	69	view_jobresult
269	Can add secret	70	add_secret
270	Can change secret	70	change_secret
271	Can delete secret	70	delete_secret
272	Can view secret	70	view_secret
273	Can add secret role	71	add_secretrole
274	Can change secret role	71	change_secretrole
275	Can delete secret role	71	delete_secretrole
276	Can view secret role	71	view_secretrole
277	Can add user key	72	add_userkey
278	Can change user key	72	change_userkey
279	Can delete user key	72	delete_userkey
280	Can view user key	72	view_userkey
281	Can add session key	73	add_sessionkey
282	Can change session key	73	change_sessionkey
283	Can delete session key	73	delete_sessionkey
284	Can view session key	73	view_sessionkey
285	Can add tenant	74	add_tenant
286	Can change tenant	74	change_tenant
287	Can delete tenant	74	delete_tenant
288	Can view tenant	74	view_tenant
289	Can add tenant group	75	add_tenantgroup
290	Can change tenant group	75	change_tenantgroup
291	Can delete tenant group	75	delete_tenantgroup
292	Can view tenant group	75	view_tenantgroup
293	Can add token	76	add_token
294	Can change token	76	change_token
295	Can delete token	76	delete_token
296	Can view token	76	view_token
297	Can add User Preferences	77	add_userconfig
298	Can change User Preferences	77	change_userconfig
299	Can delete User Preferences	77	delete_userconfig
300	Can view User Preferences	77	view_userconfig
301	Can add Group	78	add_admingroup
302	Can change Group	78	change_admingroup
303	Can delete Group	78	delete_admingroup
304	Can view Group	78	view_admingroup
305	Can add User	79	add_adminuser
306	Can change User	79	change_adminuser
307	Can delete User	79	delete_adminuser
308	Can view User	79	view_adminuser
309	Can add permission	80	add_objectpermission
310	Can change permission	80	change_objectpermission
311	Can delete permission	80	delete_objectpermission
312	Can view permission	80	view_objectpermission
313	Can add cluster	81	add_cluster
314	Can change cluster	81	change_cluster
315	Can delete cluster	81	delete_cluster
316	Can view cluster	81	view_cluster
317	Can add cluster group	82	add_clustergroup
318	Can change cluster group	82	change_clustergroup
319	Can delete cluster group	82	delete_clustergroup
320	Can view cluster group	82	view_clustergroup
321	Can add cluster type	83	add_clustertype
322	Can change cluster type	83	change_clustertype
323	Can delete cluster type	83	delete_clustertype
324	Can view cluster type	83	view_clustertype
325	Can add virtual machine	84	add_virtualmachine
326	Can change virtual machine	84	change_virtualmachine
327	Can delete virtual machine	84	delete_virtualmachine
328	Can view virtual machine	84	view_virtualmachine
329	Can add interface	8	add_vminterface
330	Can change interface	8	change_vminterface
331	Can delete interface	8	delete_vminterface
332	Can view interface	8	view_vminterface
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$216000$9Lotrp0ePRna$rqtotaQc4190TntGkjSe4XsVKHkSoqEru6K0wA+lMaw=	2021-03-30 16:29:50.97039+00	t	admin			admin@example.com	t	t	2021-03-01 20:54:30.914361+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: circuits_circuit; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_circuit (id, created, last_updated, cid, install_date, commit_rate, comments, provider_id, type_id, tenant_id, description, status, custom_field_data) FROM stdin;
\.


--
-- Data for Name: circuits_circuittermination; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_circuittermination (id, term_side, port_speed, upstream_speed, xconnect_id, pp_info, circuit_id, site_id, cable_id, description, _cable_peer_id, _cable_peer_type_id, _path_id) FROM stdin;
\.


--
-- Data for Name: circuits_circuittype; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_circuittype (id, name, slug, created, last_updated, description) FROM stdin;
\.


--
-- Data for Name: circuits_provider; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_provider (id, created, last_updated, name, slug, asn, account, portal_url, noc_contact, admin_contact, comments, custom_field_data) FROM stdin;
\.


--
-- Data for Name: dcim_cable; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_cable (id, created, last_updated, termination_a_id, termination_b_id, type, status, label, color, length, length_unit, _abs_length, termination_a_type_id, termination_b_type_id, _termination_a_device_id, _termination_b_device_id, custom_field_data) FROM stdin;
1	2021-03-03	2021-03-03 21:59:09.207088+00	149	198		connected			\N		\N	5	5	4	5	{}
2	2021-03-03	2021-03-03 22:00:01.973517+00	150	247		connected			\N		\N	5	5	4	6	{}
\.


--
-- Data for Name: dcim_cablepath; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_cablepath (id, origin_id, destination_id, path, is_active, is_split, destination_type_id, origin_type_id) FROM stdin;
1	149	198	{46:1}	t	f	5	5
2	198	149	{46:1}	t	f	5	5
3	150	247	{46:2}	t	f	5	5
4	247	150	{46:2}	t	f	5	5
\.


--
-- Data for Name: dcim_consoleport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleport (id, name, device_id, cable_id, description, type, _name, label, _cable_peer_id, _cable_peer_type_id, _path_id) FROM stdin;
\.


--
-- Data for Name: dcim_consoleporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleporttemplate (id, name, device_type_id, type, _name, label, description) FROM stdin;
\.


--
-- Data for Name: dcim_consoleserverport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleserverport (id, name, device_id, cable_id, description, type, _name, label, _cable_peer_id, _cable_peer_type_id, _path_id) FROM stdin;
\.


--
-- Data for Name: dcim_consoleserverporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleserverporttemplate (id, name, device_type_id, type, _name, label, description) FROM stdin;
\.


--
-- Data for Name: dcim_device; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_device (id, created, last_updated, name, serial, "position", face, status, comments, device_role_id, device_type_id, platform_id, rack_id, primary_ip4_id, primary_ip6_id, tenant_id, asset_tag, site_id, cluster_id, virtual_chassis_id, vc_position, vc_priority, local_context_data, _name, custom_field_data) FROM stdin;
4	2021-03-03	2021-03-23 20:45:10.953519+00	spine-01		\N		active		1	1	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	spine-00000001	{"bgp_asn": 65000}
6	2021-03-03	2021-03-23 20:46:37.185688+00	leaf-02		\N		active		2	1	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	leaf-00000002	{"bgp_asn": 65022}
5	2021-03-03	2021-03-24 15:52:28.147851+00	leaf-01		\N		active		3	1	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	leaf-00000001	{"bgp_asn": 65021}
\.


--
-- Data for Name: dcim_devicebay; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicebay (id, name, device_id, installed_device_id, description, _name, label) FROM stdin;
\.


--
-- Data for Name: dcim_devicebaytemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicebaytemplate (id, name, device_type_id, _name, label, description) FROM stdin;
\.


--
-- Data for Name: dcim_devicerole; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicerole (id, name, slug, color, vm_role, created, last_updated, description) FROM stdin;
1	spine	spine	9c27b0	t	2021-03-03	2021-03-24 15:47:52.63058+00	
3	leaf-border	leaf-border	f44336	t	2021-03-24	2021-03-24 15:48:11.510034+00	
2	leaf-access	leaf-access	2196f3	t	2021-03-03	2021-03-24 15:49:34.843442+00	
\.


--
-- Data for Name: dcim_devicetype; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicetype (id, model, slug, u_height, is_full_depth, manufacturer_id, subdevice_role, part_number, comments, created, last_updated, front_image, rear_image, custom_field_data) FROM stdin;
1	ceos-lab-container	ceos-lab-container	0	f	1				2021-03-03	2021-03-03 02:48:25.534897+00			{}
\.


--
-- Data for Name: dcim_frontport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_frontport (id, name, type, rear_port_position, description, device_id, rear_port_id, cable_id, _name, label, _cable_peer_id, _cable_peer_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_frontporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_frontporttemplate (id, name, type, rear_port_position, device_type_id, rear_port_id, _name, label, description) FROM stdin;
\.


--
-- Data for Name: dcim_interface; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interface (id, name, type, mgmt_only, description, device_id, mac_address, lag_id, enabled, mtu, mode, untagged_vlan_id, cable_id, _name, label, _cable_peer_id, _cable_peer_type_id, _path_id) FROM stdin;
150	Ethernet2	10gbase-x-sfpp	f		4	\N	\N	t	\N		\N	2	9999999999999999Ethernet000002............		247	5	3
199	Ethernet2	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000002............		\N	\N	\N
200	Ethernet3	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000003............		\N	\N	\N
151	Ethernet3	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000003............		\N	\N	\N
152	Ethernet4	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000004............		\N	\N	\N
153	Ethernet5	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000005............		\N	\N	\N
154	Ethernet6	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000006............		\N	\N	\N
155	Ethernet7	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000007............		\N	\N	\N
156	Ethernet8	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000008............		\N	\N	\N
157	Ethernet9	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000009............		\N	\N	\N
158	Ethernet10	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000010............		\N	\N	\N
159	Ethernet11	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000011............		\N	\N	\N
160	Ethernet12	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000012............		\N	\N	\N
161	Ethernet13	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000013............		\N	\N	\N
162	Ethernet14	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000014............		\N	\N	\N
163	Ethernet15	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000015............		\N	\N	\N
164	Ethernet16	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000016............		\N	\N	\N
165	Ethernet17	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000017............		\N	\N	\N
214	Ethernet17	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000017............		\N	\N	\N
248	Ethernet2	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000002............		\N	\N	\N
249	Ethernet3	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000003............		\N	\N	\N
250	Ethernet4	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000004............		\N	\N	\N
251	Ethernet5	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000005............		\N	\N	\N
252	Ethernet6	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000006............		\N	\N	\N
253	Ethernet7	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000007............		\N	\N	\N
254	Ethernet8	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000008............		\N	\N	\N
255	Ethernet9	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000009............		\N	\N	\N
256	Ethernet10	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000010............		\N	\N	\N
257	Ethernet11	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000011............		\N	\N	\N
258	Ethernet12	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000012............		\N	\N	\N
259	Ethernet13	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000013............		\N	\N	\N
260	Ethernet14	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000014............		\N	\N	\N
261	Ethernet15	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000015............		\N	\N	\N
262	Ethernet16	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000016............		\N	\N	\N
263	Ethernet17	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000017............		\N	\N	\N
264	Ethernet18	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000018............		\N	\N	\N
265	Ethernet19	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000019............		\N	\N	\N
266	Ethernet20	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000020............		\N	\N	\N
267	Ethernet21	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000021............		\N	\N	\N
268	Ethernet22	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000022............		\N	\N	\N
269	Ethernet23	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000023............		\N	\N	\N
270	Ethernet24	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000024............		\N	\N	\N
271	Ethernet25	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000025............		\N	\N	\N
272	Ethernet26	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000026............		\N	\N	\N
273	Ethernet27	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000027............		\N	\N	\N
274	Ethernet28	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000028............		\N	\N	\N
275	Ethernet29	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000029............		\N	\N	\N
276	Ethernet30	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000030............		\N	\N	\N
277	Ethernet31	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000031............		\N	\N	\N
278	Ethernet32	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000032............		\N	\N	\N
149	Ethernet1	10gbase-x-sfpp	f		4	\N	\N	t	\N		\N	1	9999999999999999Ethernet000001............		198	5	1
302	Ethernet1.100	virtual	f		4	\N	\N	t	\N		\N	\N	9999999999999999Ethernet000001......000100		\N	\N	\N
303	Ethernet1.200	virtual	f		4	\N	\N	t	\N		\N	\N	9999999999999999Ethernet000001......000200		\N	\N	\N
304	Ethernet1.400	virtual	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000001......000400		\N	\N	\N
305	Ethernet2.100	virtual	f		4	\N	\N	t	\N		\N	\N	9999999999999999Ethernet000002......000100		\N	\N	\N
306	Ethernet2.200	virtual	f		4	\N	\N	t	\N		\N	\N	9999999999999999Ethernet000002......000200		\N	\N	\N
307	Ethernet2.400	virtual	f		4	\N	\N	t	\N		\N	\N	9999999999999999Ethernet000002......000400		\N	\N	\N
198	Ethernet1	10gbase-x-sfpp	f		5	\N	\N	t	\N		\N	1	9999999999999999Ethernet000001............		149	5	2
296	Ethernet1.100	virtual	f		5	\N	\N	t	\N		\N	\N	9999999999999999Ethernet000001......000100		\N	\N	\N
297	Ethernet1.200	virtual	f		5	\N	\N	t	\N		\N	\N	9999999999999999Ethernet000001......000200		\N	\N	\N
298	Ethernet1.400	virtual	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000001......000400		\N	\N	\N
247	Ethernet1	10gbase-x-sfpp	f		6	\N	\N	t	\N		\N	2	9999999999999999Ethernet000001............		150	5	4
299	Ethernet1.100	virtual	f		6	\N	\N	t	\N		\N	\N	9999999999999999Ethernet000001......000100		\N	\N	\N
300	Ethernet1.200	virtual	f		6	\N	\N	t	\N		\N	\N	9999999999999999Ethernet000001......000200		\N	\N	\N
301	Ethernet1.400	virtual	f		6	\N	\N	t	\N		\N	\N	9999999999999999Ethernet000001......000400		\N	\N	\N
289	Ethernet43	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000043............		\N	\N	\N
308	Loopback1	virtual	f	Loopback and router-id - default VRF	5	\N	\N	t	\N		\N	\N	9999999999999999Loopback000001............		\N	\N	\N
309	Loopback1	virtual	f	Loopback and router-id - default VRF	6	\N	\N	t	\N		\N	\N	9999999999999999Loopback000001............		\N	\N	\N
310	Loopback1	virtual	f	Loopback and router-id - default VRF	4	\N	\N	t	\N		\N	\N	9999999999999999Loopback000001............		\N	\N	\N
311	Loopback2	virtual	f	Loopback and router-id - dev VRF	5	\N	\N	t	\N		\N	\N	9999999999999999Loopback000002............		\N	\N	\N
312	Loopback2	virtual	f	Loopback and router-id - dev VRF	6	\N	\N	t	\N		\N	\N	9999999999999999Loopback000002............		\N	\N	\N
313	Loopback2	virtual	f	Loopback and router-id - dev VRF	4	\N	\N	t	\N		\N	\N	9999999999999999Loopback000002............		\N	\N	\N
315	Loopback4	virtual	f	Loopback and router-id - dmz VRF	6	\N	\N	t	\N		\N	\N	9999999999999999Loopback000004............		\N	\N	\N
316	Loopback4	virtual	f	Loopback and router-id - dmz VRF	4	\N	\N	t	\N		\N	\N	9999999999999999Loopback000004............		\N	\N	\N
314	Loopback4	virtual	f	Loopback and router-id - dmz VRF	5	\N	\N	f	\N		\N	\N	9999999999999999Loopback000004............		\N	\N	\N
201	Ethernet4	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000004............		\N	\N	\N
202	Ethernet5	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000005............		\N	\N	\N
203	Ethernet6	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000006............		\N	\N	\N
204	Ethernet7	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000007............		\N	\N	\N
205	Ethernet8	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000008............		\N	\N	\N
206	Ethernet9	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000009............		\N	\N	\N
207	Ethernet10	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000010............		\N	\N	\N
208	Ethernet11	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000011............		\N	\N	\N
209	Ethernet12	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000012............		\N	\N	\N
210	Ethernet13	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000013............		\N	\N	\N
211	Ethernet14	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000014............		\N	\N	\N
212	Ethernet15	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000015............		\N	\N	\N
213	Ethernet16	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000016............		\N	\N	\N
215	Ethernet18	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000018............		\N	\N	\N
216	Ethernet19	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000019............		\N	\N	\N
217	Ethernet20	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000020............		\N	\N	\N
218	Ethernet21	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000021............		\N	\N	\N
219	Ethernet22	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000022............		\N	\N	\N
220	Ethernet23	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000023............		\N	\N	\N
221	Ethernet24	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000024............		\N	\N	\N
222	Ethernet25	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000025............		\N	\N	\N
223	Ethernet26	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000026............		\N	\N	\N
224	Ethernet27	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000027............		\N	\N	\N
225	Ethernet28	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000028............		\N	\N	\N
226	Ethernet29	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000029............		\N	\N	\N
227	Ethernet30	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000030............		\N	\N	\N
228	Ethernet31	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000031............		\N	\N	\N
229	Ethernet32	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000032............		\N	\N	\N
230	Ethernet33	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000033............		\N	\N	\N
231	Ethernet34	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000034............		\N	\N	\N
232	Ethernet35	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000035............		\N	\N	\N
233	Ethernet36	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000036............		\N	\N	\N
234	Ethernet37	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000037............		\N	\N	\N
235	Ethernet38	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000038............		\N	\N	\N
236	Ethernet39	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000039............		\N	\N	\N
237	Ethernet40	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000040............		\N	\N	\N
238	Ethernet41	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000041............		\N	\N	\N
239	Ethernet42	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000042............		\N	\N	\N
240	Ethernet43	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000043............		\N	\N	\N
241	Ethernet44	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000044............		\N	\N	\N
242	Ethernet45	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000045............		\N	\N	\N
243	Ethernet46	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000046............		\N	\N	\N
244	Ethernet47	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000047............		\N	\N	\N
245	Ethernet48	10gbase-x-sfpp	f		5	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000048............		\N	\N	\N
246	Loopback0	virtual	f		5	\N	\N	f	\N		\N	\N	9999999999999999Loopback000000............		\N	\N	\N
279	Ethernet33	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000033............		\N	\N	\N
280	Ethernet34	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000034............		\N	\N	\N
281	Ethernet35	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000035............		\N	\N	\N
282	Ethernet36	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000036............		\N	\N	\N
283	Ethernet37	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000037............		\N	\N	\N
284	Ethernet38	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000038............		\N	\N	\N
285	Ethernet39	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000039............		\N	\N	\N
286	Ethernet40	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000040............		\N	\N	\N
287	Ethernet41	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000041............		\N	\N	\N
288	Ethernet42	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000042............		\N	\N	\N
290	Ethernet44	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000044............		\N	\N	\N
291	Ethernet45	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000045............		\N	\N	\N
292	Ethernet46	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000046............		\N	\N	\N
293	Ethernet47	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000047............		\N	\N	\N
294	Ethernet48	10gbase-x-sfpp	f		6	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000048............		\N	\N	\N
295	Loopback0	virtual	f		6	\N	\N	f	\N		\N	\N	9999999999999999Loopback000000............		\N	\N	\N
166	Ethernet18	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000018............		\N	\N	\N
167	Ethernet19	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000019............		\N	\N	\N
168	Ethernet20	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000020............		\N	\N	\N
169	Ethernet21	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000021............		\N	\N	\N
170	Ethernet22	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000022............		\N	\N	\N
171	Ethernet23	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000023............		\N	\N	\N
172	Ethernet24	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000024............		\N	\N	\N
173	Ethernet25	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000025............		\N	\N	\N
174	Ethernet26	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000026............		\N	\N	\N
175	Ethernet27	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000027............		\N	\N	\N
176	Ethernet28	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000028............		\N	\N	\N
177	Ethernet29	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000029............		\N	\N	\N
178	Ethernet30	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000030............		\N	\N	\N
179	Ethernet31	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000031............		\N	\N	\N
180	Ethernet32	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000032............		\N	\N	\N
181	Ethernet33	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000033............		\N	\N	\N
182	Ethernet34	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000034............		\N	\N	\N
183	Ethernet35	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000035............		\N	\N	\N
184	Ethernet36	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000036............		\N	\N	\N
185	Ethernet37	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000037............		\N	\N	\N
186	Ethernet38	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000038............		\N	\N	\N
187	Ethernet39	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000039............		\N	\N	\N
188	Ethernet40	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000040............		\N	\N	\N
189	Ethernet41	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000041............		\N	\N	\N
190	Ethernet42	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000042............		\N	\N	\N
191	Ethernet43	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000043............		\N	\N	\N
192	Ethernet44	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000044............		\N	\N	\N
193	Ethernet45	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000045............		\N	\N	\N
194	Ethernet46	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000046............		\N	\N	\N
195	Ethernet47	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000047............		\N	\N	\N
196	Ethernet48	10gbase-x-sfpp	f		4	\N	\N	f	\N		\N	\N	9999999999999999Ethernet000048............		\N	\N	\N
197	Loopback0	virtual	f		4	\N	\N	f	\N		\N	\N	9999999999999999Loopback000000............		\N	\N	\N
\.


--
-- Data for Name: dcim_interface_tagged_vlans; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interface_tagged_vlans (id, interface_id, vlan_id) FROM stdin;
\.


--
-- Data for Name: dcim_interfacetemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interfacetemplate (id, name, type, mgmt_only, device_type_id, _name, label, description) FROM stdin;
50	Loopback0	virtual	f	1	9999999999999999Loopback000000............		
51	Ethernet1	10gbase-x-sfpp	f	1	9999999999999999Ethernet000001............		
52	Ethernet2	10gbase-x-sfpp	f	1	9999999999999999Ethernet000002............		
53	Ethernet3	10gbase-x-sfpp	f	1	9999999999999999Ethernet000003............		
54	Ethernet4	10gbase-x-sfpp	f	1	9999999999999999Ethernet000004............		
55	Ethernet5	10gbase-x-sfpp	f	1	9999999999999999Ethernet000005............		
56	Ethernet6	10gbase-x-sfpp	f	1	9999999999999999Ethernet000006............		
57	Ethernet7	10gbase-x-sfpp	f	1	9999999999999999Ethernet000007............		
58	Ethernet8	10gbase-x-sfpp	f	1	9999999999999999Ethernet000008............		
59	Ethernet9	10gbase-x-sfpp	f	1	9999999999999999Ethernet000009............		
60	Ethernet10	10gbase-x-sfpp	f	1	9999999999999999Ethernet000010............		
61	Ethernet11	10gbase-x-sfpp	f	1	9999999999999999Ethernet000011............		
62	Ethernet12	10gbase-x-sfpp	f	1	9999999999999999Ethernet000012............		
63	Ethernet13	10gbase-x-sfpp	f	1	9999999999999999Ethernet000013............		
64	Ethernet14	10gbase-x-sfpp	f	1	9999999999999999Ethernet000014............		
65	Ethernet15	10gbase-x-sfpp	f	1	9999999999999999Ethernet000015............		
66	Ethernet16	10gbase-x-sfpp	f	1	9999999999999999Ethernet000016............		
67	Ethernet17	10gbase-x-sfpp	f	1	9999999999999999Ethernet000017............		
68	Ethernet18	10gbase-x-sfpp	f	1	9999999999999999Ethernet000018............		
69	Ethernet19	10gbase-x-sfpp	f	1	9999999999999999Ethernet000019............		
70	Ethernet20	10gbase-x-sfpp	f	1	9999999999999999Ethernet000020............		
71	Ethernet21	10gbase-x-sfpp	f	1	9999999999999999Ethernet000021............		
72	Ethernet22	10gbase-x-sfpp	f	1	9999999999999999Ethernet000022............		
73	Ethernet23	10gbase-x-sfpp	f	1	9999999999999999Ethernet000023............		
74	Ethernet24	10gbase-x-sfpp	f	1	9999999999999999Ethernet000024............		
75	Ethernet25	10gbase-x-sfpp	f	1	9999999999999999Ethernet000025............		
76	Ethernet26	10gbase-x-sfpp	f	1	9999999999999999Ethernet000026............		
77	Ethernet27	10gbase-x-sfpp	f	1	9999999999999999Ethernet000027............		
78	Ethernet28	10gbase-x-sfpp	f	1	9999999999999999Ethernet000028............		
79	Ethernet29	10gbase-x-sfpp	f	1	9999999999999999Ethernet000029............		
80	Ethernet30	10gbase-x-sfpp	f	1	9999999999999999Ethernet000030............		
81	Ethernet31	10gbase-x-sfpp	f	1	9999999999999999Ethernet000031............		
82	Ethernet32	10gbase-x-sfpp	f	1	9999999999999999Ethernet000032............		
83	Ethernet33	10gbase-x-sfpp	f	1	9999999999999999Ethernet000033............		
84	Ethernet34	10gbase-x-sfpp	f	1	9999999999999999Ethernet000034............		
85	Ethernet35	10gbase-x-sfpp	f	1	9999999999999999Ethernet000035............		
86	Ethernet36	10gbase-x-sfpp	f	1	9999999999999999Ethernet000036............		
87	Ethernet37	10gbase-x-sfpp	f	1	9999999999999999Ethernet000037............		
88	Ethernet38	10gbase-x-sfpp	f	1	9999999999999999Ethernet000038............		
89	Ethernet39	10gbase-x-sfpp	f	1	9999999999999999Ethernet000039............		
90	Ethernet40	10gbase-x-sfpp	f	1	9999999999999999Ethernet000040............		
91	Ethernet41	10gbase-x-sfpp	f	1	9999999999999999Ethernet000041............		
92	Ethernet42	10gbase-x-sfpp	f	1	9999999999999999Ethernet000042............		
93	Ethernet43	10gbase-x-sfpp	f	1	9999999999999999Ethernet000043............		
94	Ethernet44	10gbase-x-sfpp	f	1	9999999999999999Ethernet000044............		
95	Ethernet45	10gbase-x-sfpp	f	1	9999999999999999Ethernet000045............		
96	Ethernet46	10gbase-x-sfpp	f	1	9999999999999999Ethernet000046............		
97	Ethernet47	10gbase-x-sfpp	f	1	9999999999999999Ethernet000047............		
98	Ethernet48	10gbase-x-sfpp	f	1	9999999999999999Ethernet000048............		
\.


--
-- Data for Name: dcim_inventoryitem; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_inventoryitem (id, name, part_id, serial, discovered, device_id, parent_id, manufacturer_id, asset_tag, description, _name, label, level, lft, rght, tree_id) FROM stdin;
\.


--
-- Data for Name: dcim_manufacturer; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_manufacturer (id, name, slug, created, last_updated, description) FROM stdin;
1	Arista	arista	2021-03-03	2021-03-03 02:33:51.780505+00	
\.


--
-- Data for Name: dcim_platform; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_platform (id, name, slug, napalm_driver, manufacturer_id, created, last_updated, napalm_args, description) FROM stdin;
\.


--
-- Data for Name: dcim_powerfeed; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerfeed (id, created, last_updated, name, status, type, supply, phase, voltage, amperage, max_utilization, available_power, comments, cable_id, power_panel_id, rack_id, custom_field_data, _cable_peer_id, _cable_peer_type_id, _path_id) FROM stdin;
\.


--
-- Data for Name: dcim_poweroutlet; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_poweroutlet (id, name, device_id, cable_id, description, feed_leg, power_port_id, type, _name, label, _cable_peer_id, _cable_peer_type_id, _path_id) FROM stdin;
\.


--
-- Data for Name: dcim_poweroutlettemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_poweroutlettemplate (id, name, device_type_id, feed_leg, power_port_id, type, _name, label, description) FROM stdin;
\.


--
-- Data for Name: dcim_powerpanel; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerpanel (id, created, last_updated, name, rack_group_id, site_id, custom_field_data) FROM stdin;
\.


--
-- Data for Name: dcim_powerport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerport (id, name, device_id, cable_id, description, allocated_draw, maximum_draw, type, _name, label, _cable_peer_id, _cable_peer_type_id, _path_id) FROM stdin;
\.


--
-- Data for Name: dcim_powerporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerporttemplate (id, name, device_type_id, allocated_draw, maximum_draw, type, _name, label, description) FROM stdin;
\.


--
-- Data for Name: dcim_rack; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rack (id, created, last_updated, name, facility_id, u_height, comments, group_id, site_id, tenant_id, type, width, role_id, desc_units, serial, status, asset_tag, outer_depth, outer_unit, outer_width, _name, custom_field_data) FROM stdin;
\.


--
-- Data for Name: dcim_rackgroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rackgroup (id, name, slug, site_id, created, last_updated, parent_id, level, lft, rght, tree_id, description) FROM stdin;
\.


--
-- Data for Name: dcim_rackreservation; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rackreservation (id, units, created, description, rack_id, user_id, tenant_id, last_updated, custom_field_data) FROM stdin;
\.


--
-- Data for Name: dcim_rackrole; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rackrole (id, name, slug, color, created, last_updated, description) FROM stdin;
\.


--
-- Data for Name: dcim_rearport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rearport (id, name, type, positions, description, device_id, cable_id, _name, label, _cable_peer_id, _cable_peer_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_rearporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rearporttemplate (id, name, type, positions, device_type_id, _name, label, description) FROM stdin;
\.


--
-- Data for Name: dcim_region; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_region (id, name, slug, lft, rght, tree_id, level, parent_id, created, last_updated, description) FROM stdin;
\.


--
-- Data for Name: dcim_site; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_site (id, created, last_updated, name, slug, facility, asn, physical_address, shipping_address, comments, tenant_id, contact_email, contact_name, contact_phone, region_id, description, status, time_zone, latitude, longitude, _name, custom_field_data) FROM stdin;
1	2021-03-03	2021-03-03 02:51:51.700897+00	Vagrant Test Lab	vagrant-test-lab		\N				\N				\N		active		\N	\N	Vagrant Test Lab	{}
\.


--
-- Data for Name: dcim_virtualchassis; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_virtualchassis (id, domain, master_id, created, last_updated, name, custom_field_data) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-03-23 20:43:16.696909+00	1	BGP ASN	1	[{"added": {}}]	60	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	dcim	consoleport
2	dcim	consoleserverport
3	dcim	powerport
4	dcim	poweroutlet
5	dcim	interface
7	circuits	circuittermination
8	virtualization	vminterface
9	dcim	frontport
10	dcim	rearport
11	dcim	powerfeed
12	extras	report
13	dcim	device
14	admin	logentry
15	auth	permission
16	auth	group
17	auth	user
18	contenttypes	contenttype
19	sessions	session
20	taggit	tag
21	taggit	taggeditem
22	circuits	circuit
23	circuits	circuittype
24	circuits	provider
25	dcim	consoleporttemplate
26	dcim	consoleserverporttemplate
27	dcim	devicerole
28	dcim	devicetype
29	dcim	interfacetemplate
30	dcim	manufacturer
31	dcim	platform
32	dcim	poweroutlettemplate
33	dcim	powerporttemplate
34	dcim	rack
35	dcim	rackgroup
36	dcim	site
37	dcim	devicebay
38	dcim	devicebaytemplate
39	dcim	rackrole
40	dcim	rackreservation
41	dcim	region
42	dcim	inventoryitem
43	dcim	virtualchassis
44	dcim	frontporttemplate
45	dcim	rearporttemplate
46	dcim	cable
47	dcim	powerpanel
48	dcim	cablepath
49	ipam	aggregate
50	ipam	ipaddress
51	ipam	prefix
52	ipam	rir
53	ipam	role
54	ipam	vlan
55	ipam	vrf
56	ipam	vlangroup
57	ipam	service
58	ipam	routetarget
59	extras	exporttemplate
60	extras	customfield
61	extras	imageattachment
62	extras	webhook
63	extras	objectchange
64	extras	configcontext
65	extras	tag
66	extras	taggeditem
67	extras	customlink
68	extras	script
69	extras	jobresult
70	secrets	secret
71	secrets	secretrole
72	secrets	userkey
73	secrets	sessionkey
74	tenancy	tenant
75	tenancy	tenantgroup
76	users	token
77	users	userconfig
78	users	admingroup
79	users	adminuser
80	users	objectpermission
81	virtualization	cluster
82	virtualization	clustergroup
83	virtualization	clustertype
84	virtualization	virtualmachine
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-03-01 20:53:16.265768+00
2	auth	0001_initial	2021-03-01 20:53:16.343924+00
3	admin	0001_initial	2021-03-01 20:53:16.494116+00
4	admin	0002_logentry_remove_auto_add	2021-03-01 20:53:16.528613+00
5	admin	0003_logentry_add_action_flag_choices	2021-03-01 20:53:16.537748+00
6	contenttypes	0002_remove_content_type_name	2021-03-01 20:53:16.558334+00
7	auth	0002_alter_permission_name_max_length	2021-03-01 20:53:16.567466+00
8	auth	0003_alter_user_email_max_length	2021-03-01 20:53:16.576411+00
9	auth	0004_alter_user_username_opts	2021-03-01 20:53:16.585004+00
10	auth	0005_alter_user_last_login_null	2021-03-01 20:53:16.5942+00
11	auth	0006_require_contenttypes_0002	2021-03-01 20:53:16.59588+00
12	auth	0007_alter_validators_add_error_messages	2021-03-01 20:53:16.604628+00
13	auth	0008_alter_user_username_max_length	2021-03-01 20:53:16.616197+00
14	auth	0009_alter_user_last_name_max_length	2021-03-01 20:53:16.635145+00
15	auth	0010_alter_group_name_max_length	2021-03-01 20:53:16.646329+00
16	auth	0011_update_proxy_permissions	2021-03-01 20:53:16.655484+00
17	auth	0012_alter_user_first_name_max_length	2021-03-01 20:53:16.664811+00
18	tenancy	0001_initial	2021-03-01 20:53:16.730899+00
19	tenancy	0002_tenant_group_optional	2021-03-01 20:53:16.793324+00
20	tenancy	0003_unicode_literals	2021-03-01 20:53:16.797833+00
21	dcim	0001_initial	2021-03-01 20:53:17.1882+00
22	ipam	0001_initial	2021-03-01 20:53:17.677782+00
23	ipam	0002_vrf_add_enforce_unique	2021-03-01 20:53:17.815578+00
24	dcim	0002_auto_20160622_1821	2021-03-01 20:53:18.172845+00
25	dcim	0003_auto_20160628_1721	2021-03-01 20:53:18.250774+00
26	dcim	0004_auto_20160701_2049	2021-03-01 20:53:18.351785+00
27	dcim	0005_auto_20160706_1722	2021-03-01 20:53:18.401024+00
28	dcim	0006_add_device_primary_ip4_ip6	2021-03-01 20:53:18.557901+00
29	dcim	0007_device_copy_primary_ip	2021-03-01 20:53:18.602519+00
30	dcim	0008_device_remove_primary_ip	2021-03-01 20:53:18.638084+00
31	dcim	0009_site_32bit_asn_support	2021-03-01 20:53:18.704037+00
32	dcim	0010_devicebay_installed_device_set_null	2021-03-01 20:53:18.744308+00
33	ipam	0003_ipam_add_vlangroups	2021-03-01 20:53:18.817854+00
34	ipam	0004_ipam_vlangroup_uniqueness	2021-03-01 20:53:18.900767+00
35	ipam	0005_auto_20160725_1842	2021-03-01 20:53:18.931395+00
36	ipam	0006_vrf_vlan_add_tenant	2021-03-01 20:53:18.990396+00
37	ipam	0007_prefix_ipaddress_add_tenant	2021-03-01 20:53:19.087231+00
38	ipam	0008_prefix_change_order	2021-03-01 20:53:19.121667+00
39	ipam	0009_ipaddress_add_status	2021-03-01 20:53:19.139025+00
40	ipam	0010_ipaddress_help_texts	2021-03-01 20:53:19.1892+00
41	ipam	0011_rir_add_is_private	2021-03-01 20:53:19.197394+00
42	dcim	0011_devicetype_part_number	2021-03-01 20:53:19.21019+00
43	dcim	0012_site_rack_device_add_tenant	2021-03-01 20:53:19.295691+00
44	dcim	0013_add_interface_form_factors	2021-03-01 20:53:19.350211+00
45	dcim	0014_rack_add_type_width	2021-03-01 20:53:19.381912+00
46	dcim	0015_rack_add_u_height_validator	2021-03-01 20:53:19.398038+00
47	dcim	0016_module_add_manufacturer	2021-03-01 20:53:19.427719+00
48	dcim	0017_rack_add_role	2021-03-01 20:53:19.494998+00
49	dcim	0018_device_add_asset_tag	2021-03-01 20:53:19.560567+00
50	dcim	0019_new_iface_form_factors	2021-03-01 20:53:19.698789+00
51	dcim	0020_rack_desc_units	2021-03-01 20:53:19.718661+00
52	dcim	0021_add_ff_flexstack	2021-03-01 20:53:19.775466+00
53	dcim	0022_color_names_to_rgb	2021-03-01 20:53:19.943482+00
54	ipam	0012_services	2021-03-01 20:53:20.048428+00
55	ipam	0013_prefix_add_is_pool	2021-03-01 20:53:20.208312+00
56	ipam	0014_ipaddress_status_add_deprecated	2021-03-01 20:53:20.23469+00
57	ipam	0015_global_vlans	2021-03-01 20:53:20.302505+00
58	ipam	0016_unicode_literals	2021-03-01 20:53:20.899052+00
59	ipam	0017_ipaddress_roles	2021-03-01 20:53:20.94291+00
60	ipam	0018_remove_service_uniqueness_constraint	2021-03-01 20:53:20.963636+00
61	dcim	0023_devicetype_comments	2021-03-01 20:53:20.976689+00
62	dcim	0024_site_add_contact_fields	2021-03-01 20:53:21.069163+00
63	dcim	0025_devicetype_add_interface_ordering	2021-03-01 20:53:21.081707+00
64	dcim	0026_add_rack_reservations	2021-03-01 20:53:21.140122+00
65	dcim	0027_device_add_site	2021-03-01 20:53:21.209127+00
66	dcim	0028_device_copy_rack_to_site	2021-03-01 20:53:21.286672+00
67	dcim	0029_allow_rackless_devices	2021-03-01 20:53:21.374532+00
68	dcim	0030_interface_add_lag	2021-03-01 20:53:21.440068+00
69	dcim	0031_regions	2021-03-01 20:53:21.609832+00
70	dcim	0032_device_increase_name_length	2021-03-01 20:53:21.745073+00
71	dcim	0033_rackreservation_rack_editable	2021-03-01 20:53:21.788804+00
72	dcim	0034_rename_module_to_inventoryitem	2021-03-01 20:53:21.981203+00
73	dcim	0035_device_expand_status_choices	2021-03-01 20:53:22.362824+00
74	dcim	0036_add_ff_juniper_vcp	2021-03-01 20:53:22.404141+00
75	dcim	0037_unicode_literals	2021-03-01 20:53:23.15484+00
76	dcim	0038_wireless_interfaces	2021-03-01 20:53:23.181879+00
77	dcim	0039_interface_add_enabled_mtu	2021-03-01 20:53:23.21693+00
78	dcim	0040_inventoryitem_add_asset_tag_description	2021-03-01 20:53:23.254506+00
79	dcim	0041_napalm_integration	2021-03-01 20:53:23.340079+00
80	dcim	0042_interface_ff_10ge_cx4	2021-03-01 20:53:23.370138+00
81	dcim	0043_device_component_name_lengths	2021-03-01 20:53:23.635976+00
82	virtualization	0001_virtualization	2021-03-01 20:53:23.897772+00
83	virtualization	0002_virtualmachine_add_status	2021-03-01 20:53:24.052168+00
84	dcim	0044_virtualization	2021-03-01 20:53:24.190978+00
85	virtualization	0003_cluster_add_site	2021-03-01 20:53:24.261687+00
86	virtualization	0004_virtualmachine_add_role	2021-03-01 20:53:24.319693+00
87	virtualization	0005_django2	2021-03-01 20:53:24.389935+00
88	taggit	0001_initial	2021-03-01 20:53:24.468744+00
89	taggit	0002_auto_20150616_2121	2021-03-01 20:53:24.534218+00
90	virtualization	0006_tags	2021-03-01 20:53:24.756549+00
91	virtualization	0007_change_logging	2021-03-01 20:53:24.855824+00
92	virtualization	0008_virtualmachine_local_context_data	2021-03-01 20:53:24.877783+00
93	tenancy	0004_tags	2021-03-01 20:53:24.924702+00
94	tenancy	0005_change_logging	2021-03-01 20:53:24.973315+00
95	extras	0001_initial	2021-03-01 20:53:25.198272+00
96	extras	0002_custom_fields	2021-03-01 20:53:25.566951+00
97	extras	0003_exporttemplate_add_description	2021-03-01 20:53:25.691563+00
98	extras	0004_topologymap_change_comma_to_semicolon	2021-03-01 20:53:25.713356+00
99	extras	0005_useraction_add_bulk_create	2021-03-01 20:53:25.727756+00
100	extras	0006_add_imageattachments	2021-03-01 20:53:25.782729+00
101	extras	0007_unicode_literals	2021-03-01 20:53:25.99608+00
102	extras	0008_reports	2021-03-01 20:53:26.116343+00
103	extras	0009_topologymap_type	2021-03-01 20:53:26.17425+00
104	extras	0010_customfield_filter_logic	2021-03-01 20:53:26.272138+00
105	extras	0011_django2	2021-03-01 20:53:26.572738+00
106	extras	0012_webhooks	2021-03-01 20:53:26.684366+00
107	extras	0013_objectchange	2021-03-01 20:53:26.815374+00
108	ipam	0019_virtualization	2021-03-01 20:53:26.988963+00
109	ipam	0020_ipaddress_add_role_carp	2021-03-01 20:53:27.055614+00
110	dcim	0045_devicerole_vm_role	2021-03-01 20:53:27.065608+00
111	dcim	0046_rack_lengthen_facility_id	2021-03-01 20:53:27.091517+00
112	dcim	0047_more_100ge_form_factors	2021-03-01 20:53:27.13059+00
113	dcim	0048_rack_serial	2021-03-01 20:53:27.170759+00
114	dcim	0049_rackreservation_change_user	2021-03-01 20:53:27.235129+00
115	dcim	0050_interface_vlan_tagging	2021-03-01 20:53:27.473398+00
116	dcim	0051_rackreservation_tenant	2021-03-01 20:53:27.567975+00
117	dcim	0052_virtual_chassis	2021-03-01 20:53:27.812454+00
118	dcim	0053_platform_manufacturer	2021-03-01 20:53:27.891717+00
119	dcim	0054_site_status_timezone_description	2021-03-01 20:53:27.970589+00
120	dcim	0055_virtualchassis_ordering	2021-03-01 20:53:28.048839+00
121	dcim	0056_django2	2021-03-01 20:53:28.267652+00
122	dcim	0057_tags	2021-03-01 20:53:29.039268+00
123	dcim	0058_relax_rack_naming_constraints	2021-03-01 20:53:29.127154+00
124	dcim	0059_site_latitude_longitude	2021-03-01 20:53:29.204786+00
125	dcim	0060_change_logging	2021-03-01 20:53:29.870412+00
126	dcim	0061_platform_napalm_args	2021-03-01 20:53:29.884881+00
127	extras	0014_configcontexts	2021-03-01 20:53:30.213699+00
128	extras	0015_remove_useraction	2021-03-01 20:53:30.657582+00
129	extras	0016_exporttemplate_add_cable	2021-03-01 20:53:30.717704+00
130	extras	0017_exporttemplate_mime_type_length	2021-03-01 20:53:30.733763+00
131	extras	0018_exporttemplate_add_jinja2	2021-03-01 20:53:30.80487+00
132	extras	0019_tag_taggeditem	2021-03-01 20:53:30.912314+00
133	virtualization	0009_custom_tag_models	2021-03-01 20:53:31.094574+00
134	virtualization	0010_cluster_add_tenant	2021-03-01 20:53:31.243177+00
135	virtualization	0011_3569_virtualmachine_fields	2021-03-01 20:53:31.446721+00
136	tenancy	0006_custom_tag_models	2021-03-01 20:53:31.508785+00
137	virtualization	0012_vm_name_nonunique	2021-03-01 20:53:31.585567+00
138	virtualization	0013_deterministic_ordering	2021-03-01 20:53:31.62556+00
139	virtualization	0014_standardize_description	2021-03-01 20:53:31.641668+00
140	ipam	0021_vrf_ordering	2021-03-01 20:53:31.667766+00
141	ipam	0022_tags	2021-03-01 20:53:32.119607+00
142	ipam	0023_change_logging	2021-03-01 20:53:32.772225+00
143	ipam	0024_vrf_allow_null_rd	2021-03-01 20:53:32.808781+00
144	ipam	0025_custom_tag_models	2021-03-01 20:53:33.262051+00
145	ipam	0026_prefix_ordering_vrf_nulls_first	2021-03-01 20:53:33.29142+00
146	ipam	0027_ipaddress_add_dns_name	2021-03-01 20:53:33.320272+00
147	ipam	0028_3569_prefix_fields	2021-03-01 20:53:33.510508+00
148	ipam	0029_3569_ipaddress_fields	2021-03-01 20:53:34.093186+00
149	ipam	0030_3569_vlan_fields	2021-03-01 20:53:34.303672+00
150	ipam	0031_3569_service_fields	2021-03-01 20:53:34.449787+00
151	ipam	0032_role_description	2021-03-01 20:53:34.462985+00
152	ipam	0033_deterministic_ordering	2021-03-01 20:53:34.767837+00
153	ipam	0034_fix_ipaddress_status_dhcp	2021-03-01 20:53:34.838082+00
154	ipam	0035_drop_ip_family	2021-03-01 20:53:34.994227+00
155	ipam	0036_standardize_description	2021-03-01 20:53:35.241934+00
156	secrets	0001_initial	2021-03-01 20:53:35.72091+00
157	secrets	0002_userkey_add_session_key	2021-03-01 20:53:35.994873+00
158	secrets	0003_unicode_literals	2021-03-01 20:53:36.022138+00
159	secrets	0004_tags	2021-03-01 20:53:36.096269+00
160	secrets	0005_change_logging	2021-03-01 20:53:36.305557+00
161	secrets	0006_custom_tag_models	2021-03-01 20:53:36.377061+00
162	dcim	0062_interface_mtu	2021-03-01 20:53:36.507324+00
163	dcim	0063_device_local_context_data	2021-03-01 20:53:36.556077+00
164	dcim	0064_remove_platform_rpc_client	2021-03-01 20:53:36.573539+00
165	dcim	0065_front_rear_ports	2021-03-01 20:53:37.771095+00
166	circuits	0001_initial	2021-03-01 20:53:38.000545+00
167	circuits	0002_auto_20160622_1821	2021-03-01 20:53:38.341559+00
168	circuits	0003_provider_32bit_asn_support	2021-03-01 20:53:38.437729+00
169	circuits	0004_circuit_add_tenant	2021-03-01 20:53:38.636315+00
170	circuits	0005_circuit_add_upstream_speed	2021-03-01 20:53:38.687955+00
171	circuits	0006_terminations	2021-03-01 20:53:39.201922+00
172	dcim	0066_cables	2021-03-01 20:53:41.755266+00
173	dcim	0067_device_type_remove_qualifiers	2021-03-01 20:53:42.049696+00
174	dcim	0068_rack_new_fields	2021-03-01 20:53:42.364144+00
175	dcim	0069_deprecate_nullablecharfield	2021-03-01 20:53:42.623139+00
176	dcim	0070_custom_tag_models	2021-03-01 20:53:43.958424+00
177	circuits	0007_circuit_add_description	2021-03-01 20:53:44.095683+00
178	circuits	0008_circuittermination_interface_protect_on_delete	2021-03-01 20:53:44.192929+00
179	circuits	0009_unicode_literals	2021-03-01 20:53:44.515044+00
180	circuits	0010_circuit_status	2021-03-01 20:53:44.553751+00
181	circuits	0011_tags	2021-03-01 20:53:44.851819+00
182	circuits	0012_change_logging	2021-03-01 20:53:44.962672+00
183	circuits	0013_cables	2021-03-01 20:53:45.328877+00
184	circuits	0014_circuittermination_description	2021-03-01 20:53:45.404172+00
185	circuits	0015_custom_tag_models	2021-03-01 20:53:45.662428+00
186	extras	0020_tag_data	2021-03-01 20:53:45.950349+00
187	extras	0021_add_color_comments_changelog_to_tag	2021-03-01 20:53:46.187984+00
188	extras	0022_custom_links	2021-03-01 20:53:46.597474+00
189	extras	0023_fix_tag_sequences	2021-03-01 20:53:46.627567+00
190	extras	0024_scripts	2021-03-01 20:53:46.633111+00
191	extras	0025_objectchange_time_index	2021-03-01 20:53:46.66278+00
192	extras	0026_webhook_ca_file_path	2021-03-01 20:53:46.690009+00
193	extras	0027_webhook_additional_headers	2021-03-01 20:53:46.710152+00
194	extras	0028_remove_topology_maps	2021-03-01 20:53:46.717451+00
195	extras	0029_3569_customfield_fields	2021-03-01 20:53:47.314227+00
196	extras	0030_3569_objectchange_fields	2021-03-01 20:53:47.533846+00
197	extras	0031_3569_exporttemplate_fields	2021-03-01 20:53:47.695766+00
198	extras	0032_3569_webhook_fields	2021-03-01 20:53:47.840212+00
199	extras	0033_graph_type_template_language	2021-03-01 20:53:48.147672+00
200	extras	0034_configcontext_tags	2021-03-01 20:53:48.226471+00
201	extras	0035_deterministic_ordering	2021-03-01 20:53:48.336302+00
202	extras	0036_contenttype_filters_to_q_objects	2021-03-01 20:53:48.940895+00
203	extras	0037_configcontexts_clusters	2021-03-01 20:53:49.125665+00
204	extras	0038_webhook_template_support	2021-03-01 20:53:49.418625+00
205	extras	0039_update_features_content_types	2021-03-01 20:53:50.003748+00
206	extras	0040_standardize_description	2021-03-01 20:53:50.074374+00
207	extras	0041_tag_description	2021-03-01 20:53:50.311376+00
208	extras	0042_customfield_manager	2021-03-01 20:53:50.329312+00
209	virtualization	0015_vminterface	2021-03-01 20:53:50.535278+00
210	ipam	0037_ipaddress_assignment	2021-03-01 20:53:50.950287+00
211	dcim	0071_device_components_add_description	2021-03-01 20:53:51.350902+00
212	dcim	0072_powerfeeds	2021-03-01 20:53:52.886214+00
213	dcim	0073_interface_form_factor_to_type	2021-03-01 20:53:53.117139+00
214	dcim	0074_increase_field_length_platform_name_slug	2021-03-01 20:53:53.277395+00
215	dcim	0075_cable_devices	2021-03-01 20:53:53.705037+00
216	dcim	0076_console_port_types	2021-03-01 20:53:53.891497+00
217	dcim	0077_power_types	2021-03-01 20:53:54.044413+00
218	dcim	0078_3569_site_fields	2021-03-01 20:53:54.582608+00
219	dcim	0079_3569_rack_fields	2021-03-01 20:53:55.73209+00
220	dcim	0080_3569_devicetype_fields	2021-03-01 20:53:56.16341+00
221	dcim	0081_3569_device_fields	2021-03-01 20:53:57.128064+00
222	dcim	0082_3569_interface_fields	2021-03-01 20:53:57.894961+00
223	virtualization	0016_replicate_interfaces	2021-03-01 20:53:58.105568+00
224	dcim	0082_3569_port_fields	2021-03-01 20:53:58.914978+00
225	dcim	0083_3569_cable_fields	2021-03-01 20:54:00.034181+00
226	dcim	0084_3569_powerfeed_fields	2021-03-01 20:54:01.231804+00
227	dcim	0085_3569_poweroutlet_fields	2021-03-01 20:54:01.714002+00
228	dcim	0086_device_name_nonunique	2021-03-01 20:54:02.029178+00
229	dcim	0087_role_descriptions	2021-03-01 20:54:02.067175+00
230	dcim	0088_powerfeed_available_power	2021-03-01 20:54:02.287221+00
231	dcim	0089_deterministic_ordering	2021-03-01 20:54:02.438696+00
232	dcim	0090_cable_termination_models	2021-03-01 20:54:02.653641+00
233	dcim	0091_interface_type_other	2021-03-01 20:54:02.743445+00
234	dcim	0092_fix_rack_outer_unit	2021-03-01 20:54:02.98631+00
235	dcim	0093_device_component_ordering	2021-03-01 20:54:04.83478+00
236	dcim	0094_device_component_template_ordering	2021-03-01 20:54:05.709693+00
237	dcim	0095_primary_model_ordering	2021-03-01 20:54:06.372108+00
238	dcim	0096_interface_ordering	2021-03-01 20:54:06.822851+00
239	dcim	0097_interfacetemplate_type_other	2021-03-01 20:54:06.908421+00
240	dcim	0098_devicetype_images	2021-03-01 20:54:07.007426+00
241	dcim	0099_powerfeed_negative_voltage	2021-03-01 20:54:07.06257+00
242	dcim	0100_mptt_remove_indexes	2021-03-01 20:54:07.312329+00
243	dcim	0101_nested_rackgroups	2021-03-01 20:54:07.71809+00
244	dcim	0102_nested_rackgroups_rebuild	2021-03-01 20:54:07.832803+00
245	dcim	0103_standardize_description	2021-03-01 20:54:08.697066+00
246	dcim	0104_correct_infiniband_types	2021-03-01 20:54:08.799579+00
247	dcim	0105_interface_name_collation	2021-03-01 20:54:08.857948+00
248	dcim	0106_role_default_color	2021-03-01 20:54:09.059459+00
249	dcim	0107_component_labels	2021-03-01 20:54:09.853807+00
250	dcim	0108_add_tags	2021-03-01 20:54:10.161009+00
251	dcim	0109_interface_remove_vm	2021-03-01 20:54:10.401231+00
252	dcim	0110_virtualchassis_name	2021-03-01 20:54:10.931037+00
253	dcim	0111_component_template_description	2021-03-01 20:54:11.081492+00
254	dcim	0112_standardize_components	2021-03-01 20:54:12.807819+00
255	dcim	0113_nullbooleanfield_to_booleanfield	2021-03-01 20:54:13.262025+00
256	dcim	0114_update_jsonfield	2021-03-01 20:54:13.437081+00
257	dcim	0115_rackreservation_order	2021-03-01 20:54:13.525209+00
258	dcim	0116_rearport_max_positions	2021-03-01 20:54:13.807708+00
259	dcim	0117_custom_field_data	2021-03-01 20:54:14.526281+00
260	dcim	0118_inventoryitem_mptt	2021-03-01 20:54:14.873418+00
261	dcim	0119_inventoryitem_mptt_rebuild	2021-03-01 20:54:14.997168+00
262	dcim	0120_cache_cable_peer	2021-03-01 20:54:16.715567+00
263	dcim	0121_cablepath	2021-03-01 20:54:19.173393+00
264	circuits	0016_3569_circuit_fields	2021-03-01 20:54:19.509246+00
265	circuits	0017_circuittype_description	2021-03-01 20:54:19.519918+00
266	circuits	0018_standardize_description	2021-03-01 20:54:19.637002+00
267	circuits	0019_nullbooleanfield_to_booleanfield	2021-03-01 20:54:19.686924+00
268	circuits	0020_custom_field_data	2021-03-01 20:54:19.923319+00
269	circuits	0021_cache_cable_peer	2021-03-01 20:54:20.143148+00
270	circuits	0022_cablepath	2021-03-01 20:54:20.385377+00
271	circuits	0023_circuittermination_port_speed_optional	2021-03-01 20:54:20.458269+00
272	circuits	0024_standardize_name_length	2021-03-01 20:54:20.778566+00
273	dcim	0122_standardize_name_length	2021-03-01 20:54:21.816901+00
274	virtualization	0017_update_jsonfield	2021-03-01 20:54:21.871599+00
275	virtualization	0018_custom_field_data	2021-03-01 20:54:22.11178+00
276	tenancy	0007_nested_tenantgroups	2021-03-01 20:54:22.256147+00
277	tenancy	0008_nested_tenantgroups_rebuild	2021-03-01 20:54:22.390602+00
278	tenancy	0009_standardize_description	2021-03-01 20:54:22.504868+00
279	tenancy	0010_custom_field_data	2021-03-01 20:54:22.556095+00
280	users	0001_api_tokens	2021-03-01 20:54:22.775043+00
281	users	0002_unicode_literals	2021-03-01 20:54:22.823926+00
282	users	0003_token_permissions	2021-03-01 20:54:22.84169+00
283	users	0004_standardize_description	2021-03-01 20:54:22.860997+00
284	users	0005_userconfig	2021-03-01 20:54:22.971442+00
285	users	0006_create_userconfigs	2021-03-01 20:54:23.062244+00
286	users	0007_proxy_group_user	2021-03-01 20:54:23.06995+00
287	users	0008_objectpermission	2021-03-01 20:54:23.20265+00
288	users	0009_replicate_permissions	2021-03-01 20:54:23.394138+00
289	secrets	0007_secretrole_description	2021-03-01 20:54:23.418787+00
290	secrets	0008_standardize_description	2021-03-01 20:54:23.445651+00
291	secrets	0009_secretrole_drop_users_groups	2021-03-01 20:54:23.784241+00
292	secrets	0010_custom_field_data	2021-03-01 20:54:23.846751+00
293	ipam	0038_custom_field_data	2021-03-01 20:54:24.228822+00
294	extras	0043_report	2021-03-01 20:54:24.240283+00
295	extras	0044_jobresult	2021-03-01 20:54:24.578313+00
296	extras	0045_configcontext_changelog	2021-03-01 20:54:24.74613+00
297	extras	0046_update_jsonfield	2021-03-01 20:54:24.913053+00
298	extras	0047_tag_ordering	2021-03-01 20:54:24.971068+00
299	extras	0048_exporttemplate_remove_template_language	2021-03-01 20:54:25.011433+00
300	extras	0049_remove_graph	2021-03-01 20:54:25.017934+00
301	extras	0050_customfield_changes	2021-03-01 20:54:25.527633+00
302	extras	0051_migrate_customfields	2021-03-01 20:54:25.881154+00
303	extras	0052_customfield_cleanup	2021-03-01 20:54:26.108359+00
304	extras	0053_rename_webhook_obj_type	2021-03-01 20:54:26.159516+00
305	tenancy	0011_standardize_name_length	2021-03-01 20:54:26.514599+00
306	ipam	0039_service_ports_array	2021-03-01 20:54:26.827335+00
307	ipam	0040_service_drop_port	2021-03-01 20:54:26.883248+00
308	ipam	0041_routetarget	2021-03-01 20:54:27.166917+00
309	ipam	0042_standardize_name_length	2021-03-01 20:54:27.591564+00
310	ipam	0043_add_tenancy_to_aggregates	2021-03-01 20:54:27.694656+00
311	secrets	0011_secret_generic_assignments	2021-03-01 20:54:28.440349+00
312	secrets	0012_standardize_name_length	2021-03-01 20:54:28.478739+00
313	sessions	0001_initial	2021-03-01 20:54:28.497629+00
314	taggit	0003_taggeditem_add_unique_index	2021-03-01 20:54:28.569436+00
315	users	0010_update_jsonfield	2021-03-01 20:54:28.646119+00
316	virtualization	0019_standardize_name_length	2021-03-01 20:54:28.879563+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
wo9e2ftb0qbn08hr3vsny4lqz8eow4cw	.eJxVjEEKwjAQAP-Ss5Rs06ypRz-gPwibzZZEMYUmBUH8uy140OvMMC_laW3Jr1UWn6M6KVCHXxaI71J2UaSF-dntSkrLTC3PpbuEm3C7yvLItW7g_O3_Jolq2g6DRIPSG3LWWZooGoZx0A4laI2MFlioj84ay6NEDWKPAIDI_YTGiXp_ADy1Oe8:1lGpYz:PcbqdXlm5EStJbsv6kkgbomhs4MK5DwLipoWtUj7Pvc	2021-03-15 20:54:45.705352+00
4jlwr4hgzk9pajyxrpfgnm10gfc8p2ur	.eJxVjEEKwjAQAP-Ss5Rs06ypRz-gPwibzZZEMYUmBUH8uy140OvMMC_laW3Jr1UWn6M6KVCHXxaI71J2UaSF-dntSkrLTC3PpbuEm3C7yvLItW7g_O3_Jolq2g6DRIPSG3LWWZooGoZx0A4laI2MFlioj84ay6NEDWKPAIDI_YTGiXp_ADy1Oe8:1lHSUc:ywe6Pj2mw-Qm7Kj41SlEWqhPFIuWBxXqgqaRoGcebPQ	2021-03-17 14:28:50.56564+00
73l8gxo4ef5ufjki2je4goxkmqv5aqi1	.eJxVjEEKwjAQAP-Ss5Rs06ypRz-gPwibzZZEMYUmBUH8uy140OvMMC_laW3Jr1UWn6M6KVCHXxaI71J2UaSF-dntSkrLTC3PpbuEm3C7yvLItW7g_O3_Jolq2g6DRIPSG3LWWZooGoZx0A4laI2MFlioj84ay6NEDWKPAIDI_YTGiXp_ADy1Oe8:1lMdGD:mB9AFXjXeSAsAbkoFTROjn-k-tI06GQLroGmame84zs	2021-03-31 20:59:21.928493+00
84uxihok1de57808zthvac1exgjhinsk	.eJxVjEEKwjAQAP-Ss5Rs06ypRz-gPwibzZZEMYUmBUH8uy140OvMMC_laW3Jr1UWn6M6KVCHXxaI71J2UaSF-dntSkrLTC3PpbuEm3C7yvLItW7g_O3_Jolq2g6DRIPSG3LWWZooGoZx0A4laI2MFlioj84ay6NEDWKPAIDI_YTGiXp_ADy1Oe8:1lRHFX:QF1iOBy4Kypz5YsCIEMAiddJgosI7XzlmE1BO-iGZ8U	2021-04-13 16:29:51.107256+00
\.


--
-- Data for Name: extras_configcontext; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext (id, name, weight, description, is_active, data, created, last_updated) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_cluster_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_cluster_groups (id, configcontext_id, clustergroup_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_clusters; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_clusters (id, configcontext_id, cluster_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_platforms; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_platforms (id, configcontext_id, platform_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_regions; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_regions (id, configcontext_id, region_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_roles; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_roles (id, configcontext_id, devicerole_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_sites; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_sites (id, configcontext_id, site_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_tags; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_tags (id, configcontext_id, tag_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_tenant_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_tenant_groups (id, configcontext_id, tenantgroup_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_tenants; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_tenants (id, configcontext_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: extras_customfield; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_customfield (id, type, name, label, description, required, weight, filter_logic, choices, "default", validation_maximum, validation_minimum, validation_regex) FROM stdin;
1	integer	bgp_asn	BGP ASN		f	100	loose	{}	\N	\N	\N	
\.


--
-- Data for Name: extras_customfield_content_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_customfield_content_types (id, customfield_id, contenttype_id) FROM stdin;
1	1	13
\.


--
-- Data for Name: extras_customlink; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_customlink (id, name, text, url, weight, group_name, button_class, new_window, content_type_id) FROM stdin;
\.


--
-- Data for Name: extras_exporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_exporttemplate (id, name, template_code, mime_type, file_extension, content_type_id, description) FROM stdin;
\.


--
-- Data for Name: extras_imageattachment; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_imageattachment (id, object_id, image, image_height, image_width, name, created, content_type_id) FROM stdin;
\.


--
-- Data for Name: extras_jobresult; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_jobresult (id, name, created, completed, status, data, job_id, obj_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: extras_objectchange; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_objectchange (id, "time", user_name, request_id, action, changed_object_id, related_object_id, object_repr, object_data, changed_object_type_id, related_object_type_id, user_id) FROM stdin;
1	2021-03-03 02:33:51.789451+00	admin	0aefc275-dc35-4289-a17f-ea7bdd98d2f1	create	1	\N	Arista	{"name": "Arista", "slug": "arista", "created": "2021-03-03", "description": "", "last_updated": "2021-03-03T02:33:51.780Z"}	30	\N	1
2	2021-03-03 02:48:25.545896+00	admin	fec4f0d7-3e04-4159-813b-d59f5af72222	create	1	\N	ceos-lab-container	{"slug": "ceos-lab-container", "tags": [], "model": "ceos-lab-container", "created": "2021-03-03", "comments": "", "u_height": 0, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2021-03-03T02:48:25.534Z", "manufacturer": 1, "custom_fields": {}, "is_full_depth": false, "subdevice_role": ""}	28	\N	1
3	2021-03-03 02:49:30.081478+00	admin	085a67a1-edab-4ce0-900f-c45cd3bdc647	create	1	1	Ethernet1-48	{"name": "Ethernet1-48", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
4	2021-03-03 02:49:42.476213+00	admin	d4b91a3d-0a18-438b-84dc-6d834419fb05	delete	1	1	Ethernet1-48	{"name": "Ethernet1-48", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
5	2021-03-03 02:49:58.224924+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	2	1	Ethernet1	{"name": "Ethernet1", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
6	2021-03-03 02:49:58.226816+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	3	1	Ethernet2	{"name": "Ethernet2", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
7	2021-03-03 02:49:58.228338+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	4	1	Ethernet3	{"name": "Ethernet3", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
8	2021-03-03 02:49:58.230049+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	5	1	Ethernet4	{"name": "Ethernet4", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
9	2021-03-03 02:49:58.231573+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	6	1	Ethernet5	{"name": "Ethernet5", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
10	2021-03-03 02:49:58.233145+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	7	1	Ethernet6	{"name": "Ethernet6", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
11	2021-03-03 02:49:58.234525+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	8	1	Ethernet7	{"name": "Ethernet7", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
12	2021-03-03 02:49:58.235935+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	9	1	Ethernet8	{"name": "Ethernet8", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
13	2021-03-03 02:49:58.237596+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	10	1	Ethernet9	{"name": "Ethernet9", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
14	2021-03-03 02:49:58.239043+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	11	1	Ethernet10	{"name": "Ethernet10", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
15	2021-03-03 02:49:58.240526+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	12	1	Ethernet11	{"name": "Ethernet11", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
16	2021-03-03 02:49:58.242318+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	13	1	Ethernet12	{"name": "Ethernet12", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
17	2021-03-03 02:49:58.244101+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	14	1	Ethernet13	{"name": "Ethernet13", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
18	2021-03-03 02:49:58.24607+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	15	1	Ethernet14	{"name": "Ethernet14", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
19	2021-03-03 02:49:58.248181+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	16	1	Ethernet15	{"name": "Ethernet15", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
20	2021-03-03 02:49:58.250118+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	17	1	Ethernet16	{"name": "Ethernet16", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
21	2021-03-03 02:49:58.251893+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	18	1	Ethernet17	{"name": "Ethernet17", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
22	2021-03-03 02:49:58.25369+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	19	1	Ethernet18	{"name": "Ethernet18", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
23	2021-03-03 02:49:58.255393+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	20	1	Ethernet19	{"name": "Ethernet19", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
24	2021-03-03 02:49:58.25716+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	21	1	Ethernet20	{"name": "Ethernet20", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
25	2021-03-03 02:49:58.261118+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	22	1	Ethernet21	{"name": "Ethernet21", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
26	2021-03-03 02:49:58.26328+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	23	1	Ethernet22	{"name": "Ethernet22", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
27	2021-03-03 02:49:58.265386+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	24	1	Ethernet23	{"name": "Ethernet23", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
28	2021-03-03 02:49:58.267083+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	25	1	Ethernet24	{"name": "Ethernet24", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
29	2021-03-03 02:49:58.269412+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	26	1	Ethernet25	{"name": "Ethernet25", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
30	2021-03-03 02:49:58.271043+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	27	1	Ethernet26	{"name": "Ethernet26", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
31	2021-03-03 02:49:58.272711+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	28	1	Ethernet27	{"name": "Ethernet27", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
32	2021-03-03 02:49:58.274386+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	29	1	Ethernet28	{"name": "Ethernet28", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
33	2021-03-03 02:49:58.276209+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	30	1	Ethernet29	{"name": "Ethernet29", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
34	2021-03-03 02:49:58.278032+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	31	1	Ethernet30	{"name": "Ethernet30", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
35	2021-03-03 02:49:58.279951+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	32	1	Ethernet31	{"name": "Ethernet31", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
36	2021-03-03 02:49:58.281927+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	33	1	Ethernet32	{"name": "Ethernet32", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
37	2021-03-03 02:49:58.283697+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	34	1	Ethernet33	{"name": "Ethernet33", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
38	2021-03-03 02:49:58.286643+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	35	1	Ethernet34	{"name": "Ethernet34", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
39	2021-03-03 02:49:58.288655+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	36	1	Ethernet35	{"name": "Ethernet35", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
40	2021-03-03 02:49:58.290278+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	37	1	Ethernet36	{"name": "Ethernet36", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
41	2021-03-03 02:49:58.291937+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	38	1	Ethernet37	{"name": "Ethernet37", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
42	2021-03-03 02:49:58.293823+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	39	1	Ethernet38	{"name": "Ethernet38", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
43	2021-03-03 02:49:58.295595+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	40	1	Ethernet39	{"name": "Ethernet39", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
44	2021-03-03 02:49:58.297501+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	41	1	Ethernet40	{"name": "Ethernet40", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
45	2021-03-03 02:49:58.299389+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	42	1	Ethernet41	{"name": "Ethernet41", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
46	2021-03-03 02:49:58.301198+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	43	1	Ethernet42	{"name": "Ethernet42", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
47	2021-03-03 02:49:58.302915+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	44	1	Ethernet43	{"name": "Ethernet43", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
48	2021-03-03 02:49:58.304787+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	45	1	Ethernet44	{"name": "Ethernet44", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
49	2021-03-03 02:49:58.306565+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	46	1	Ethernet45	{"name": "Ethernet45", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
50	2021-03-03 02:49:58.308657+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	47	1	Ethernet46	{"name": "Ethernet46", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
51	2021-03-03 02:49:58.310448+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	48	1	Ethernet47	{"name": "Ethernet47", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
52	2021-03-03 02:49:58.312168+00	admin	88231afa-0835-4af9-8f08-09fd3117661e	create	49	1	Ethernet48	{"name": "Ethernet48", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
53	2021-03-03 02:50:53.327936+00	admin	29cc41c8-682c-4c74-bc94-06f11567d2fe	create	50	1	Loopback0	{"name": "Loopback0", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
54	2021-03-03 02:51:51.706249+00	admin	397a33d0-0be5-4971-b888-eb9946155e13	create	1	\N	Vagrant Test Lab	{"asn": null, "name": "Vagrant Test Lab", "slug": "vagrant-test-lab", "tags": [], "region": null, "status": "active", "tenant": null, "created": "2021-03-03", "comments": "", "facility": "", "latitude": null, "longitude": null, "time_zone": "", "description": "", "contact_name": "", "last_updated": "2021-03-03T02:51:51.700Z", "contact_email": "", "contact_phone": "", "custom_fields": {}, "physical_address": "", "shipping_address": ""}	36	\N	1
55	2021-03-03 02:52:25.652772+00	admin	3a23fc91-9cca-4178-aea0-a11b4138827e	create	1	\N	spine	{"name": "spine", "slug": "spine", "color": "f44336", "created": "2021-03-03", "vm_role": true, "description": "", "last_updated": "2021-03-03T02:52:25.649Z"}	27	\N	1
56	2021-03-03 02:53:02.372046+00	admin	f3252356-56a9-4650-a017-0d5193213c52	create	2	\N	leaf	{"name": "leaf", "slug": "leaf", "color": "2196f3", "created": "2021-03-03", "vm_role": true, "description": "", "last_updated": "2021-03-03T02:53:02.369Z"}	27	\N	1
57	2021-03-03 02:53:34.177423+00	admin	e25c6e11-22de-489a-a278-d44031bcf4a8	create	1	\N	spine-01	{"face": "", "name": "spine-01", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "cluster": null, "created": "2021-03-03", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2021-03-03T02:53:34.173Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	13	\N	1
58	2021-03-03 02:53:59.228184+00	admin	1cb32366-a083-4d66-b8e8-b16bd6c94a0a	create	2	\N	leaf-01	{"face": "", "name": "leaf-01", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "cluster": null, "created": "2021-03-03", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2021-03-03T02:53:59.224Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	13	\N	1
59	2021-03-03 02:54:06.325309+00	admin	c5b0d2c9-1ad5-4fe5-af2b-799791604ce5	create	3	\N	leaf-02	{"face": "", "name": "leaf-02", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "cluster": null, "created": "2021-03-03", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2021-03-03T02:54:06.321Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	13	\N	1
60	2021-03-03 21:54:47.470334+00	admin	c58780b1-92cb-4889-99df-95852eba2152	create	148	2	Ethernet492	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet492", "tags": [], "type": "10gbase-t", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
61	2021-03-03 21:56:03.721331+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	1	1	Ethernet1	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
62	2021-03-03 21:56:03.732846+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	2	1	Ethernet2	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet2", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
63	2021-03-03 21:56:03.74191+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	3	1	Ethernet3	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet3", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
64	2021-03-03 21:56:03.751057+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	4	1	Ethernet4	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet4", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
65	2021-03-03 21:56:03.759951+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	5	1	Ethernet5	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet5", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
66	2021-03-03 21:56:03.76898+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	6	1	Ethernet6	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet6", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
67	2021-03-03 21:56:03.778326+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	7	1	Ethernet7	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet7", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
68	2021-03-03 21:56:03.787537+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	8	1	Ethernet8	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet8", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
69	2021-03-03 21:56:03.797595+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	9	1	Ethernet9	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet9", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
70	2021-03-03 21:56:03.806228+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	10	1	Ethernet10	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet10", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
71	2021-03-03 21:56:03.815874+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	11	1	Ethernet11	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet11", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
72	2021-03-03 21:56:03.826116+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	12	1	Ethernet12	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet12", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
73	2021-03-03 21:56:03.835469+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	13	1	Ethernet13	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet13", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
74	2021-03-03 21:56:03.844677+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	14	1	Ethernet14	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet14", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
75	2021-03-03 21:56:03.853611+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	15	1	Ethernet15	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet15", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
76	2021-03-03 21:56:03.863029+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	16	1	Ethernet16	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet16", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
77	2021-03-03 21:56:03.871852+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	17	1	Ethernet17	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet17", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
78	2021-03-03 21:56:03.881586+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	18	1	Ethernet18	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet18", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
79	2021-03-03 21:56:03.890113+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	19	1	Ethernet19	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet19", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
80	2021-03-03 21:56:03.899185+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	20	1	Ethernet20	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet20", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
81	2021-03-03 21:56:03.907257+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	21	1	Ethernet21	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet21", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
237	2021-03-03 21:56:21.900014+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	27	1	Ethernet26	{"name": "Ethernet26", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
82	2021-03-03 21:56:03.916696+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	22	1	Ethernet22	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet22", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
83	2021-03-03 21:56:03.925055+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	23	1	Ethernet23	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet23", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
84	2021-03-03 21:56:03.934415+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	24	1	Ethernet24	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet24", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
85	2021-03-03 21:56:03.942933+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	25	1	Ethernet25	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet25", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
86	2021-03-03 21:56:03.951108+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	26	1	Ethernet26	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet26", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
87	2021-03-03 21:56:03.959195+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	27	1	Ethernet27	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet27", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
88	2021-03-03 21:56:03.968361+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	28	1	Ethernet28	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet28", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
89	2021-03-03 21:56:03.976968+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	29	1	Ethernet29	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet29", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
90	2021-03-03 21:56:03.985755+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	30	1	Ethernet30	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet30", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
91	2021-03-03 21:56:03.995301+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	31	1	Ethernet31	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet31", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
92	2021-03-03 21:56:04.00395+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	32	1	Ethernet32	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet32", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
93	2021-03-03 21:56:04.013179+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	33	1	Ethernet33	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet33", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
94	2021-03-03 21:56:04.022464+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	34	1	Ethernet34	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet34", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
95	2021-03-03 21:56:04.031955+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	35	1	Ethernet35	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet35", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
96	2021-03-03 21:56:04.041039+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	36	1	Ethernet36	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet36", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
97	2021-03-03 21:56:04.050583+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	37	1	Ethernet37	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet37", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
98	2021-03-03 21:56:04.059292+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	38	1	Ethernet38	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet38", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
99	2021-03-03 21:56:04.069053+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	39	1	Ethernet39	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet39", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
100	2021-03-03 21:56:04.078306+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	40	1	Ethernet40	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet40", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
101	2021-03-03 21:56:04.08752+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	41	1	Ethernet41	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet41", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
102	2021-03-03 21:56:04.096437+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	42	1	Ethernet42	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet42", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
238	2021-03-03 21:56:21.902744+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	28	1	Ethernet27	{"name": "Ethernet27", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
103	2021-03-03 21:56:04.105032+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	43	1	Ethernet43	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet43", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
104	2021-03-03 21:56:04.11431+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	44	1	Ethernet44	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet44", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
105	2021-03-03 21:56:04.123166+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	45	1	Ethernet45	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet45", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
106	2021-03-03 21:56:04.132188+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	46	1	Ethernet46	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet46", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
107	2021-03-03 21:56:04.14069+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	47	1	Ethernet47	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet47", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
108	2021-03-03 21:56:04.149515+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	48	1	Ethernet48	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet48", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
109	2021-03-03 21:56:04.158308+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	49	1	Loopback0	{"lag": null, "mtu": null, "mode": "", "name": "Loopback0", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 1, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
110	2021-03-03 21:56:04.166819+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	50	2	Ethernet1	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
111	2021-03-03 21:56:04.175836+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	51	2	Ethernet2	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet2", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
112	2021-03-03 21:56:04.184707+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	52	2	Ethernet3	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet3", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
113	2021-03-03 21:56:04.193232+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	53	2	Ethernet4	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet4", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
114	2021-03-03 21:56:04.201833+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	54	2	Ethernet5	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet5", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
115	2021-03-03 21:56:04.210307+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	55	2	Ethernet6	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet6", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
116	2021-03-03 21:56:04.220093+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	56	2	Ethernet7	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet7", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
117	2021-03-03 21:56:04.228899+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	57	2	Ethernet8	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet8", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
118	2021-03-03 21:56:04.236297+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	58	2	Ethernet9	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet9", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
119	2021-03-03 21:56:04.243229+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	59	2	Ethernet10	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet10", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
120	2021-03-03 21:56:04.25124+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	60	2	Ethernet11	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet11", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
121	2021-03-03 21:56:04.258667+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	61	2	Ethernet12	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet12", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
122	2021-03-03 21:56:04.266907+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	62	2	Ethernet13	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet13", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
123	2021-03-03 21:56:04.275226+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	63	2	Ethernet14	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet14", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
239	2021-03-03 21:56:21.905156+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	29	1	Ethernet28	{"name": "Ethernet28", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
124	2021-03-03 21:56:04.284341+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	64	2	Ethernet15	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet15", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
125	2021-03-03 21:56:04.292966+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	65	2	Ethernet16	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet16", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
126	2021-03-03 21:56:04.302889+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	66	2	Ethernet17	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet17", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
127	2021-03-03 21:56:04.31102+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	67	2	Ethernet18	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet18", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
128	2021-03-03 21:56:04.319156+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	68	2	Ethernet19	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet19", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
129	2021-03-03 21:56:04.327882+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	69	2	Ethernet20	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet20", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
130	2021-03-03 21:56:04.336659+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	70	2	Ethernet21	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet21", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
131	2021-03-03 21:56:04.345135+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	71	2	Ethernet22	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet22", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
132	2021-03-03 21:56:04.354271+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	72	2	Ethernet23	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet23", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
133	2021-03-03 21:56:04.363082+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	73	2	Ethernet24	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet24", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
134	2021-03-03 21:56:04.371898+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	74	2	Ethernet25	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet25", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
135	2021-03-03 21:56:04.38183+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	75	2	Ethernet26	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet26", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
136	2021-03-03 21:56:04.390384+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	76	2	Ethernet27	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet27", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
137	2021-03-03 21:56:04.398801+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	77	2	Ethernet28	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet28", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
138	2021-03-03 21:56:04.40712+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	78	2	Ethernet29	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet29", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
139	2021-03-03 21:56:04.415983+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	79	2	Ethernet30	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet30", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
140	2021-03-03 21:56:04.4247+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	80	2	Ethernet31	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet31", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
141	2021-03-03 21:56:04.433681+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	81	2	Ethernet32	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet32", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
142	2021-03-03 21:56:04.444355+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	82	2	Ethernet33	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet33", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
143	2021-03-03 21:56:04.452841+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	83	2	Ethernet34	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet34", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
144	2021-03-03 21:56:04.461488+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	84	2	Ethernet35	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet35", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
240	2021-03-03 21:56:21.907624+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	30	1	Ethernet29	{"name": "Ethernet29", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
145	2021-03-03 21:56:04.470488+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	85	2	Ethernet36	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet36", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
146	2021-03-03 21:56:04.479046+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	86	2	Ethernet37	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet37", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
147	2021-03-03 21:56:04.487786+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	87	2	Ethernet38	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet38", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
148	2021-03-03 21:56:04.497283+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	88	2	Ethernet39	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet39", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
149	2021-03-03 21:56:04.505907+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	89	2	Ethernet40	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet40", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
150	2021-03-03 21:56:04.514595+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	90	2	Ethernet41	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet41", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
151	2021-03-03 21:56:04.522855+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	91	2	Ethernet42	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet42", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
152	2021-03-03 21:56:04.531447+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	92	2	Ethernet43	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet43", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
153	2021-03-03 21:56:04.539806+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	93	2	Ethernet44	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet44", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
154	2021-03-03 21:56:04.548479+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	94	2	Ethernet45	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet45", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
155	2021-03-03 21:56:04.556945+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	95	2	Ethernet46	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet46", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
156	2021-03-03 21:56:04.566294+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	96	2	Ethernet47	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet47", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
157	2021-03-03 21:56:04.574916+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	97	2	Ethernet48	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet48", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
158	2021-03-03 21:56:04.583969+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	98	2	Loopback0	{"lag": null, "mtu": null, "mode": "", "name": "Loopback0", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
159	2021-03-03 21:56:04.592529+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	99	3	Ethernet1	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
160	2021-03-03 21:56:04.601523+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	100	3	Ethernet2	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet2", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
161	2021-03-03 21:56:04.610345+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	101	3	Ethernet3	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet3", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
162	2021-03-03 21:56:04.619063+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	102	3	Ethernet4	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet4", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
163	2021-03-03 21:56:04.628112+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	103	3	Ethernet5	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet5", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
164	2021-03-03 21:56:04.636645+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	104	3	Ethernet6	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet6", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
165	2021-03-03 21:56:04.645664+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	105	3	Ethernet7	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet7", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
241	2021-03-03 21:56:21.910077+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	31	1	Ethernet30	{"name": "Ethernet30", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
166	2021-03-03 21:56:04.653759+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	106	3	Ethernet8	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet8", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
167	2021-03-03 21:56:04.662548+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	107	3	Ethernet9	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet9", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
168	2021-03-03 21:56:04.670922+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	108	3	Ethernet10	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet10", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
169	2021-03-03 21:56:04.679345+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	109	3	Ethernet11	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet11", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
170	2021-03-03 21:56:04.686459+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	110	3	Ethernet12	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet12", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
171	2021-03-03 21:56:04.693836+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	111	3	Ethernet13	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet13", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
172	2021-03-03 21:56:04.700929+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	112	3	Ethernet14	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet14", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
173	2021-03-03 21:56:04.707895+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	113	3	Ethernet15	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet15", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
174	2021-03-03 21:56:04.714999+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	114	3	Ethernet16	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet16", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
175	2021-03-03 21:56:04.722446+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	115	3	Ethernet17	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet17", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
176	2021-03-03 21:56:04.729969+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	116	3	Ethernet18	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet18", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
177	2021-03-03 21:56:04.737593+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	117	3	Ethernet19	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet19", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
178	2021-03-03 21:56:04.74481+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	118	3	Ethernet20	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet20", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
179	2021-03-03 21:56:04.752164+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	119	3	Ethernet21	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet21", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
180	2021-03-03 21:56:04.759425+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	120	3	Ethernet22	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet22", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
181	2021-03-03 21:56:04.767241+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	121	3	Ethernet23	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet23", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
182	2021-03-03 21:56:04.774412+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	122	3	Ethernet24	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet24", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
183	2021-03-03 21:56:04.782326+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	123	3	Ethernet25	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet25", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
184	2021-03-03 21:56:04.789247+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	124	3	Ethernet26	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet26", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
185	2021-03-03 21:56:04.796497+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	125	3	Ethernet27	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet27", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
186	2021-03-03 21:56:04.80336+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	126	3	Ethernet28	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet28", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
242	2021-03-03 21:56:21.912327+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	32	1	Ethernet31	{"name": "Ethernet31", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
187	2021-03-03 21:56:04.81101+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	127	3	Ethernet29	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet29", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
188	2021-03-03 21:56:04.818907+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	128	3	Ethernet30	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet30", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
189	2021-03-03 21:56:04.826806+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	129	3	Ethernet31	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet31", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
190	2021-03-03 21:56:04.833903+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	130	3	Ethernet32	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet32", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
191	2021-03-03 21:56:04.84058+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	131	3	Ethernet33	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet33", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
192	2021-03-03 21:56:04.847879+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	132	3	Ethernet34	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet34", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
193	2021-03-03 21:56:04.854933+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	133	3	Ethernet35	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet35", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
194	2021-03-03 21:56:04.862315+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	134	3	Ethernet36	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet36", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
195	2021-03-03 21:56:04.869822+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	135	3	Ethernet37	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet37", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
196	2021-03-03 21:56:04.877368+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	136	3	Ethernet38	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet38", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
197	2021-03-03 21:56:04.885129+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	137	3	Ethernet39	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet39", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
198	2021-03-03 21:56:04.892582+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	138	3	Ethernet40	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet40", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
199	2021-03-03 21:56:04.9006+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	139	3	Ethernet41	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet41", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
200	2021-03-03 21:56:04.908846+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	140	3	Ethernet42	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet42", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
201	2021-03-03 21:56:04.917482+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	141	3	Ethernet43	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet43", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
202	2021-03-03 21:56:04.926652+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	142	3	Ethernet44	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet44", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
203	2021-03-03 21:56:04.934773+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	143	3	Ethernet45	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet45", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
204	2021-03-03 21:56:04.941851+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	144	3	Ethernet46	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet46", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
205	2021-03-03 21:56:04.94913+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	145	3	Ethernet47	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet47", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
206	2021-03-03 21:56:04.955947+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	146	3	Ethernet48	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet48", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
207	2021-03-03 21:56:04.963918+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	147	3	Loopback0	{"lag": null, "mtu": null, "mode": "", "name": "Loopback0", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 3, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
243	2021-03-03 21:56:21.914774+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	33	1	Ethernet32	{"name": "Ethernet32", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
208	2021-03-03 21:56:04.972111+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	148	2	Ethernet492	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet492", "tags": [], "type": "10gbase-t", "cable": null, "label": "", "device": 2, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
209	2021-03-03 21:56:04.976309+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	1	\N	spine-01	{"face": "", "name": "spine-01", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "cluster": null, "created": "2021-03-03", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2021-03-03T02:53:34.173Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	13	\N	1
210	2021-03-03 21:56:04.98059+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	2	\N	leaf-01	{"face": "", "name": "leaf-01", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "cluster": null, "created": "2021-03-03", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2021-03-03T02:53:59.224Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	13	\N	1
211	2021-03-03 21:56:04.984854+00	admin	5b046752-2b90-47b9-addb-252a57a9245e	delete	3	\N	leaf-02	{"face": "", "name": "leaf-02", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "cluster": null, "created": "2021-03-03", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2021-03-03T02:54:06.321Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	13	\N	1
212	2021-03-03 21:56:21.838504+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	2	1	Ethernet1	{"name": "Ethernet1", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
213	2021-03-03 21:56:21.8414+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	3	1	Ethernet2	{"name": "Ethernet2", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
214	2021-03-03 21:56:21.843846+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	4	1	Ethernet3	{"name": "Ethernet3", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
215	2021-03-03 21:56:21.846297+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	5	1	Ethernet4	{"name": "Ethernet4", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
216	2021-03-03 21:56:21.848887+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	6	1	Ethernet5	{"name": "Ethernet5", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
217	2021-03-03 21:56:21.851461+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	7	1	Ethernet6	{"name": "Ethernet6", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
218	2021-03-03 21:56:21.85383+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	8	1	Ethernet7	{"name": "Ethernet7", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
219	2021-03-03 21:56:21.856281+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	9	1	Ethernet8	{"name": "Ethernet8", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
220	2021-03-03 21:56:21.858546+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	10	1	Ethernet9	{"name": "Ethernet9", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
221	2021-03-03 21:56:21.860725+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	11	1	Ethernet10	{"name": "Ethernet10", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
222	2021-03-03 21:56:21.862868+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	12	1	Ethernet11	{"name": "Ethernet11", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
223	2021-03-03 21:56:21.865176+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	13	1	Ethernet12	{"name": "Ethernet12", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
224	2021-03-03 21:56:21.867644+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	14	1	Ethernet13	{"name": "Ethernet13", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
225	2021-03-03 21:56:21.870136+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	15	1	Ethernet14	{"name": "Ethernet14", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
226	2021-03-03 21:56:21.872542+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	16	1	Ethernet15	{"name": "Ethernet15", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
227	2021-03-03 21:56:21.875152+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	17	1	Ethernet16	{"name": "Ethernet16", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
228	2021-03-03 21:56:21.877675+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	18	1	Ethernet17	{"name": "Ethernet17", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
229	2021-03-03 21:56:21.879978+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	19	1	Ethernet18	{"name": "Ethernet18", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
230	2021-03-03 21:56:21.882276+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	20	1	Ethernet19	{"name": "Ethernet19", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
231	2021-03-03 21:56:21.884821+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	21	1	Ethernet20	{"name": "Ethernet20", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
232	2021-03-03 21:56:21.887981+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	22	1	Ethernet21	{"name": "Ethernet21", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
233	2021-03-03 21:56:21.890447+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	23	1	Ethernet22	{"name": "Ethernet22", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
234	2021-03-03 21:56:21.892957+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	24	1	Ethernet23	{"name": "Ethernet23", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
235	2021-03-03 21:56:21.895145+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	25	1	Ethernet24	{"name": "Ethernet24", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
236	2021-03-03 21:56:21.897683+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	26	1	Ethernet25	{"name": "Ethernet25", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
244	2021-03-03 21:56:21.917286+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	34	1	Ethernet33	{"name": "Ethernet33", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
245	2021-03-03 21:56:21.919702+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	35	1	Ethernet34	{"name": "Ethernet34", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
246	2021-03-03 21:56:21.922092+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	36	1	Ethernet35	{"name": "Ethernet35", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
247	2021-03-03 21:56:21.924531+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	37	1	Ethernet36	{"name": "Ethernet36", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
248	2021-03-03 21:56:21.926794+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	38	1	Ethernet37	{"name": "Ethernet37", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
249	2021-03-03 21:56:21.929092+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	39	1	Ethernet38	{"name": "Ethernet38", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
250	2021-03-03 21:56:21.931275+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	40	1	Ethernet39	{"name": "Ethernet39", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
251	2021-03-03 21:56:21.933478+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	41	1	Ethernet40	{"name": "Ethernet40", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
252	2021-03-03 21:56:21.935964+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	42	1	Ethernet41	{"name": "Ethernet41", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
253	2021-03-03 21:56:21.938263+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	43	1	Ethernet42	{"name": "Ethernet42", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
254	2021-03-03 21:56:21.94053+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	44	1	Ethernet43	{"name": "Ethernet43", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
255	2021-03-03 21:56:21.942835+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	45	1	Ethernet44	{"name": "Ethernet44", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
256	2021-03-03 21:56:21.94499+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	46	1	Ethernet45	{"name": "Ethernet45", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
257	2021-03-03 21:56:21.947459+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	47	1	Ethernet46	{"name": "Ethernet46", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
258	2021-03-03 21:56:21.950021+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	48	1	Ethernet47	{"name": "Ethernet47", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
259	2021-03-03 21:56:21.952924+00	admin	5865ea17-c8a8-4a92-bbed-ecb2088ef4ce	delete	49	1	Ethernet48	{"name": "Ethernet48", "type": "virtual", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
260	2021-03-03 21:56:49.446909+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	51	1	Ethernet1	{"name": "Ethernet1", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
261	2021-03-03 21:56:49.449135+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	52	1	Ethernet2	{"name": "Ethernet2", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
262	2021-03-03 21:56:49.45073+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	53	1	Ethernet3	{"name": "Ethernet3", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
263	2021-03-03 21:56:49.452368+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	54	1	Ethernet4	{"name": "Ethernet4", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
264	2021-03-03 21:56:49.454289+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	55	1	Ethernet5	{"name": "Ethernet5", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
265	2021-03-03 21:56:49.455913+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	56	1	Ethernet6	{"name": "Ethernet6", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
266	2021-03-03 21:56:49.457535+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	57	1	Ethernet7	{"name": "Ethernet7", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
267	2021-03-03 21:56:49.459159+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	58	1	Ethernet8	{"name": "Ethernet8", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
268	2021-03-03 21:56:49.460764+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	59	1	Ethernet9	{"name": "Ethernet9", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
269	2021-03-03 21:56:49.462319+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	60	1	Ethernet10	{"name": "Ethernet10", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
270	2021-03-03 21:56:49.463929+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	61	1	Ethernet11	{"name": "Ethernet11", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
271	2021-03-03 21:56:49.465462+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	62	1	Ethernet12	{"name": "Ethernet12", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
272	2021-03-03 21:56:49.46703+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	63	1	Ethernet13	{"name": "Ethernet13", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
273	2021-03-03 21:56:49.468488+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	64	1	Ethernet14	{"name": "Ethernet14", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
274	2021-03-03 21:56:49.470001+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	65	1	Ethernet15	{"name": "Ethernet15", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
275	2021-03-03 21:56:49.471484+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	66	1	Ethernet16	{"name": "Ethernet16", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
276	2021-03-03 21:56:49.47296+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	67	1	Ethernet17	{"name": "Ethernet17", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
277	2021-03-03 21:56:49.474569+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	68	1	Ethernet18	{"name": "Ethernet18", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
278	2021-03-03 21:56:49.476197+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	69	1	Ethernet19	{"name": "Ethernet19", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
279	2021-03-03 21:56:49.477909+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	70	1	Ethernet20	{"name": "Ethernet20", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
280	2021-03-03 21:56:49.479458+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	71	1	Ethernet21	{"name": "Ethernet21", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
281	2021-03-03 21:56:49.48084+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	72	1	Ethernet22	{"name": "Ethernet22", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
282	2021-03-03 21:56:49.482292+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	73	1	Ethernet23	{"name": "Ethernet23", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
283	2021-03-03 21:56:49.483743+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	74	1	Ethernet24	{"name": "Ethernet24", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
284	2021-03-03 21:56:49.4856+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	75	1	Ethernet25	{"name": "Ethernet25", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
285	2021-03-03 21:56:49.487178+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	76	1	Ethernet26	{"name": "Ethernet26", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
286	2021-03-03 21:56:49.488739+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	77	1	Ethernet27	{"name": "Ethernet27", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
287	2021-03-03 21:56:49.490429+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	78	1	Ethernet28	{"name": "Ethernet28", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
288	2021-03-03 21:56:49.492046+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	79	1	Ethernet29	{"name": "Ethernet29", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
289	2021-03-03 21:56:49.493586+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	80	1	Ethernet30	{"name": "Ethernet30", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
290	2021-03-03 21:56:49.49514+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	81	1	Ethernet31	{"name": "Ethernet31", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
291	2021-03-03 21:56:49.496621+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	82	1	Ethernet32	{"name": "Ethernet32", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
292	2021-03-03 21:56:49.498123+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	83	1	Ethernet33	{"name": "Ethernet33", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
293	2021-03-03 21:56:49.499627+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	84	1	Ethernet34	{"name": "Ethernet34", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
294	2021-03-03 21:56:49.501149+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	85	1	Ethernet35	{"name": "Ethernet35", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
295	2021-03-03 21:56:49.502674+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	86	1	Ethernet36	{"name": "Ethernet36", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
296	2021-03-03 21:56:49.504214+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	87	1	Ethernet37	{"name": "Ethernet37", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
297	2021-03-03 21:56:49.506334+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	88	1	Ethernet38	{"name": "Ethernet38", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
298	2021-03-03 21:56:49.508109+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	89	1	Ethernet39	{"name": "Ethernet39", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
299	2021-03-03 21:56:49.509711+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	90	1	Ethernet40	{"name": "Ethernet40", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
300	2021-03-03 21:56:49.511661+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	91	1	Ethernet41	{"name": "Ethernet41", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
301	2021-03-03 21:56:49.513436+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	92	1	Ethernet42	{"name": "Ethernet42", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
302	2021-03-03 21:56:49.515305+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	93	1	Ethernet43	{"name": "Ethernet43", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
303	2021-03-03 21:56:49.517093+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	94	1	Ethernet44	{"name": "Ethernet44", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
304	2021-03-03 21:56:49.518993+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	95	1	Ethernet45	{"name": "Ethernet45", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
305	2021-03-03 21:56:49.520937+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	96	1	Ethernet46	{"name": "Ethernet46", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
306	2021-03-03 21:56:49.522901+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	97	1	Ethernet47	{"name": "Ethernet47", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
307	2021-03-03 21:56:49.525017+00	admin	8db4d852-fc63-45b2-835f-d66ce25216b8	create	98	1	Ethernet48	{"name": "Ethernet48", "type": "10gbase-x-sfpp", "label": "", "mgmt_only": false, "description": "", "device_type": 1}	29	28	1
308	2021-03-03 21:57:19.967657+00	admin	62d8209c-ca6c-46aa-a458-23d8c3f7cbe3	create	4	\N	spine-01	{"face": "", "name": "spine-01", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "cluster": null, "created": "2021-03-03", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2021-03-03T21:57:19.962Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	13	\N	1
309	2021-03-03 21:57:33.741844+00	admin	c1235a57-3b79-4b09-aad8-2c62cac371aa	create	5	\N	leaf-01	{"face": "", "name": "leaf-01", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "cluster": null, "created": "2021-03-03", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2021-03-03T21:57:33.738Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	13	\N	1
310	2021-03-03 21:57:39.518768+00	admin	38cf7746-5081-431b-8be5-17b2e9128e77	create	6	\N	leaf-02	{"face": "", "name": "leaf-02", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "cluster": null, "created": "2021-03-03", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2021-03-03T21:57:39.515Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	13	\N	1
311	2021-03-03 21:59:09.297952+00	admin	8be25efc-3de8-40b9-9546-2459139187a8	update	149	4	Ethernet1	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1", "tags": [], "type": "10gbase-x-sfpp", "cable": 1, "label": "", "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
312	2021-03-03 21:59:09.31259+00	admin	8be25efc-3de8-40b9-9546-2459139187a8	update	198	5	Ethernet1	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1", "tags": [], "type": "10gbase-x-sfpp", "cable": 1, "label": "", "device": 5, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
313	2021-03-03 21:59:09.322508+00	admin	8be25efc-3de8-40b9-9546-2459139187a8	create	1	\N	#1	{"tags": [], "type": "", "color": "", "label": "", "length": null, "status": "connected", "created": "2021-03-03", "length_unit": "", "last_updated": "2021-03-03T21:59:09.207Z", "custom_fields": {}, "termination_a_id": 149, "termination_b_id": 198, "termination_a_type": 5, "termination_b_type": 5}	46	\N	1
314	2021-03-03 22:00:01.988146+00	admin	debd66bd-ea56-4430-ada9-c15b7732626e	update	150	4	Ethernet2	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet2", "tags": [], "type": "10gbase-x-sfpp", "cable": 2, "label": "", "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
315	2021-03-03 22:00:02.001947+00	admin	debd66bd-ea56-4430-ada9-c15b7732626e	update	247	6	Ethernet1	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1", "tags": [], "type": "10gbase-x-sfpp", "cable": 2, "label": "", "device": 6, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
316	2021-03-03 22:00:02.011079+00	admin	debd66bd-ea56-4430-ada9-c15b7732626e	create	2	\N	#2	{"tags": [], "type": "", "color": "", "label": "", "length": null, "status": "connected", "created": "2021-03-03", "length_unit": "", "last_updated": "2021-03-03T22:00:01.973Z", "custom_fields": {}, "termination_a_id": 150, "termination_b_id": 247, "termination_a_type": 5, "termination_b_type": 5}	46	\N	1
317	2021-03-03 22:01:13.694289+00	admin	75778885-225f-4972-835d-b44b89dcf5ef	create	1	\N	RFC1918	{"name": "RFC1918", "slug": "rfc1918", "created": "2021-03-03", "is_private": true, "description": "", "last_updated": "2021-03-03T22:01:13.691Z"}	52	\N	1
318	2021-03-03 22:03:56.602259+00	admin	a0d61fea-66b2-4158-94de-13510368cc5c	create	1	\N	10.128.1.0/24	{"vrf": null, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.1.0/24", "status": "container", "tenant": null, "created": "2021-03-03", "is_pool": false, "description": "", "last_updated": "2021-03-03T22:03:56.595Z", "custom_fields": {}}	51	\N	1
319	2021-03-03 22:04:23.946912+00	admin	8b6269c6-8a96-4eb0-b5a3-bed9b1fdcdc6	update	1	\N	10.128.1.0/24	{"vrf": null, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.1.0/24", "status": "container", "tenant": null, "created": "2021-03-03", "is_pool": false, "description": "Fabric transit", "last_updated": "2021-03-03T22:04:23.942Z", "custom_fields": {}}	51	\N	1
320	2021-03-05 02:20:26.727827+00	admin	db451e77-535a-43f5-94f3-ce0b9d2046f5	create	1	\N	dmz	{"rd": null, "name": "dmz", "tags": [], "tenant": null, "created": "2021-03-05", "description": "", "last_updated": "2021-03-05T02:20:26.709Z", "custom_fields": {}, "enforce_unique": true, "export_targets": [], "import_targets": []}	55	\N	1
321	2021-03-05 02:21:32.768319+00	admin	9549ada2-c22e-4c18-b9af-847f124c16d0	create	2	\N	dev	{"rd": null, "name": "dev", "tags": [], "tenant": null, "created": "2021-03-05", "description": "", "last_updated": "2021-03-05T02:21:32.760Z", "custom_fields": {}, "enforce_unique": true, "export_targets": [], "import_targets": []}	55	\N	1
322	2021-03-05 02:27:17.297788+00	admin	9d05eaf9-16b1-4ac1-877b-6e8f1b4647f2	create	2	\N	10.128.0.0/20	{"vrf": null, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.0.0/20", "status": "active", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "", "last_updated": "2021-03-05T02:27:17.283Z", "custom_fields": {}}	51	\N	1
323	2021-03-05 02:27:49.841346+00	admin	f35b557d-0d97-438d-922c-9e78dca9061f	update	2	\N	10.128.0.0/20	{"vrf": null, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.0.0/20", "status": "container", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "", "last_updated": "2021-03-05T02:27:49.829Z", "custom_fields": {}}	51	\N	1
324	2021-03-05 02:28:46.262999+00	admin	0761ae60-4fd1-4cdd-ad0e-cfd101b6f0d2	create	3	\N	10.128.16.0/20	{"vrf": 2, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.16.0/20", "status": "active", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "", "last_updated": "2021-03-05T02:28:46.259Z", "custom_fields": {}}	51	\N	1
325	2021-03-05 02:29:07.527823+00	admin	e72dee4d-720c-4d6c-a7b6-9d8531d70f83	update	3	\N	10.128.16.0/20	{"vrf": 2, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.16.0/20", "status": "container", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "", "last_updated": "2021-03-05T02:29:07.523Z", "custom_fields": {}}	51	\N	1
326	2021-03-05 02:30:33.106672+00	admin	eb2c18a3-a8b7-4542-bb74-f04b534050ec	create	4	\N	10.128.32.0/20	{"vrf": 1, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.32.0/20", "status": "active", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "", "last_updated": "2021-03-05T02:30:33.103Z", "custom_fields": {}}	51	\N	1
327	2021-03-05 02:31:00.550127+00	admin	b17c7833-c3d6-45d0-a373-b6280303c9c5	update	4	\N	10.128.32.0/20	{"vrf": 1, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.32.0/20", "status": "container", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "", "last_updated": "2021-03-05T02:31:00.546Z", "custom_fields": {}}	51	\N	1
328	2021-03-05 02:34:13.106138+00	admin	e34fe11e-d7a9-402c-a983-532890db2448	delete	1	\N	10.128.1.0/24	{"vrf": null, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.1.0/24", "status": "container", "tenant": null, "created": "2021-03-03", "is_pool": false, "description": "Fabric transit", "last_updated": "2021-03-03T22:04:23.942Z", "custom_fields": {}}	51	\N	1
329	2021-03-05 02:36:22.783449+00	admin	d28183e5-7fd3-4168-81f1-2154e99f5b8b	create	5	\N	10.128.48.0/20	{"vrf": 2, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.48.0/20", "status": "container", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "", "last_updated": "2021-03-05T02:36:22.767Z", "custom_fields": {}}	51	\N	1
330	2021-03-05 02:37:00.641335+00	admin	e2be0f69-5afe-454e-ba33-4db164de7f74	create	6	\N	10.128.64.0/20	{"vrf": 1, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.64.0/20", "status": "container", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "", "last_updated": "2021-03-05T02:37:00.637Z", "custom_fields": {}}	51	\N	1
331	2021-03-05 02:37:56.68138+00	admin	94b3e17e-8c7d-40bd-828b-77ba46b49a7e	delete	5	\N	10.128.48.0/20	{"vrf": 2, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.48.0/20", "status": "container", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "", "last_updated": "2021-03-05T02:36:22.767Z", "custom_fields": {}}	51	\N	1
332	2021-03-05 02:37:56.687393+00	admin	94b3e17e-8c7d-40bd-828b-77ba46b49a7e	delete	6	\N	10.128.64.0/20	{"vrf": 1, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.64.0/20", "status": "container", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "", "last_updated": "2021-03-05T02:37:00.637Z", "custom_fields": {}}	51	\N	1
333	2021-03-05 02:39:05.446762+00	admin	76bf4024-798b-4597-9572-fda7eb1ae74d	create	7	\N	10.128.15.0/24	{"vrf": null, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.15.0/24", "status": "container", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "Loopback and router ID - global VRF", "last_updated": "2021-03-05T02:39:05.443Z", "custom_fields": {}}	51	\N	1
334	2021-03-05 02:42:01.408747+00	admin	0d2d5f5b-79ca-46e1-af5c-38a826a38a38	create	3	\N	default	{"rd": null, "name": "default", "tags": [], "tenant": null, "created": "2021-03-05", "description": "", "last_updated": "2021-03-05T02:42:01.397Z", "custom_fields": {}, "enforce_unique": true, "export_targets": [], "import_targets": []}	55	\N	1
335	2021-03-05 02:42:18.872313+00	admin	82892b3b-17f9-4dd2-8957-79fc7dfb4c4b	update	2	\N	10.128.0.0/20	{"vrf": 3, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.0.0/20", "status": "container", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "", "last_updated": "2021-03-05T02:42:18.868Z", "custom_fields": {}}	51	\N	1
336	2021-03-05 02:42:18.886823+00	admin	82892b3b-17f9-4dd2-8957-79fc7dfb4c4b	update	7	\N	10.128.15.0/24	{"vrf": 3, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.15.0/24", "status": "container", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "Loopback and router ID - global VRF", "last_updated": "2021-03-05T02:42:18.882Z", "custom_fields": {}}	51	\N	1
337	2021-03-05 02:43:11.718325+00	admin	4fe36d3f-21f8-4915-aee0-d8a7195aaf38	create	8	\N	10.128.14.0/24	{"vrf": 3, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.14.0/24", "status": "container", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "", "last_updated": "2021-03-05T02:43:11.708Z", "custom_fields": {}}	51	\N	1
338	2021-03-05 02:44:09.321044+00	admin	5d528c95-3a81-4869-b66d-404753db6639	update	8	\N	10.128.14.0/24	{"vrf": 3, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.14.0/24", "status": "container", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "fabric transit - default VRF", "last_updated": "2021-03-05T02:44:09.317Z", "custom_fields": {}}	51	\N	1
339	2021-03-05 02:46:30.609123+00	admin	ae48c975-bfdf-469d-8706-d40100364afb	create	9	\N	10.128.31.0/24	{"vrf": 2, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.31.0/24", "status": "container", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "Loopback and router ID - dev VRF", "last_updated": "2021-03-05T02:46:30.605Z", "custom_fields": {}}	51	\N	1
340	2021-03-05 02:47:01.233456+00	admin	d4d25a9c-697e-4b31-aeb9-2ee5f996375f	create	10	\N	10.128.30.0/24	{"vrf": 2, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.30.0/24", "status": "active", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "fabric transit - dev VRF", "last_updated": "2021-03-05T02:47:01.227Z", "custom_fields": {}}	51	\N	1
341	2021-03-05 02:47:20.315463+00	admin	c90096f4-d0c1-4e7a-a692-2de4acc1a12a	update	10	\N	10.128.30.0/24	{"vrf": 2, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.30.0/24", "status": "container", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "fabric transit - dev VRF", "last_updated": "2021-03-05T02:47:20.309Z", "custom_fields": {}}	51	\N	1
342	2021-03-05 02:48:42.325294+00	admin	7ab23c15-a52a-4485-9188-ae129144cb46	create	11	\N	10.128.47.0/24	{"vrf": 1, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.47.0/24", "status": "container", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "Loopback and router ID - dmz VRF", "last_updated": "2021-03-05T02:48:42.321Z", "custom_fields": {}}	51	\N	1
343	2021-03-05 02:49:01.745348+00	admin	49d2f168-e148-4a9b-bbc5-a595d7eddfd7	create	12	\N	10.128.46.0/24	{"vrf": 1, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.46.0/24", "status": "container", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "fabric transit - dmz VRF", "last_updated": "2021-03-05T02:49:01.739Z", "custom_fields": {}}	51	\N	1
344	2021-03-05 03:03:38.548961+00	admin	1c79a064-48c2-410b-b648-1be5a6577eae	create	13	\N	10.128.46.0/31	{"vrf": 1, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.46.0/31", "status": "active", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "", "last_updated": "2021-03-05T03:03:38.536Z", "custom_fields": {}}	51	\N	1
345	2021-03-05 03:05:01.612868+00	admin	739d61d0-0efe-4b43-8341-73f8808a573d	update	13	\N	10.128.46.0/31	{"vrf": 1, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.46.0/31", "status": "active", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "Leaf01/Spine01 transit - dmz", "last_updated": "2021-03-05T03:05:01.607Z", "custom_fields": {}}	51	\N	1
346	2021-03-05 03:05:52.644967+00	admin	767cb8cf-dbeb-4065-a175-191dad79f5af	create	14	\N	10.128.46.2/31	{"vrf": 3, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.46.2/31", "status": "active", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "Leaf02/Spine01 transit - dmz", "last_updated": "2021-03-05T03:05:52.641Z", "custom_fields": {}}	51	\N	1
347	2021-03-05 03:06:13.122735+00	admin	dbd9f575-87f7-462a-b7bf-301880371914	update	14	\N	10.128.46.2/31	{"vrf": 1, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.46.2/31", "status": "active", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "Leaf02/Spine01 transit - dmz", "last_updated": "2021-03-05T03:06:13.118Z", "custom_fields": {}}	51	\N	1
348	2021-03-05 03:07:08.338116+00	admin	80ba29a4-f8ec-41c6-ba50-ab6d580b4423	update	11	\N	10.128.47.0/24	{"vrf": 1, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.47.0/24", "status": "active", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "Loopback and router ID - dmz VRF", "last_updated": "2021-03-05T03:07:08.334Z", "custom_fields": {}}	51	\N	1
349	2021-03-05 03:07:26.217679+00	admin	37db2dbd-41a1-4972-a4b7-e72bf2e4c505	update	9	\N	10.128.31.0/24	{"vrf": 2, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.31.0/24", "status": "active", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "Loopback and router ID - dev VRF", "last_updated": "2021-03-05T03:07:26.213Z", "custom_fields": {}}	51	\N	1
350	2021-03-05 03:07:26.229286+00	admin	37db2dbd-41a1-4972-a4b7-e72bf2e4c505	update	7	\N	10.128.15.0/24	{"vrf": 3, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.15.0/24", "status": "active", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "Loopback and router ID - global VRF", "last_updated": "2021-03-05T03:07:26.225Z", "custom_fields": {}}	51	\N	1
351	2021-03-05 03:08:38.252984+00	admin	99659e28-19eb-42d3-9924-188d4db8f40a	create	15	\N	10.128.30.0/31	{"vrf": 2, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.30.0/31", "status": "active", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "Leaf01/Spine01 transit - dev", "last_updated": "2021-03-05T03:08:38.248Z", "custom_fields": {}}	51	\N	1
352	2021-03-05 03:09:29.668238+00	admin	611d0757-e110-409e-b858-c24e85fd685a	create	16	\N	10.128.30.2/31	{"vrf": 2, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.30.2/31", "status": "active", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "Leaf02/Spine01 transit - dev", "last_updated": "2021-03-05T03:09:29.664Z", "custom_fields": {}}	51	\N	1
353	2021-03-05 03:11:02.865932+00	admin	33ea263f-13de-4e43-934b-3f708610a5bb	create	17	\N	10.128.14.0/31	{"vrf": 3, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.14.0/31", "status": "active", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "Leaf01/Spine01 transit - default", "last_updated": "2021-03-05T03:11:02.861Z", "custom_fields": {}}	51	\N	1
354	2021-03-05 03:11:16.11191+00	admin	885b6a8f-9f6c-443d-8ca7-ff548eba0fda	create	18	\N	10.128.14.2/31	{"vrf": 3, "role": null, "site": null, "tags": [], "vlan": null, "prefix": "10.128.14.2/31", "status": "active", "tenant": null, "created": "2021-03-05", "is_pool": false, "description": "Leaf02/Spine01 transit - default", "last_updated": "2021-03-05T03:11:16.108Z", "custom_fields": {}}	51	\N	1
355	2021-03-05 03:28:35.667827+00	admin	da8c4a0a-9529-49aa-ac23-8dcf06bbf17a	create	296	5	Ethernet1.100	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.100", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 5, "enabled": true, "mgmt_only": false, "description": "", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
356	2021-03-05 03:28:35.693451+00	admin	da8c4a0a-9529-49aa-ac23-8dcf06bbf17a	create	297	5	Ethernet1.200	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.200", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 5, "enabled": true, "mgmt_only": false, "description": "", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
357	2021-03-05 03:28:35.713123+00	admin	da8c4a0a-9529-49aa-ac23-8dcf06bbf17a	create	298	5	Ethernet1.400	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.400", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 5, "enabled": true, "mgmt_only": false, "description": "", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
358	2021-03-05 03:28:35.733096+00	admin	da8c4a0a-9529-49aa-ac23-8dcf06bbf17a	create	299	6	Ethernet1.100	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.100", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 6, "enabled": true, "mgmt_only": false, "description": "", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
359	2021-03-05 03:28:35.753572+00	admin	da8c4a0a-9529-49aa-ac23-8dcf06bbf17a	create	300	6	Ethernet1.200	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.200", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 6, "enabled": true, "mgmt_only": false, "description": "", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
360	2021-03-05 03:28:35.774387+00	admin	da8c4a0a-9529-49aa-ac23-8dcf06bbf17a	create	301	6	Ethernet1.400	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.400", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 6, "enabled": true, "mgmt_only": false, "description": "", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
361	2021-03-05 03:28:35.795393+00	admin	da8c4a0a-9529-49aa-ac23-8dcf06bbf17a	create	302	4	Ethernet1.100	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.100", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
362	2021-03-05 03:28:35.81837+00	admin	da8c4a0a-9529-49aa-ac23-8dcf06bbf17a	create	303	4	Ethernet1.200	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.200", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
363	2021-03-05 03:28:35.840587+00	admin	da8c4a0a-9529-49aa-ac23-8dcf06bbf17a	create	304	4	Ethernet1.400	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.400", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
364	2021-03-05 03:29:42.451654+00	admin	efb84ffe-6880-4241-926b-cb69c4345661	create	305	4	Ethernet2.100	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet2.100", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
365	2021-03-05 03:29:42.469119+00	admin	efb84ffe-6880-4241-926b-cb69c4345661	create	306	4	Ethernet2.200	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet2.200", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
366	2021-03-05 03:29:42.48254+00	admin	efb84ffe-6880-4241-926b-cb69c4345661	create	307	4	Ethernet2.400	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet2.400", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
367	2021-03-05 03:31:50.463396+00	admin	cce0561f-e86f-426f-9d95-c4f6a1c5a157	create	1	302	10.128.14.0/31	{"vrf": 3, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.14.0/31", "created": "2021-03-05", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-05T03:31:50.455Z", "custom_fields": {}, "assigned_object_id": 302, "assigned_object_type": 5}	50	5	1
368	2021-03-05 03:35:33.93783+00	admin	79fdf2d9-68f7-4430-9b32-487ad25b82f0	create	2	303	10.128.30.0/31	{"vrf": 2, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.30.0/31", "created": "2021-03-05", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-05T03:35:33.932Z", "custom_fields": {}, "assigned_object_id": 303, "assigned_object_type": 5}	50	5	1
369	2021-03-05 03:35:59.623188+00	admin	31cbf5c1-ee19-424f-a0b4-f3ae175e7cb0	create	3	304	10.128.36.0/31	{"vrf": 1, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.36.0/31", "created": "2021-03-05", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-05T03:35:59.619Z", "custom_fields": {}, "assigned_object_id": 304, "assigned_object_type": 5}	50	5	1
370	2021-03-05 03:36:51.363646+00	admin	6142ff3d-795c-4943-b34b-3d612ca6a7ff	create	4	304	10.128.46.0/31	{"vrf": 1, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.46.0/31", "created": "2021-03-05", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-05T03:36:51.358Z", "custom_fields": {}, "assigned_object_id": 304, "assigned_object_type": 5}	50	5	1
371	2021-03-05 03:36:58.211745+00	admin	951609a0-9d90-4479-8663-05303c665cd7	delete	3	304	10.128.36.0/31	{"vrf": 1, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.36.0/31", "created": "2021-03-05", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-05T03:35:59.619Z", "custom_fields": {}, "assigned_object_id": 304, "assigned_object_type": 5}	50	5	1
372	2021-03-23 20:30:57.494449+00	admin	7fc79825-3b57-4bc4-a3db-eb686f7993f5	create	5	305	10.128.14.2/31	{"vrf": 3, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.14.2/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-23T20:30:57.481Z", "custom_fields": {}, "assigned_object_id": 305, "assigned_object_type": 5}	50	5	1
373	2021-03-23 20:31:41.027638+00	admin	bd6e057b-6edd-4663-b860-127c19036a6a	create	6	306	10.128.30.2/31	{"vrf": 2, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.30.2/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-23T20:31:41.024Z", "custom_fields": {}, "assigned_object_id": 306, "assigned_object_type": 5}	50	5	1
374	2021-03-23 20:32:06.090294+00	admin	ee506e79-b6f0-48e4-b6ec-e47b908236d8	create	7	307	10.128.46.2/31	{"vrf": 1, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.46.2/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-23T20:32:06.086Z", "custom_fields": {}, "assigned_object_id": 307, "assigned_object_type": 5}	50	5	1
375	2021-03-23 20:33:58.248686+00	admin	6db3205b-2457-4872-95c7-21c8f3d63ecd	create	8	296	10.128.14.1/31	{"vrf": 3, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.14.1/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-23T20:33:58.245Z", "custom_fields": {}, "assigned_object_id": 296, "assigned_object_type": 5}	50	5	1
376	2021-03-23 20:34:25.291816+00	admin	a4aaaa9b-4300-422f-88fd-0f0c4fe4a54b	create	9	297	10.128.30.1/31	{"vrf": 2, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.30.1/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-23T20:34:25.287Z", "custom_fields": {}, "assigned_object_id": 297, "assigned_object_type": 5}	50	5	1
377	2021-03-23 20:34:48.983023+00	admin	d49a6dd0-c7dc-4053-91e6-fafacbc08784	create	10	298	10.128.46.1/31	{"vrf": 1, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.46.1/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-23T20:34:48.979Z", "custom_fields": {}, "assigned_object_id": 298, "assigned_object_type": 5}	50	5	1
378	2021-03-23 20:36:15.401431+00	admin	5ab5e342-0be2-4333-9c51-3f09b4e33087	create	11	299	10.128.14.3/31	{"vrf": 3, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.14.3/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-23T20:36:15.396Z", "custom_fields": {}, "assigned_object_id": 299, "assigned_object_type": 5}	50	5	1
379	2021-03-23 20:39:22.621564+00	admin	1e6c80dd-62af-4215-8b82-deaa7eced680	create	12	300	10.128.30.3/31	{"vrf": 2, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.30.3/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-23T20:39:22.616Z", "custom_fields": {}, "assigned_object_id": 300, "assigned_object_type": 5}	50	5	1
380	2021-03-23 20:39:46.473402+00	admin	553a6d2b-268c-41ef-9c5a-3b69385f3e02	create	13	301	10.128.46.3/31	{"vrf": 1, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.46.3/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-23T20:39:46.461Z", "custom_fields": {}, "assigned_object_id": 301, "assigned_object_type": 5}	50	5	1
381	2021-03-23 20:45:10.958415+00	admin	eef74f8e-c07d-4d59-8e02-ba63ea951737	update	4	\N	spine-01	{"face": "", "name": "spine-01", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "cluster": null, "created": "2021-03-03", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2021-03-23T20:45:10.953Z", "custom_fields": {"bgp_asn": 65000}, "virtual_chassis": null, "local_context_data": null}	13	\N	1
382	2021-03-23 20:46:26.211989+00	admin	1d9e1c73-0461-4f1c-b3c5-77c8331aa4cf	update	5	\N	leaf-01	{"face": "", "name": "leaf-01", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "cluster": null, "created": "2021-03-03", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2021-03-23T20:46:26.207Z", "custom_fields": {"bgp_asn": 65021}, "virtual_chassis": null, "local_context_data": null}	13	\N	1
383	2021-03-23 20:46:37.189853+00	admin	bef95000-e8b4-461c-83ac-a2f114228cbe	update	6	\N	leaf-02	{"face": "", "name": "leaf-02", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "cluster": null, "created": "2021-03-03", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2021-03-23T20:46:37.185Z", "custom_fields": {"bgp_asn": 65022}, "virtual_chassis": null, "local_context_data": null}	13	\N	1
384	2021-03-24 15:42:32.155983+00	admin	761cd89c-c620-44ae-8aa0-f1d9840df033	create	1	\N	interface-type-fabric-base	{"name": "interface-type-fabric-base", "slug": "interface-type-fabric-base", "color": "9e9e9e", "created": "2021-03-24", "description": "", "last_updated": "2021-03-24T15:42:32.144Z"}	65	\N	1
385	2021-03-24 15:42:43.104315+00	admin	7a0e056e-f6c6-47e5-a980-d8dde58b16a0	create	2	\N	interface-type-fabric-transit	{"name": "interface-type-fabric-transit", "slug": "interface-type-fabric-transit", "color": "9e9e9e", "created": "2021-03-24", "description": "", "last_updated": "2021-03-24T15:42:43.103Z"}	65	\N	1
386	2021-03-24 15:44:48.307895+00	admin	e1969530-e5db-4276-b488-93859a17b5c9	create	3	\N	role-spine	{"name": "role-spine", "slug": "role-spine", "color": "9c27b0", "created": "2021-03-24", "description": "", "last_updated": "2021-03-24T15:44:48.306Z"}	65	\N	1
387	2021-03-24 15:45:13.090654+00	admin	2e274247-2205-4c82-9973-5cb7c633e0f5	create	4	\N	role-access-leaf	{"name": "role-access-leaf", "slug": "role-access-leaf", "color": "2196f3", "created": "2021-03-24", "description": "", "last_updated": "2021-03-24T15:45:13.083Z"}	65	\N	1
388	2021-03-24 15:45:31.169782+00	admin	bb798e3b-38b9-4436-8ea0-2ee7e18879ed	create	5	\N	role-border-leaf	{"name": "role-border-leaf", "slug": "role-border-leaf", "color": "f44336", "created": "2021-03-24", "description": "", "last_updated": "2021-03-24T15:45:31.168Z"}	65	\N	1
389	2021-03-24 15:47:52.632507+00	admin	9dd0c37c-f902-48d6-af1e-7ef025992b52	update	1	\N	spine	{"name": "spine", "slug": "spine", "color": "9c27b0", "created": "2021-03-03", "vm_role": true, "description": "", "last_updated": "2021-03-24T15:47:52.630Z"}	27	\N	1
390	2021-03-24 15:48:11.511878+00	admin	4183db2f-0cec-4009-957d-9ef00ac8ac09	create	3	\N	leaf-border	{"name": "leaf-border", "slug": "leaf-border", "color": "f44336", "created": "2021-03-24", "vm_role": true, "description": "", "last_updated": "2021-03-24T15:48:11.510Z"}	27	\N	1
391	2021-03-24 15:48:52.060473+00	admin	b0ea87ae-fd53-45dd-9509-e3ed039393fb	update	4	\N	role-leaf-access	{"name": "role-leaf-access", "slug": "role-leaf-access", "color": "2196f3", "created": "2021-03-24", "description": "", "last_updated": "2021-03-24T15:48:52.059Z"}	65	\N	1
392	2021-03-24 15:49:08.945885+00	admin	116e3009-f548-4e01-af3d-a74aa83a7090	update	5	\N	role-leaf-border	{"name": "role-leaf-border", "slug": "role-leaf-border", "color": "f44336", "created": "2021-03-24", "description": "", "last_updated": "2021-03-24T15:49:08.944Z"}	65	\N	1
393	2021-03-24 15:49:34.844848+00	admin	153f085b-33b4-45d7-a9e1-51cfd2e964cb	update	2	\N	leaf-access	{"name": "leaf-access", "slug": "leaf-access", "color": "2196f3", "created": "2021-03-03", "vm_role": true, "description": "", "last_updated": "2021-03-24T15:49:34.843Z"}	27	\N	1
394	2021-03-24 15:52:28.158931+00	admin	45ca691a-7768-43f5-afd7-ceb0ac6bf8c3	update	5	\N	leaf-01	{"face": "", "name": "leaf-01", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "cluster": null, "created": "2021-03-03", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2021-03-24T15:52:28.147Z", "custom_fields": {"bgp_asn": 65021}, "virtual_chassis": null, "local_context_data": null}	13	\N	1
395	2021-03-24 15:54:12.916313+00	admin	1393213c-f246-495f-b27f-8421c07548c5	create	6	\N	bgp-originate	{"name": "bgp-originate", "slug": "bgp-originate", "color": "9e9e9e", "created": "2021-03-24", "description": "", "last_updated": "2021-03-24T15:54:12.914Z"}	65	\N	1
396	2021-03-24 15:54:16.979679+00	admin	af32c38a-7c64-4591-b158-e63fc3364e41	create	7	\N	router-id	{"name": "router-id", "slug": "router-id", "color": "9e9e9e", "created": "2021-03-24", "description": "", "last_updated": "2021-03-24T15:54:16.978Z"}	65	\N	1
397	2021-03-24 15:58:57.723099+00	admin	d598f988-983d-46ca-aafe-4b188118e0f5	create	308	5	Loopback1 (Loopback and router-id - default VRF)	{"lag": null, "mtu": null, "mode": "", "name": "Loopback1", "tags": [], "type": "virtual", "cable": null, "label": "Loopback and router-id - default VRF", "device": 5, "enabled": true, "mgmt_only": false, "description": "", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
398	2021-03-24 15:58:57.747572+00	admin	d598f988-983d-46ca-aafe-4b188118e0f5	create	309	6	Loopback1 (Loopback and router-id - default VRF)	{"lag": null, "mtu": null, "mode": "", "name": "Loopback1", "tags": [], "type": "virtual", "cable": null, "label": "Loopback and router-id - default VRF", "device": 6, "enabled": true, "mgmt_only": false, "description": "", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
399	2021-03-24 15:58:57.770954+00	admin	d598f988-983d-46ca-aafe-4b188118e0f5	create	310	4	Loopback1 (Loopback and router-id - default VRF)	{"lag": null, "mtu": null, "mode": "", "name": "Loopback1", "tags": [], "type": "virtual", "cable": null, "label": "Loopback and router-id - default VRF", "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
400	2021-03-24 15:59:57.909564+00	admin	b6ce2211-b770-41c8-a1ca-07734890c57f	update	308	5	Loopback1	{"lag": null, "mtu": null, "mode": "", "name": "Loopback1", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 5, "enabled": true, "mgmt_only": false, "description": "Loopback and router-id - default VRF", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
401	2021-03-24 16:00:22.739183+00	admin	e5d62c87-c9e9-4bcd-8aec-0d57b3b4e73e	update	309	6	Loopback1	{"lag": null, "mtu": null, "mode": "", "name": "Loopback1", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 6, "enabled": true, "mgmt_only": false, "description": "Loopback and router-id - default VRF", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
402	2021-03-24 16:00:42.380996+00	admin	1e03aa42-fdac-4b0c-a390-409026ec1aa3	update	310	4	Loopback1	{"lag": null, "mtu": null, "mode": "", "name": "Loopback1", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 4, "enabled": true, "mgmt_only": false, "description": "Loopback and router-id - default VRF", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
403	2021-03-24 16:01:14.133406+00	admin	0eb738d2-970b-4c22-941e-8effa04fb3c7	create	311	5	Loopback2	{"lag": null, "mtu": null, "mode": "", "name": "Loopback2", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 5, "enabled": true, "mgmt_only": false, "description": "Loopback and router-id - dev VRF", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
404	2021-03-24 16:01:14.154229+00	admin	0eb738d2-970b-4c22-941e-8effa04fb3c7	create	312	6	Loopback2	{"lag": null, "mtu": null, "mode": "", "name": "Loopback2", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 6, "enabled": true, "mgmt_only": false, "description": "Loopback and router-id - dev VRF", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
405	2021-03-24 16:01:14.174921+00	admin	0eb738d2-970b-4c22-941e-8effa04fb3c7	create	313	4	Loopback2	{"lag": null, "mtu": null, "mode": "", "name": "Loopback2", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 4, "enabled": true, "mgmt_only": false, "description": "Loopback and router-id - dev VRF", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
406	2021-03-24 16:01:40.954972+00	admin	b9078478-1389-49d2-a377-3bf769d64438	create	314	5	Loopback4	{"lag": null, "mtu": null, "mode": "", "name": "Loopback4", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 5, "enabled": true, "mgmt_only": false, "description": "Loopback and router-id - dmz VRF", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
407	2021-03-24 16:01:40.982442+00	admin	b9078478-1389-49d2-a377-3bf769d64438	create	315	6	Loopback4	{"lag": null, "mtu": null, "mode": "", "name": "Loopback4", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 6, "enabled": true, "mgmt_only": false, "description": "Loopback and router-id - dmz VRF", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
408	2021-03-24 16:01:41.007649+00	admin	b9078478-1389-49d2-a377-3bf769d64438	create	316	4	Loopback4	{"lag": null, "mtu": null, "mode": "", "name": "Loopback4", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 4, "enabled": true, "mgmt_only": false, "description": "Loopback and router-id - dmz VRF", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
409	2021-03-24 16:03:08.093787+00	admin	722a253f-79d9-40c5-bd1a-d7ce4dc16994	create	14	310	10.128.15.1/32	{"vrf": 3, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.15.1/32", "created": "2021-03-24", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-24T16:03:08.088Z", "custom_fields": {}, "assigned_object_id": 310, "assigned_object_type": 5}	50	5	1
410	2021-03-24 16:03:32.870931+00	admin	7fc4d974-60f2-4112-a313-9547a5cf7060	create	15	313	10.128.31.1/32	{"vrf": 2, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.31.1/32", "created": "2021-03-24", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-24T16:03:32.866Z", "custom_fields": {}, "assigned_object_id": 313, "assigned_object_type": 5}	50	5	1
411	2021-03-24 16:03:59.459514+00	admin	00067846-0453-48a3-bc36-3268bb098fae	create	16	316	10.128.47.1/32	{"vrf": 1, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.47.1/32", "created": "2021-03-24", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-24T16:03:59.455Z", "custom_fields": {}, "assigned_object_id": 316, "assigned_object_type": 5}	50	5	1
412	2021-03-24 16:05:25.434809+00	admin	008236d5-3a9c-41de-be81-3749f69b6423	create	17	308	10.128.15.2/32	{"vrf": 3, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.15.2/32", "created": "2021-03-24", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-24T16:05:25.430Z", "custom_fields": {}, "assigned_object_id": 308, "assigned_object_type": 5}	50	5	1
413	2021-03-24 16:05:48.748672+00	admin	6ee92ab0-7a17-4a5b-8b03-860127c8b32a	create	18	311	10.128.31.2/32	{"vrf": 2, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.31.2/32", "created": "2021-03-24", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-24T16:05:48.742Z", "custom_fields": {}, "assigned_object_id": 311, "assigned_object_type": 5}	50	5	1
414	2021-03-24 16:06:24.791662+00	admin	f5e1147a-b431-4240-9d79-6d53a3f052f5	create	19	314	10.128.47.2/32	{"vrf": 1, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.47.2/32", "created": "2021-03-24", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-24T16:06:24.787Z", "custom_fields": {}, "assigned_object_id": 314, "assigned_object_type": 5}	50	5	1
415	2021-03-24 16:07:39.025871+00	admin	8ae695f9-7dd2-4c40-9248-c61c11aacb27	create	20	309	10.128.15.3/32	{"vrf": 3, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.15.3/32", "created": "2021-03-24", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-24T16:07:39.021Z", "custom_fields": {}, "assigned_object_id": 309, "assigned_object_type": 5}	50	5	1
416	2021-03-24 16:07:55.44752+00	admin	72588dff-bbb9-4790-8cc6-c599359d73e6	create	21	312	10.128.31.3/32	{"vrf": 2, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.31.3/32", "created": "2021-03-24", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-24T16:07:55.442Z", "custom_fields": {}, "assigned_object_id": 312, "assigned_object_type": 5}	50	5	1
417	2021-03-24 16:08:15.622848+00	admin	0d0bbac9-4d95-443d-a06c-b44be1bc3c65	create	22	315	10.128.47.3/32	{"vrf": 1, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.47.3/32", "created": "2021-03-24", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-24T16:08:15.619Z", "custom_fields": {}, "assigned_object_id": 315, "assigned_object_type": 5}	50	5	1
418	2021-03-24 16:10:25.812669+00	admin	cda498cf-b966-4ed1-968c-5586843f6885	update	3	\N	default	{"rd": null, "name": "default", "tags": [], "tenant": null, "created": "2021-03-05", "description": "", "last_updated": "2021-03-24T16:10:25.804Z", "custom_fields": {}, "enforce_unique": true, "export_targets": [], "import_targets": []}	55	\N	1
419	2021-03-24 16:10:25.829271+00	admin	cda498cf-b966-4ed1-968c-5586843f6885	update	3	\N	default	{"rd": null, "name": "default", "tags": ["role-leaf-access", "role-spine"], "tenant": null, "created": "2021-03-05", "description": "", "last_updated": "2021-03-24T16:10:25.804Z", "custom_fields": {}, "enforce_unique": true, "export_targets": [], "import_targets": []}	55	\N	1
420	2021-03-24 16:10:25.839957+00	admin	cda498cf-b966-4ed1-968c-5586843f6885	update	2	\N	dev	{"rd": null, "name": "dev", "tags": [], "tenant": null, "created": "2021-03-05", "description": "", "last_updated": "2021-03-24T16:10:25.834Z", "custom_fields": {}, "enforce_unique": true, "export_targets": [], "import_targets": []}	55	\N	1
421	2021-03-24 16:10:25.853301+00	admin	cda498cf-b966-4ed1-968c-5586843f6885	update	2	\N	dev	{"rd": null, "name": "dev", "tags": ["role-leaf-access", "role-spine"], "tenant": null, "created": "2021-03-05", "description": "", "last_updated": "2021-03-24T16:10:25.834Z", "custom_fields": {}, "enforce_unique": true, "export_targets": [], "import_targets": []}	55	\N	1
422	2021-03-24 16:10:25.863804+00	admin	cda498cf-b966-4ed1-968c-5586843f6885	update	1	\N	dmz	{"rd": null, "name": "dmz", "tags": [], "tenant": null, "created": "2021-03-05", "description": "", "last_updated": "2021-03-24T16:10:25.857Z", "custom_fields": {}, "enforce_unique": true, "export_targets": [], "import_targets": []}	55	\N	1
423	2021-03-24 16:10:25.875919+00	admin	cda498cf-b966-4ed1-968c-5586843f6885	update	1	\N	dmz	{"rd": null, "name": "dmz", "tags": ["role-leaf-access", "role-spine"], "tenant": null, "created": "2021-03-05", "description": "", "last_updated": "2021-03-24T16:10:25.857Z", "custom_fields": {}, "enforce_unique": true, "export_targets": [], "import_targets": []}	55	\N	1
424	2021-03-24 16:11:30.262487+00	admin	b75e1109-b9eb-45d9-aed3-99c55e0cdfe3	update	3	\N	default	{"rd": null, "name": "default", "tags": ["role-leaf-access", "role-spine"], "tenant": null, "created": "2021-03-05", "description": "", "last_updated": "2021-03-24T16:11:30.253Z", "custom_fields": {}, "enforce_unique": true, "export_targets": [], "import_targets": []}	55	\N	1
425	2021-03-24 16:11:30.278698+00	admin	b75e1109-b9eb-45d9-aed3-99c55e0cdfe3	update	3	\N	default	{"rd": null, "name": "default", "tags": ["role-leaf-access", "role-leaf-border", "role-spine"], "tenant": null, "created": "2021-03-05", "description": "", "last_updated": "2021-03-24T16:11:30.253Z", "custom_fields": {}, "enforce_unique": true, "export_targets": [], "import_targets": []}	55	\N	1
426	2021-03-24 16:11:30.291105+00	admin	b75e1109-b9eb-45d9-aed3-99c55e0cdfe3	update	2	\N	dev	{"rd": null, "name": "dev", "tags": ["role-leaf-access", "role-spine"], "tenant": null, "created": "2021-03-05", "description": "", "last_updated": "2021-03-24T16:11:30.284Z", "custom_fields": {}, "enforce_unique": true, "export_targets": [], "import_targets": []}	55	\N	1
427	2021-03-24 16:11:30.304838+00	admin	b75e1109-b9eb-45d9-aed3-99c55e0cdfe3	update	2	\N	dev	{"rd": null, "name": "dev", "tags": ["role-leaf-access", "role-leaf-border", "role-spine"], "tenant": null, "created": "2021-03-05", "description": "", "last_updated": "2021-03-24T16:11:30.284Z", "custom_fields": {}, "enforce_unique": true, "export_targets": [], "import_targets": []}	55	\N	1
428	2021-03-24 16:12:22.120915+00	admin	d330d611-fc62-4a1c-957a-a160fded5376	update	298	5	Ethernet1.400	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.400", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
429	2021-03-24 16:12:22.137458+00	admin	d330d611-fc62-4a1c-957a-a160fded5376	update	314	5	Loopback4	{"lag": null, "mtu": null, "mode": "", "name": "Loopback4", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "Loopback and router-id - dmz VRF", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
430	2021-03-24 16:14:06.010647+00	admin	1f4f101a-5e9a-4378-a9f4-4dc4d7bee2a5	update	304	4	Ethernet1.400	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.400", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
431	2021-03-24 16:17:53.219781+00	admin	4446625a-e3c6-4e58-b68b-2053eed97263	update	14	310	10.128.15.1/32	{"vrf": 3, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.15.1/32", "created": "2021-03-24", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-24T16:17:53.213Z", "custom_fields": {}, "assigned_object_id": 310, "assigned_object_type": 5}	50	5	1
432	2021-03-24 16:17:53.232195+00	admin	4446625a-e3c6-4e58-b68b-2053eed97263	update	14	310	10.128.15.1/32	{"vrf": 3, "role": "", "tags": ["bgp-originate", "router-id"], "status": "active", "tenant": null, "address": "10.128.15.1/32", "created": "2021-03-24", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-24T16:17:53.213Z", "custom_fields": {}, "assigned_object_id": 310, "assigned_object_type": 5}	50	5	1
433	2021-03-24 16:17:53.251336+00	admin	4446625a-e3c6-4e58-b68b-2053eed97263	update	17	308	10.128.15.2/32	{"vrf": 3, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.15.2/32", "created": "2021-03-24", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-24T16:17:53.245Z", "custom_fields": {}, "assigned_object_id": 308, "assigned_object_type": 5}	50	5	1
434	2021-03-24 16:17:53.263754+00	admin	4446625a-e3c6-4e58-b68b-2053eed97263	update	17	308	10.128.15.2/32	{"vrf": 3, "role": "", "tags": ["bgp-originate", "router-id"], "status": "active", "tenant": null, "address": "10.128.15.2/32", "created": "2021-03-24", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-24T16:17:53.245Z", "custom_fields": {}, "assigned_object_id": 308, "assigned_object_type": 5}	50	5	1
435	2021-03-24 16:17:53.283888+00	admin	4446625a-e3c6-4e58-b68b-2053eed97263	update	20	309	10.128.15.3/32	{"vrf": 3, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.15.3/32", "created": "2021-03-24", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-24T16:17:53.278Z", "custom_fields": {}, "assigned_object_id": 309, "assigned_object_type": 5}	50	5	1
436	2021-03-24 16:17:53.295549+00	admin	4446625a-e3c6-4e58-b68b-2053eed97263	update	20	309	10.128.15.3/32	{"vrf": 3, "role": "", "tags": ["bgp-originate", "router-id"], "status": "active", "tenant": null, "address": "10.128.15.3/32", "created": "2021-03-24", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-24T16:17:53.278Z", "custom_fields": {}, "assigned_object_id": 309, "assigned_object_type": 5}	50	5	1
437	2021-03-24 16:17:53.314791+00	admin	4446625a-e3c6-4e58-b68b-2053eed97263	update	15	313	10.128.31.1/32	{"vrf": 2, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.31.1/32", "created": "2021-03-24", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-24T16:17:53.309Z", "custom_fields": {}, "assigned_object_id": 313, "assigned_object_type": 5}	50	5	1
438	2021-03-24 16:17:53.327289+00	admin	4446625a-e3c6-4e58-b68b-2053eed97263	update	15	313	10.128.31.1/32	{"vrf": 2, "role": "", "tags": ["bgp-originate", "router-id"], "status": "active", "tenant": null, "address": "10.128.31.1/32", "created": "2021-03-24", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-24T16:17:53.309Z", "custom_fields": {}, "assigned_object_id": 313, "assigned_object_type": 5}	50	5	1
439	2021-03-24 16:17:53.345366+00	admin	4446625a-e3c6-4e58-b68b-2053eed97263	update	18	311	10.128.31.2/32	{"vrf": 2, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.31.2/32", "created": "2021-03-24", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-24T16:17:53.340Z", "custom_fields": {}, "assigned_object_id": 311, "assigned_object_type": 5}	50	5	1
440	2021-03-24 16:17:53.357866+00	admin	4446625a-e3c6-4e58-b68b-2053eed97263	update	18	311	10.128.31.2/32	{"vrf": 2, "role": "", "tags": ["bgp-originate", "router-id"], "status": "active", "tenant": null, "address": "10.128.31.2/32", "created": "2021-03-24", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-24T16:17:53.340Z", "custom_fields": {}, "assigned_object_id": 311, "assigned_object_type": 5}	50	5	1
441	2021-03-24 16:17:53.37663+00	admin	4446625a-e3c6-4e58-b68b-2053eed97263	update	21	312	10.128.31.3/32	{"vrf": 2, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.31.3/32", "created": "2021-03-24", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-24T16:17:53.371Z", "custom_fields": {}, "assigned_object_id": 312, "assigned_object_type": 5}	50	5	1
442	2021-03-24 16:17:53.388643+00	admin	4446625a-e3c6-4e58-b68b-2053eed97263	update	21	312	10.128.31.3/32	{"vrf": 2, "role": "", "tags": ["bgp-originate", "router-id"], "status": "active", "tenant": null, "address": "10.128.31.3/32", "created": "2021-03-24", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-24T16:17:53.371Z", "custom_fields": {}, "assigned_object_id": 312, "assigned_object_type": 5}	50	5	1
443	2021-03-24 16:17:53.406697+00	admin	4446625a-e3c6-4e58-b68b-2053eed97263	update	16	316	10.128.47.1/32	{"vrf": 1, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.47.1/32", "created": "2021-03-24", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-24T16:17:53.402Z", "custom_fields": {}, "assigned_object_id": 316, "assigned_object_type": 5}	50	5	1
444	2021-03-24 16:17:53.418974+00	admin	4446625a-e3c6-4e58-b68b-2053eed97263	update	16	316	10.128.47.1/32	{"vrf": 1, "role": "", "tags": ["bgp-originate", "router-id"], "status": "active", "tenant": null, "address": "10.128.47.1/32", "created": "2021-03-24", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-24T16:17:53.402Z", "custom_fields": {}, "assigned_object_id": 316, "assigned_object_type": 5}	50	5	1
445	2021-03-24 16:17:53.437208+00	admin	4446625a-e3c6-4e58-b68b-2053eed97263	update	19	314	10.128.47.2/32	{"vrf": 1, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.47.2/32", "created": "2021-03-24", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-24T16:17:53.432Z", "custom_fields": {}, "assigned_object_id": 314, "assigned_object_type": 5}	50	5	1
446	2021-03-24 16:17:53.450019+00	admin	4446625a-e3c6-4e58-b68b-2053eed97263	update	19	314	10.128.47.2/32	{"vrf": 1, "role": "", "tags": ["bgp-originate", "router-id"], "status": "active", "tenant": null, "address": "10.128.47.2/32", "created": "2021-03-24", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-24T16:17:53.432Z", "custom_fields": {}, "assigned_object_id": 314, "assigned_object_type": 5}	50	5	1
447	2021-03-24 16:17:53.475557+00	admin	4446625a-e3c6-4e58-b68b-2053eed97263	update	22	315	10.128.47.3/32	{"vrf": 1, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.47.3/32", "created": "2021-03-24", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-24T16:17:53.469Z", "custom_fields": {}, "assigned_object_id": 315, "assigned_object_type": 5}	50	5	1
448	2021-03-24 16:17:53.486302+00	admin	4446625a-e3c6-4e58-b68b-2053eed97263	update	22	315	10.128.47.3/32	{"vrf": 1, "role": "", "tags": ["bgp-originate", "router-id"], "status": "active", "tenant": null, "address": "10.128.47.3/32", "created": "2021-03-24", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-24T16:17:53.469Z", "custom_fields": {}, "assigned_object_id": 315, "assigned_object_type": 5}	50	5	1
449	2021-03-24 21:10:49.268132+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	199	5	Ethernet2	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet2", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
450	2021-03-24 21:10:49.285366+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	200	5	Ethernet3	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet3", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
451	2021-03-24 21:10:49.301062+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	201	5	Ethernet4	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet4", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
452	2021-03-24 21:10:49.319698+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	202	5	Ethernet5	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet5", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
453	2021-03-24 21:10:49.336391+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	203	5	Ethernet6	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet6", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
454	2021-03-24 21:10:49.352068+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	204	5	Ethernet7	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet7", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
455	2021-03-24 21:10:49.368465+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	205	5	Ethernet8	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet8", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
456	2021-03-24 21:10:49.385594+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	206	5	Ethernet9	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet9", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
457	2021-03-24 21:10:49.404746+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	207	5	Ethernet10	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet10", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
458	2021-03-24 21:10:49.423149+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	208	5	Ethernet11	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet11", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
459	2021-03-24 21:10:49.439956+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	209	5	Ethernet12	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet12", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
460	2021-03-24 21:10:49.45732+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	210	5	Ethernet13	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet13", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
461	2021-03-24 21:10:49.474655+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	211	5	Ethernet14	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet14", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
462	2021-03-24 21:10:49.491491+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	212	5	Ethernet15	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet15", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
463	2021-03-24 21:10:49.509451+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	213	5	Ethernet16	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet16", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
464	2021-03-24 21:10:49.526842+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	214	5	Ethernet17	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet17", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
465	2021-03-24 21:10:49.542283+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	215	5	Ethernet18	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet18", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
466	2021-03-24 21:10:49.559365+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	216	5	Ethernet19	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet19", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
467	2021-03-24 21:10:49.575542+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	217	5	Ethernet20	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet20", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
468	2021-03-24 21:10:49.592524+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	218	5	Ethernet21	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet21", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
469	2021-03-24 21:10:49.609511+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	219	5	Ethernet22	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet22", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
470	2021-03-24 21:10:49.624143+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	220	5	Ethernet23	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet23", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
471	2021-03-24 21:10:49.638719+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	221	5	Ethernet24	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet24", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
472	2021-03-24 21:10:49.653579+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	222	5	Ethernet25	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet25", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
473	2021-03-24 21:10:49.668147+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	223	5	Ethernet26	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet26", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
474	2021-03-24 21:10:49.682399+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	224	5	Ethernet27	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet27", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
475	2021-03-24 21:10:49.696981+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	225	5	Ethernet28	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet28", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
476	2021-03-24 21:10:49.71194+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	226	5	Ethernet29	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet29", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
477	2021-03-24 21:10:49.726314+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	227	5	Ethernet30	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet30", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
478	2021-03-24 21:10:49.741151+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	228	5	Ethernet31	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet31", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
479	2021-03-24 21:10:49.755558+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	229	5	Ethernet32	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet32", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
480	2021-03-24 21:10:49.770639+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	230	5	Ethernet33	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet33", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
481	2021-03-24 21:10:49.786011+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	231	5	Ethernet34	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet34", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
482	2021-03-24 21:10:49.802702+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	232	5	Ethernet35	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet35", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
483	2021-03-24 21:10:49.820238+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	233	5	Ethernet36	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet36", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
484	2021-03-24 21:10:49.836655+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	234	5	Ethernet37	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet37", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
485	2021-03-24 21:10:49.85313+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	235	5	Ethernet38	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet38", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
486	2021-03-24 21:10:49.86952+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	236	5	Ethernet39	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet39", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
487	2021-03-24 21:10:49.886017+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	237	5	Ethernet40	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet40", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
488	2021-03-24 21:10:49.903783+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	238	5	Ethernet41	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet41", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
489	2021-03-24 21:10:49.921418+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	239	5	Ethernet42	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet42", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
490	2021-03-24 21:10:49.940469+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	240	5	Ethernet43	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet43", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
491	2021-03-24 21:10:49.956816+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	241	5	Ethernet44	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet44", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
492	2021-03-24 21:10:49.974089+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	242	5	Ethernet45	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet45", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
493	2021-03-24 21:10:49.991265+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	243	5	Ethernet46	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet46", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
494	2021-03-24 21:10:50.012219+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	244	5	Ethernet47	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet47", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
495	2021-03-24 21:10:50.028779+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	245	5	Ethernet48	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet48", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
496	2021-03-24 21:10:50.044931+00	admin	c370e45b-7bc6-4341-9852-57a2fd145402	update	246	5	Loopback0	{"lag": null, "mtu": null, "mode": "", "name": "Loopback0", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
497	2021-03-24 21:11:42.774751+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	248	6	Ethernet2	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet2", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
498	2021-03-24 21:11:42.792069+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	249	6	Ethernet3	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet3", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
499	2021-03-24 21:11:42.808689+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	250	6	Ethernet4	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet4", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
500	2021-03-24 21:11:42.824462+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	251	6	Ethernet5	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet5", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
501	2021-03-24 21:11:42.839999+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	252	6	Ethernet6	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet6", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
502	2021-03-24 21:11:42.856206+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	253	6	Ethernet7	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet7", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
503	2021-03-24 21:11:42.874506+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	254	6	Ethernet8	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet8", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
504	2021-03-24 21:11:42.890973+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	255	6	Ethernet9	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet9", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
505	2021-03-24 21:11:42.90975+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	256	6	Ethernet10	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet10", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
506	2021-03-24 21:11:42.927152+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	257	6	Ethernet11	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet11", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
507	2021-03-24 21:11:42.947121+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	258	6	Ethernet12	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet12", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
508	2021-03-24 21:11:42.964821+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	259	6	Ethernet13	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet13", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
509	2021-03-24 21:11:42.983186+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	260	6	Ethernet14	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet14", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
510	2021-03-24 21:11:43.000222+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	261	6	Ethernet15	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet15", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
511	2021-03-24 21:11:43.018235+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	262	6	Ethernet16	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet16", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
512	2021-03-24 21:11:43.036669+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	263	6	Ethernet17	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet17", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
513	2021-03-24 21:11:43.052946+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	264	6	Ethernet18	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet18", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
514	2021-03-24 21:11:43.069687+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	265	6	Ethernet19	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet19", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
515	2021-03-24 21:11:43.086573+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	266	6	Ethernet20	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet20", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
516	2021-03-24 21:11:43.103916+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	267	6	Ethernet21	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet21", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
517	2021-03-24 21:11:43.121175+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	268	6	Ethernet22	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet22", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
518	2021-03-24 21:11:43.138186+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	269	6	Ethernet23	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet23", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
519	2021-03-24 21:11:43.155128+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	270	6	Ethernet24	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet24", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
520	2021-03-24 21:11:43.173026+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	271	6	Ethernet25	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet25", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
521	2021-03-24 21:11:43.188832+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	272	6	Ethernet26	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet26", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
522	2021-03-24 21:11:43.204434+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	273	6	Ethernet27	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet27", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
523	2021-03-24 21:11:43.220323+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	274	6	Ethernet28	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet28", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
524	2021-03-24 21:11:43.237486+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	275	6	Ethernet29	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet29", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
525	2021-03-24 21:11:43.254273+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	276	6	Ethernet30	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet30", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
526	2021-03-24 21:11:43.27097+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	277	6	Ethernet31	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet31", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
527	2021-03-24 21:11:43.287115+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	278	6	Ethernet32	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet32", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
528	2021-03-24 21:11:43.302372+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	279	6	Ethernet33	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet33", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
529	2021-03-24 21:11:43.318557+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	280	6	Ethernet34	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet34", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
530	2021-03-24 21:11:43.334699+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	281	6	Ethernet35	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet35", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
531	2021-03-24 21:11:43.350526+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	282	6	Ethernet36	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet36", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
532	2021-03-24 21:11:43.365889+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	283	6	Ethernet37	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet37", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
533	2021-03-24 21:11:43.381484+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	284	6	Ethernet38	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet38", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
534	2021-03-24 21:11:43.396949+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	285	6	Ethernet39	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet39", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
535	2021-03-24 21:11:43.412811+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	286	6	Ethernet40	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet40", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
536	2021-03-24 21:11:43.428536+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	287	6	Ethernet41	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet41", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
537	2021-03-24 21:11:43.444196+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	288	6	Ethernet42	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet42", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
538	2021-03-24 21:11:43.460179+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	289	6	Ethernet43	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet43", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
539	2021-03-24 21:11:43.476517+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	290	6	Ethernet44	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet44", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
540	2021-03-24 21:11:43.492123+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	291	6	Ethernet45	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet45", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
541	2021-03-24 21:11:43.508681+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	292	6	Ethernet46	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet46", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
542	2021-03-24 21:11:43.525157+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	293	6	Ethernet47	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet47", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
543	2021-03-24 21:11:43.541406+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	294	6	Ethernet48	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet48", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
544	2021-03-24 21:11:43.55809+00	admin	eb6308e6-48ae-4f5f-8513-6a4e2322c5ba	update	295	6	Loopback0	{"lag": null, "mtu": null, "mode": "", "name": "Loopback0", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 6, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
545	2021-03-24 21:12:34.956402+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	151	4	Ethernet3	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet3", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
546	2021-03-24 21:12:34.971868+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	152	4	Ethernet4	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet4", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
547	2021-03-24 21:12:34.985875+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	153	4	Ethernet5	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet5", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
548	2021-03-24 21:12:35.000617+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	154	4	Ethernet6	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet6", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
549	2021-03-24 21:12:35.016028+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	155	4	Ethernet7	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet7", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
550	2021-03-24 21:12:35.033312+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	156	4	Ethernet8	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet8", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
551	2021-03-24 21:12:35.050208+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	157	4	Ethernet9	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet9", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
552	2021-03-24 21:12:35.067433+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	158	4	Ethernet10	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet10", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
553	2021-03-24 21:12:35.085043+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	159	4	Ethernet11	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet11", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
554	2021-03-24 21:12:35.102258+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	160	4	Ethernet12	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet12", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
555	2021-03-24 21:12:35.121449+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	161	4	Ethernet13	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet13", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
556	2021-03-24 21:12:35.141465+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	162	4	Ethernet14	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet14", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
557	2021-03-24 21:12:35.1574+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	163	4	Ethernet15	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet15", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
558	2021-03-24 21:12:35.172475+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	164	4	Ethernet16	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet16", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
559	2021-03-24 21:12:35.188291+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	165	4	Ethernet17	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet17", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
560	2021-03-24 21:12:35.204093+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	166	4	Ethernet18	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet18", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
561	2021-03-24 21:12:35.21969+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	167	4	Ethernet19	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet19", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
562	2021-03-24 21:12:35.235461+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	168	4	Ethernet20	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet20", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
563	2021-03-24 21:12:35.251393+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	169	4	Ethernet21	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet21", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
564	2021-03-24 21:12:35.267932+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	170	4	Ethernet22	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet22", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
565	2021-03-24 21:12:35.281756+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	171	4	Ethernet23	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet23", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
566	2021-03-24 21:12:35.295404+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	172	4	Ethernet24	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet24", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
567	2021-03-24 21:12:35.309679+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	173	4	Ethernet25	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet25", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
568	2021-03-24 21:12:35.324482+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	174	4	Ethernet26	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet26", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
569	2021-03-24 21:12:35.338926+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	175	4	Ethernet27	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet27", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
570	2021-03-24 21:12:35.353795+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	176	4	Ethernet28	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet28", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
571	2021-03-24 21:12:35.368416+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	177	4	Ethernet29	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet29", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
572	2021-03-24 21:12:35.383099+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	178	4	Ethernet30	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet30", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
573	2021-03-24 21:12:35.397551+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	179	4	Ethernet31	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet31", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
574	2021-03-24 21:12:35.412516+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	180	4	Ethernet32	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet32", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
575	2021-03-24 21:12:35.427503+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	181	4	Ethernet33	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet33", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
576	2021-03-24 21:12:35.442932+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	182	4	Ethernet34	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet34", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
577	2021-03-24 21:12:35.458792+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	183	4	Ethernet35	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet35", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
578	2021-03-24 21:12:35.473815+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	184	4	Ethernet36	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet36", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
579	2021-03-24 21:12:35.490055+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	185	4	Ethernet37	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet37", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
580	2021-03-24 21:12:35.506659+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	186	4	Ethernet38	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet38", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
581	2021-03-24 21:12:35.524266+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	187	4	Ethernet39	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet39", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
582	2021-03-24 21:12:35.540808+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	188	4	Ethernet40	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet40", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
583	2021-03-24 21:12:35.55783+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	189	4	Ethernet41	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet41", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
584	2021-03-24 21:12:35.573171+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	190	4	Ethernet42	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet42", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
585	2021-03-24 21:12:35.589353+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	191	4	Ethernet43	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet43", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
586	2021-03-24 21:12:35.606105+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	192	4	Ethernet44	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet44", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
587	2021-03-24 21:12:35.624213+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	193	4	Ethernet45	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet45", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
588	2021-03-24 21:12:35.64109+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	194	4	Ethernet46	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet46", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
589	2021-03-24 21:12:35.657035+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	195	4	Ethernet47	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet47", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
590	2021-03-24 21:12:35.685355+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	196	4	Ethernet48	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet48", "tags": [], "type": "10gbase-x-sfpp", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
591	2021-03-24 21:12:35.702697+00	admin	ec3ec22b-f5ad-49a2-bc22-8cd283f504cf	update	197	4	Loopback0	{"lag": null, "mtu": null, "mode": "", "name": "Loopback0", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
592	2021-03-25 15:20:19.575096+00	admin	78a45ebf-35fd-40b3-8b0f-0e6a27eaa128	update	149	4	Ethernet1	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1", "tags": [], "type": "10gbase-x-sfpp", "cable": 1, "label": "", "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
593	2021-03-25 15:20:19.594055+00	admin	78a45ebf-35fd-40b3-8b0f-0e6a27eaa128	update	149	4	Ethernet1	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1", "tags": ["interface-type-fabric-base"], "type": "10gbase-x-sfpp", "cable": 1, "label": "", "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
594	2021-03-25 15:20:19.617216+00	admin	78a45ebf-35fd-40b3-8b0f-0e6a27eaa128	update	150	4	Ethernet2	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet2", "tags": [], "type": "10gbase-x-sfpp", "cable": 2, "label": "", "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
595	2021-03-25 15:20:19.631614+00	admin	78a45ebf-35fd-40b3-8b0f-0e6a27eaa128	update	150	4	Ethernet2	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet2", "tags": ["interface-type-fabric-base"], "type": "10gbase-x-sfpp", "cable": 2, "label": "", "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
596	2021-03-25 15:20:48.380123+00	admin	a04befff-d45c-4284-b4c8-41e96a4f1e23	update	302	4	Ethernet1.100	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.100", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
597	2021-03-25 15:20:48.391409+00	admin	a04befff-d45c-4284-b4c8-41e96a4f1e23	update	302	4	Ethernet1.100	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.100", "tags": ["interface-type-fabric-transit"], "type": "virtual", "cable": null, "label": "", "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
598	2021-03-25 15:20:48.40558+00	admin	a04befff-d45c-4284-b4c8-41e96a4f1e23	update	303	4	Ethernet1.200	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.200", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
599	2021-03-25 15:20:48.41733+00	admin	a04befff-d45c-4284-b4c8-41e96a4f1e23	update	303	4	Ethernet1.200	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.200", "tags": ["interface-type-fabric-transit"], "type": "virtual", "cable": null, "label": "", "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
600	2021-03-25 15:20:48.431977+00	admin	a04befff-d45c-4284-b4c8-41e96a4f1e23	update	304	4	Ethernet1.400	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.400", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
601	2021-03-25 15:20:48.442323+00	admin	a04befff-d45c-4284-b4c8-41e96a4f1e23	update	304	4	Ethernet1.400	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.400", "tags": ["interface-type-fabric-transit"], "type": "virtual", "cable": null, "label": "", "device": 4, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
602	2021-03-25 15:20:48.457883+00	admin	a04befff-d45c-4284-b4c8-41e96a4f1e23	update	305	4	Ethernet2.100	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet2.100", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
603	2021-03-25 15:20:48.470855+00	admin	a04befff-d45c-4284-b4c8-41e96a4f1e23	update	305	4	Ethernet2.100	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet2.100", "tags": ["interface-type-fabric-transit"], "type": "virtual", "cable": null, "label": "", "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
604	2021-03-25 15:20:48.48803+00	admin	a04befff-d45c-4284-b4c8-41e96a4f1e23	update	306	4	Ethernet2.200	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet2.200", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
605	2021-03-25 15:20:48.499688+00	admin	a04befff-d45c-4284-b4c8-41e96a4f1e23	update	306	4	Ethernet2.200	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet2.200", "tags": ["interface-type-fabric-transit"], "type": "virtual", "cable": null, "label": "", "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
606	2021-03-25 15:20:48.517508+00	admin	a04befff-d45c-4284-b4c8-41e96a4f1e23	update	307	4	Ethernet2.400	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet2.400", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
607	2021-03-25 15:20:48.529282+00	admin	a04befff-d45c-4284-b4c8-41e96a4f1e23	update	307	4	Ethernet2.400	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet2.400", "tags": ["interface-type-fabric-transit"], "type": "virtual", "cable": null, "label": "", "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
608	2021-03-25 15:21:24.260901+00	admin	6f93ae2d-79f2-4c28-8a58-b595e00a0274	update	198	5	Ethernet1	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1", "tags": [], "type": "10gbase-x-sfpp", "cable": 1, "label": "", "device": 5, "enabled": true, "mgmt_only": false, "description": "", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
609	2021-03-25 15:21:24.282409+00	admin	6f93ae2d-79f2-4c28-8a58-b595e00a0274	update	198	5	Ethernet1	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1", "tags": ["interface-type-fabric-base"], "type": "10gbase-x-sfpp", "cable": 1, "label": "", "device": 5, "enabled": true, "mgmt_only": false, "description": "", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
610	2021-03-25 15:21:42.867108+00	admin	d32a6747-bbb9-4feb-869f-fb8ebdfea0ee	update	296	5	Ethernet1.100	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.100", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 5, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
611	2021-03-25 15:21:42.880849+00	admin	d32a6747-bbb9-4feb-869f-fb8ebdfea0ee	update	296	5	Ethernet1.100	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.100", "tags": ["interface-type-fabric-transit"], "type": "virtual", "cable": null, "label": "", "device": 5, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
612	2021-03-25 15:21:42.898136+00	admin	d32a6747-bbb9-4feb-869f-fb8ebdfea0ee	update	297	5	Ethernet1.200	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.200", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 5, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
613	2021-03-25 15:21:42.911637+00	admin	d32a6747-bbb9-4feb-869f-fb8ebdfea0ee	update	297	5	Ethernet1.200	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.200", "tags": ["interface-type-fabric-transit"], "type": "virtual", "cable": null, "label": "", "device": 5, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
614	2021-03-25 15:21:42.92823+00	admin	d32a6747-bbb9-4feb-869f-fb8ebdfea0ee	update	298	5	Ethernet1.400	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.400", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
615	2021-03-25 15:21:42.942379+00	admin	d32a6747-bbb9-4feb-869f-fb8ebdfea0ee	update	298	5	Ethernet1.400	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.400", "tags": ["interface-type-fabric-transit"], "type": "virtual", "cable": null, "label": "", "device": 5, "enabled": false, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
616	2021-03-25 15:22:01.495624+00	admin	7368ff04-7283-4b58-860c-dfa32d2284f0	update	247	6	Ethernet1	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1", "tags": [], "type": "10gbase-x-sfpp", "cable": 2, "label": "", "device": 6, "enabled": true, "mgmt_only": false, "description": "", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
617	2021-03-25 15:22:01.533243+00	admin	7368ff04-7283-4b58-860c-dfa32d2284f0	update	247	6	Ethernet1	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1", "tags": ["interface-type-fabric-base"], "type": "10gbase-x-sfpp", "cable": 2, "label": "", "device": 6, "enabled": true, "mgmt_only": false, "description": "", "mac_address": "", "tagged_vlans": [], "untagged_vlan": null}	5	13	1
618	2021-03-25 15:22:17.558244+00	admin	08460a3d-b57b-4790-99ce-5d93c953cb6f	update	299	6	Ethernet1.100	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.100", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 6, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
619	2021-03-25 15:22:17.573299+00	admin	08460a3d-b57b-4790-99ce-5d93c953cb6f	update	299	6	Ethernet1.100	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.100", "tags": ["interface-type-fabric-transit"], "type": "virtual", "cable": null, "label": "", "device": 6, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
620	2021-03-25 15:22:17.58927+00	admin	08460a3d-b57b-4790-99ce-5d93c953cb6f	update	300	6	Ethernet1.200	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.200", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 6, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
621	2021-03-25 15:22:17.599843+00	admin	08460a3d-b57b-4790-99ce-5d93c953cb6f	update	300	6	Ethernet1.200	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.200", "tags": ["interface-type-fabric-transit"], "type": "virtual", "cable": null, "label": "", "device": 6, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
622	2021-03-25 15:22:17.614155+00	admin	08460a3d-b57b-4790-99ce-5d93c953cb6f	update	301	6	Ethernet1.400	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.400", "tags": [], "type": "virtual", "cable": null, "label": "", "device": 6, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
623	2021-03-25 15:22:17.624819+00	admin	08460a3d-b57b-4790-99ce-5d93c953cb6f	update	301	6	Ethernet1.400	{"lag": null, "mtu": null, "mode": "", "name": "Ethernet1.400", "tags": ["interface-type-fabric-transit"], "type": "virtual", "cable": null, "label": "", "device": 6, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null}	5	13	1
624	2021-03-25 15:48:12.64345+00	admin	c1e3403b-6628-4a01-9af4-b6742d25777a	update	1	302	10.128.14.0/31	{"vrf": 3, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.14.0/31", "created": "2021-03-05", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-25T15:48:12.632Z", "custom_fields": {}, "assigned_object_id": 302, "assigned_object_type": 5}	50	5	1
625	2021-03-25 15:48:12.657466+00	admin	c1e3403b-6628-4a01-9af4-b6742d25777a	update	1	302	10.128.14.0/31	{"vrf": 3, "role": "", "tags": ["bgp-originate"], "status": "active", "tenant": null, "address": "10.128.14.0/31", "created": "2021-03-05", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-25T15:48:12.632Z", "custom_fields": {}, "assigned_object_id": 302, "assigned_object_type": 5}	50	5	1
626	2021-03-25 15:48:12.676947+00	admin	c1e3403b-6628-4a01-9af4-b6742d25777a	update	8	296	10.128.14.1/31	{"vrf": 3, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.14.1/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-25T15:48:12.671Z", "custom_fields": {}, "assigned_object_id": 296, "assigned_object_type": 5}	50	5	1
627	2021-03-25 15:48:12.685984+00	admin	c1e3403b-6628-4a01-9af4-b6742d25777a	update	8	296	10.128.14.1/31	{"vrf": 3, "role": "", "tags": ["bgp-originate"], "status": "active", "tenant": null, "address": "10.128.14.1/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-25T15:48:12.671Z", "custom_fields": {}, "assigned_object_id": 296, "assigned_object_type": 5}	50	5	1
628	2021-03-25 15:48:12.701362+00	admin	c1e3403b-6628-4a01-9af4-b6742d25777a	update	5	305	10.128.14.2/31	{"vrf": 3, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.14.2/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-25T15:48:12.696Z", "custom_fields": {}, "assigned_object_id": 305, "assigned_object_type": 5}	50	5	1
629	2021-03-25 15:48:12.708991+00	admin	c1e3403b-6628-4a01-9af4-b6742d25777a	update	5	305	10.128.14.2/31	{"vrf": 3, "role": "", "tags": ["bgp-originate"], "status": "active", "tenant": null, "address": "10.128.14.2/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-25T15:48:12.696Z", "custom_fields": {}, "assigned_object_id": 305, "assigned_object_type": 5}	50	5	1
630	2021-03-25 15:48:12.723952+00	admin	c1e3403b-6628-4a01-9af4-b6742d25777a	update	11	299	10.128.14.3/31	{"vrf": 3, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.14.3/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-25T15:48:12.719Z", "custom_fields": {}, "assigned_object_id": 299, "assigned_object_type": 5}	50	5	1
631	2021-03-25 15:48:12.733139+00	admin	c1e3403b-6628-4a01-9af4-b6742d25777a	update	11	299	10.128.14.3/31	{"vrf": 3, "role": "", "tags": ["bgp-originate"], "status": "active", "tenant": null, "address": "10.128.14.3/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-25T15:48:12.719Z", "custom_fields": {}, "assigned_object_id": 299, "assigned_object_type": 5}	50	5	1
632	2021-03-25 15:48:12.749636+00	admin	c1e3403b-6628-4a01-9af4-b6742d25777a	update	2	303	10.128.30.0/31	{"vrf": 2, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.30.0/31", "created": "2021-03-05", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-25T15:48:12.745Z", "custom_fields": {}, "assigned_object_id": 303, "assigned_object_type": 5}	50	5	1
633	2021-03-25 15:48:12.842362+00	admin	c1e3403b-6628-4a01-9af4-b6742d25777a	update	2	303	10.128.30.0/31	{"vrf": 2, "role": "", "tags": ["bgp-originate"], "status": "active", "tenant": null, "address": "10.128.30.0/31", "created": "2021-03-05", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-25T15:48:12.745Z", "custom_fields": {}, "assigned_object_id": 303, "assigned_object_type": 5}	50	5	1
634	2021-03-25 15:48:12.861474+00	admin	c1e3403b-6628-4a01-9af4-b6742d25777a	update	9	297	10.128.30.1/31	{"vrf": 2, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.30.1/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-25T15:48:12.856Z", "custom_fields": {}, "assigned_object_id": 297, "assigned_object_type": 5}	50	5	1
635	2021-03-25 15:48:12.870313+00	admin	c1e3403b-6628-4a01-9af4-b6742d25777a	update	9	297	10.128.30.1/31	{"vrf": 2, "role": "", "tags": ["bgp-originate"], "status": "active", "tenant": null, "address": "10.128.30.1/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-25T15:48:12.856Z", "custom_fields": {}, "assigned_object_id": 297, "assigned_object_type": 5}	50	5	1
636	2021-03-25 15:48:12.888322+00	admin	c1e3403b-6628-4a01-9af4-b6742d25777a	update	6	306	10.128.30.2/31	{"vrf": 2, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.30.2/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-25T15:48:12.883Z", "custom_fields": {}, "assigned_object_id": 306, "assigned_object_type": 5}	50	5	1
637	2021-03-25 15:48:12.89863+00	admin	c1e3403b-6628-4a01-9af4-b6742d25777a	update	6	306	10.128.30.2/31	{"vrf": 2, "role": "", "tags": ["bgp-originate"], "status": "active", "tenant": null, "address": "10.128.30.2/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-25T15:48:12.883Z", "custom_fields": {}, "assigned_object_id": 306, "assigned_object_type": 5}	50	5	1
638	2021-03-25 15:48:12.917532+00	admin	c1e3403b-6628-4a01-9af4-b6742d25777a	update	12	300	10.128.30.3/31	{"vrf": 2, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.30.3/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-25T15:48:12.912Z", "custom_fields": {}, "assigned_object_id": 300, "assigned_object_type": 5}	50	5	1
639	2021-03-25 15:48:12.927357+00	admin	c1e3403b-6628-4a01-9af4-b6742d25777a	update	12	300	10.128.30.3/31	{"vrf": 2, "role": "", "tags": ["bgp-originate"], "status": "active", "tenant": null, "address": "10.128.30.3/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-25T15:48:12.912Z", "custom_fields": {}, "assigned_object_id": 300, "assigned_object_type": 5}	50	5	1
640	2021-03-25 15:48:12.947416+00	admin	c1e3403b-6628-4a01-9af4-b6742d25777a	update	4	304	10.128.46.0/31	{"vrf": 1, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.46.0/31", "created": "2021-03-05", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-25T15:48:12.941Z", "custom_fields": {}, "assigned_object_id": 304, "assigned_object_type": 5}	50	5	1
641	2021-03-25 15:48:12.957257+00	admin	c1e3403b-6628-4a01-9af4-b6742d25777a	update	4	304	10.128.46.0/31	{"vrf": 1, "role": "", "tags": ["bgp-originate"], "status": "active", "tenant": null, "address": "10.128.46.0/31", "created": "2021-03-05", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-25T15:48:12.941Z", "custom_fields": {}, "assigned_object_id": 304, "assigned_object_type": 5}	50	5	1
642	2021-03-25 15:48:12.976187+00	admin	c1e3403b-6628-4a01-9af4-b6742d25777a	update	10	298	10.128.46.1/31	{"vrf": 1, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.46.1/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-25T15:48:12.970Z", "custom_fields": {}, "assigned_object_id": 298, "assigned_object_type": 5}	50	5	1
643	2021-03-25 15:48:12.985477+00	admin	c1e3403b-6628-4a01-9af4-b6742d25777a	update	10	298	10.128.46.1/31	{"vrf": 1, "role": "", "tags": ["bgp-originate"], "status": "active", "tenant": null, "address": "10.128.46.1/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-25T15:48:12.970Z", "custom_fields": {}, "assigned_object_id": 298, "assigned_object_type": 5}	50	5	1
644	2021-03-25 15:48:13.00418+00	admin	c1e3403b-6628-4a01-9af4-b6742d25777a	update	7	307	10.128.46.2/31	{"vrf": 1, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.46.2/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-25T15:48:12.999Z", "custom_fields": {}, "assigned_object_id": 307, "assigned_object_type": 5}	50	5	1
645	2021-03-25 15:48:13.014576+00	admin	c1e3403b-6628-4a01-9af4-b6742d25777a	update	7	307	10.128.46.2/31	{"vrf": 1, "role": "", "tags": ["bgp-originate"], "status": "active", "tenant": null, "address": "10.128.46.2/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-25T15:48:12.999Z", "custom_fields": {}, "assigned_object_id": 307, "assigned_object_type": 5}	50	5	1
646	2021-03-25 15:48:13.033736+00	admin	c1e3403b-6628-4a01-9af4-b6742d25777a	update	13	301	10.128.46.3/31	{"vrf": 1, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.46.3/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-25T15:48:13.028Z", "custom_fields": {}, "assigned_object_id": 301, "assigned_object_type": 5}	50	5	1
647	2021-03-25 15:48:13.043065+00	admin	c1e3403b-6628-4a01-9af4-b6742d25777a	update	13	301	10.128.46.3/31	{"vrf": 1, "role": "", "tags": ["bgp-originate"], "status": "active", "tenant": null, "address": "10.128.46.3/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-25T15:48:13.028Z", "custom_fields": {}, "assigned_object_id": 301, "assigned_object_type": 5}	50	5	1
648	2021-03-30 19:59:28.382835+00	admin	a663a48a-dbbf-47a9-9828-4cbc0be07e7c	update	1	302	10.128.14.0/31	{"vrf": 3, "role": "", "tags": ["bgp-originate"], "status": "active", "tenant": null, "address": "10.128.14.0/31", "created": "2021-03-05", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-30T19:59:28.361Z", "custom_fields": {}, "assigned_object_id": 302, "assigned_object_type": 5}	50	5	1
649	2021-03-30 19:59:28.393745+00	admin	a663a48a-dbbf-47a9-9828-4cbc0be07e7c	update	1	302	10.128.14.0/31	{"vrf": 3, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.14.0/31", "created": "2021-03-05", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-30T19:59:28.361Z", "custom_fields": {}, "assigned_object_id": 302, "assigned_object_type": 5}	50	5	1
650	2021-03-30 19:59:28.41341+00	admin	a663a48a-dbbf-47a9-9828-4cbc0be07e7c	update	5	305	10.128.14.2/31	{"vrf": 3, "role": "", "tags": ["bgp-originate"], "status": "active", "tenant": null, "address": "10.128.14.2/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-30T19:59:28.407Z", "custom_fields": {}, "assigned_object_id": 305, "assigned_object_type": 5}	50	5	1
651	2021-03-30 19:59:28.422753+00	admin	a663a48a-dbbf-47a9-9828-4cbc0be07e7c	update	5	305	10.128.14.2/31	{"vrf": 3, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.14.2/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-30T19:59:28.407Z", "custom_fields": {}, "assigned_object_id": 305, "assigned_object_type": 5}	50	5	1
652	2021-03-30 19:59:28.441766+00	admin	a663a48a-dbbf-47a9-9828-4cbc0be07e7c	update	2	303	10.128.30.0/31	{"vrf": 2, "role": "", "tags": ["bgp-originate"], "status": "active", "tenant": null, "address": "10.128.30.0/31", "created": "2021-03-05", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-30T19:59:28.436Z", "custom_fields": {}, "assigned_object_id": 303, "assigned_object_type": 5}	50	5	1
653	2021-03-30 19:59:28.450691+00	admin	a663a48a-dbbf-47a9-9828-4cbc0be07e7c	update	2	303	10.128.30.0/31	{"vrf": 2, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.30.0/31", "created": "2021-03-05", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-30T19:59:28.436Z", "custom_fields": {}, "assigned_object_id": 303, "assigned_object_type": 5}	50	5	1
654	2021-03-30 19:59:28.470233+00	admin	a663a48a-dbbf-47a9-9828-4cbc0be07e7c	update	6	306	10.128.30.2/31	{"vrf": 2, "role": "", "tags": ["bgp-originate"], "status": "active", "tenant": null, "address": "10.128.30.2/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-30T19:59:28.465Z", "custom_fields": {}, "assigned_object_id": 306, "assigned_object_type": 5}	50	5	1
655	2021-03-30 19:59:28.479005+00	admin	a663a48a-dbbf-47a9-9828-4cbc0be07e7c	update	6	306	10.128.30.2/31	{"vrf": 2, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.30.2/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-30T19:59:28.465Z", "custom_fields": {}, "assigned_object_id": 306, "assigned_object_type": 5}	50	5	1
656	2021-03-30 19:59:28.498182+00	admin	a663a48a-dbbf-47a9-9828-4cbc0be07e7c	update	4	304	10.128.46.0/31	{"vrf": 1, "role": "", "tags": ["bgp-originate"], "status": "active", "tenant": null, "address": "10.128.46.0/31", "created": "2021-03-05", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-30T19:59:28.493Z", "custom_fields": {}, "assigned_object_id": 304, "assigned_object_type": 5}	50	5	1
657	2021-03-30 19:59:28.506783+00	admin	a663a48a-dbbf-47a9-9828-4cbc0be07e7c	update	4	304	10.128.46.0/31	{"vrf": 1, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.46.0/31", "created": "2021-03-05", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-30T19:59:28.493Z", "custom_fields": {}, "assigned_object_id": 304, "assigned_object_type": 5}	50	5	1
658	2021-03-30 19:59:28.524981+00	admin	a663a48a-dbbf-47a9-9828-4cbc0be07e7c	update	7	307	10.128.46.2/31	{"vrf": 1, "role": "", "tags": ["bgp-originate"], "status": "active", "tenant": null, "address": "10.128.46.2/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-30T19:59:28.520Z", "custom_fields": {}, "assigned_object_id": 307, "assigned_object_type": 5}	50	5	1
659	2021-03-30 19:59:28.534037+00	admin	a663a48a-dbbf-47a9-9828-4cbc0be07e7c	update	7	307	10.128.46.2/31	{"vrf": 1, "role": "", "tags": [], "status": "active", "tenant": null, "address": "10.128.46.2/31", "created": "2021-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2021-03-30T19:59:28.520Z", "custom_fields": {}, "assigned_object_id": 307, "assigned_object_type": 5}	50	5	1
\.


--
-- Data for Name: extras_tag; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_tag (id, name, slug, color, description, created, last_updated) FROM stdin;
1	interface-type-fabric-base	interface-type-fabric-base	9e9e9e		2021-03-24	2021-03-24 15:42:32.144441+00
2	interface-type-fabric-transit	interface-type-fabric-transit	9e9e9e		2021-03-24	2021-03-24 15:42:43.103003+00
3	role-spine	role-spine	9c27b0		2021-03-24	2021-03-24 15:44:48.306868+00
4	role-leaf-access	role-leaf-access	2196f3		2021-03-24	2021-03-24 15:48:52.059046+00
5	role-leaf-border	role-leaf-border	f44336		2021-03-24	2021-03-24 15:49:08.944409+00
6	bgp-originate	bgp-originate	9e9e9e		2021-03-24	2021-03-24 15:54:12.914295+00
7	router-id	router-id	9e9e9e		2021-03-24	2021-03-24 15:54:16.978598+00
\.


--
-- Data for Name: extras_taggeditem; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
1	3	55	3
2	3	55	4
3	2	55	3
4	2	55	4
5	1	55	3
6	1	55	4
7	3	55	5
8	2	55	5
9	14	50	6
10	14	50	7
11	17	50	6
12	17	50	7
13	20	50	6
14	20	50	7
15	15	50	6
16	15	50	7
17	18	50	6
18	18	50	7
19	21	50	6
20	21	50	7
21	16	50	6
22	16	50	7
23	19	50	6
24	19	50	7
25	22	50	6
26	22	50	7
27	149	5	1
28	150	5	1
29	302	5	2
30	303	5	2
31	304	5	2
32	305	5	2
33	306	5	2
34	307	5	2
35	198	5	1
36	296	5	2
37	297	5	2
38	298	5	2
39	247	5	1
40	299	5	2
41	300	5	2
42	301	5	2
44	8	50	6
46	11	50	6
48	9	50	6
50	12	50	6
52	10	50	6
54	13	50	6
\.


--
-- Data for Name: extras_webhook; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_webhook (id, name, type_create, type_update, type_delete, payload_url, http_content_type, secret, enabled, ssl_verification, ca_file_path, additional_headers, http_method, body_template) FROM stdin;
\.


--
-- Data for Name: extras_webhook_content_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_webhook_content_types (id, webhook_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: ipam_aggregate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_aggregate (id, created, last_updated, prefix, date_added, description, rir_id, custom_field_data, tenant_id) FROM stdin;
\.


--
-- Data for Name: ipam_ipaddress; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_ipaddress (id, created, last_updated, address, description, assigned_object_id, nat_inside_id, vrf_id, tenant_id, status, role, dns_name, assigned_object_type_id, custom_field_data) FROM stdin;
14	2021-03-24	2021-03-24 16:17:53.213792+00	10.128.15.1		310	\N	3	\N	active			5	{}
17	2021-03-24	2021-03-24 16:17:53.245317+00	10.128.15.2		308	\N	3	\N	active			5	{}
20	2021-03-24	2021-03-24 16:17:53.278596+00	10.128.15.3		309	\N	3	\N	active			5	{}
15	2021-03-24	2021-03-24 16:17:53.309794+00	10.128.31.1		313	\N	2	\N	active			5	{}
18	2021-03-24	2021-03-24 16:17:53.3407+00	10.128.31.2		311	\N	2	\N	active			5	{}
21	2021-03-24	2021-03-24 16:17:53.371979+00	10.128.31.3		312	\N	2	\N	active			5	{}
16	2021-03-24	2021-03-24 16:17:53.402054+00	10.128.47.1		316	\N	1	\N	active			5	{}
19	2021-03-24	2021-03-24 16:17:53.432403+00	10.128.47.2		314	\N	1	\N	active			5	{}
22	2021-03-24	2021-03-24 16:17:53.469931+00	10.128.47.3		315	\N	1	\N	active			5	{}
8	2021-03-23	2021-03-25 15:48:12.671422+00	10.128.14.1/31		296	\N	3	\N	active			5	{}
11	2021-03-23	2021-03-25 15:48:12.719838+00	10.128.14.3/31		299	\N	3	\N	active			5	{}
9	2021-03-23	2021-03-25 15:48:12.85637+00	10.128.30.1/31		297	\N	2	\N	active			5	{}
12	2021-03-23	2021-03-25 15:48:12.912452+00	10.128.30.3/31		300	\N	2	\N	active			5	{}
10	2021-03-23	2021-03-25 15:48:12.970988+00	10.128.46.1/31		298	\N	1	\N	active			5	{}
13	2021-03-23	2021-03-25 15:48:13.028932+00	10.128.46.3/31		301	\N	1	\N	active			5	{}
1	2021-03-05	2021-03-30 19:59:28.361019+00	10.128.14.0/31		302	\N	3	\N	active			5	{}
5	2021-03-23	2021-03-30 19:59:28.407735+00	10.128.14.2/31		305	\N	3	\N	active			5	{}
2	2021-03-05	2021-03-30 19:59:28.436805+00	10.128.30.0/31		303	\N	2	\N	active			5	{}
6	2021-03-23	2021-03-30 19:59:28.465119+00	10.128.30.2/31		306	\N	2	\N	active			5	{}
4	2021-03-05	2021-03-30 19:59:28.493052+00	10.128.46.0/31		304	\N	1	\N	active			5	{}
7	2021-03-23	2021-03-30 19:59:28.520045+00	10.128.46.2/31		307	\N	1	\N	active			5	{}
\.


--
-- Data for Name: ipam_prefix; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_prefix (id, created, last_updated, prefix, status, description, role_id, site_id, vlan_id, vrf_id, tenant_id, is_pool, custom_field_data) FROM stdin;
3	2021-03-05	2021-03-05 02:29:07.523916+00	10.128.16.0/20	container		\N	\N	\N	2	\N	f	{}
4	2021-03-05	2021-03-05 02:31:00.546216+00	10.128.32.0/20	container		\N	\N	\N	1	\N	f	{}
2	2021-03-05	2021-03-05 02:42:18.868481+00	10.128.0.0/20	container		\N	\N	\N	3	\N	f	{}
8	2021-03-05	2021-03-05 02:44:09.317108+00	10.128.14.0/24	container	fabric transit - default VRF	\N	\N	\N	3	\N	f	{}
10	2021-03-05	2021-03-05 02:47:20.309385+00	10.128.30.0/24	container	fabric transit - dev VRF	\N	\N	\N	2	\N	f	{}
12	2021-03-05	2021-03-05 02:49:01.739674+00	10.128.46.0/24	container	fabric transit - dmz VRF	\N	\N	\N	1	\N	f	{}
13	2021-03-05	2021-03-05 03:05:01.607591+00	10.128.46.0/31	active	Leaf01/Spine01 transit - dmz	\N	\N	\N	1	\N	f	{}
14	2021-03-05	2021-03-05 03:06:13.118822+00	10.128.46.2/31	active	Leaf02/Spine01 transit - dmz	\N	\N	\N	1	\N	f	{}
11	2021-03-05	2021-03-05 03:07:08.334102+00	10.128.47.0/24	active	Loopback and router ID - dmz VRF	\N	\N	\N	1	\N	f	{}
9	2021-03-05	2021-03-05 03:07:26.213523+00	10.128.31.0/24	active	Loopback and router ID - dev VRF	\N	\N	\N	2	\N	f	{}
7	2021-03-05	2021-03-05 03:07:26.225791+00	10.128.15.0/24	active	Loopback and router ID - global VRF	\N	\N	\N	3	\N	f	{}
15	2021-03-05	2021-03-05 03:08:38.248045+00	10.128.30.0/31	active	Leaf01/Spine01 transit - dev	\N	\N	\N	2	\N	f	{}
16	2021-03-05	2021-03-05 03:09:29.664558+00	10.128.30.2/31	active	Leaf02/Spine01 transit - dev	\N	\N	\N	2	\N	f	{}
17	2021-03-05	2021-03-05 03:11:02.861629+00	10.128.14.0/31	active	Leaf01/Spine01 transit - default	\N	\N	\N	3	\N	f	{}
18	2021-03-05	2021-03-05 03:11:16.108238+00	10.128.14.2/31	active	Leaf02/Spine01 transit - default	\N	\N	\N	3	\N	f	{}
\.


--
-- Data for Name: ipam_rir; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_rir (id, name, slug, is_private, created, last_updated, description) FROM stdin;
1	RFC1918	rfc1918	t	2021-03-03	2021-03-03 22:01:13.691769+00	
\.


--
-- Data for Name: ipam_role; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_role (id, name, slug, weight, created, last_updated, description) FROM stdin;
\.


--
-- Data for Name: ipam_routetarget; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_routetarget (id, created, last_updated, custom_field_data, name, description, tenant_id) FROM stdin;
\.


--
-- Data for Name: ipam_service; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_service (id, created, last_updated, name, protocol, description, device_id, virtual_machine_id, custom_field_data, ports) FROM stdin;
\.


--
-- Data for Name: ipam_service_ipaddresses; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_service_ipaddresses (id, service_id, ipaddress_id) FROM stdin;
\.


--
-- Data for Name: ipam_vlan; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vlan (id, created, last_updated, vid, name, status, role_id, site_id, group_id, description, tenant_id, custom_field_data) FROM stdin;
\.


--
-- Data for Name: ipam_vlangroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vlangroup (id, name, slug, site_id, created, last_updated, description) FROM stdin;
\.


--
-- Data for Name: ipam_vrf; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vrf (id, created, last_updated, name, rd, description, enforce_unique, tenant_id, custom_field_data) FROM stdin;
1	2021-03-05	2021-03-24 16:10:25.85791+00	dmz	\N		t	\N	{}
3	2021-03-05	2021-03-24 16:11:30.253576+00	default	\N		t	\N	{}
2	2021-03-05	2021-03-24 16:11:30.28416+00	dev	\N		t	\N	{}
\.


--
-- Data for Name: ipam_vrf_export_targets; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vrf_export_targets (id, vrf_id, routetarget_id) FROM stdin;
\.


--
-- Data for Name: ipam_vrf_import_targets; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vrf_import_targets (id, vrf_id, routetarget_id) FROM stdin;
\.


--
-- Data for Name: secrets_secret; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.secrets_secret (id, created, last_updated, name, ciphertext, hash, role_id, custom_field_data, assigned_object_id, assigned_object_type_id) FROM stdin;
\.


--
-- Data for Name: secrets_secretrole; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.secrets_secretrole (id, name, slug, created, last_updated, description) FROM stdin;
\.


--
-- Data for Name: secrets_sessionkey; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.secrets_sessionkey (id, cipher, hash, created, userkey_id) FROM stdin;
\.


--
-- Data for Name: secrets_userkey; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.secrets_userkey (id, created, last_updated, public_key, master_key_cipher, user_id) FROM stdin;
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.taggit_tag (id, name, slug) FROM stdin;
\.


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
\.


--
-- Data for Name: tenancy_tenant; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.tenancy_tenant (id, created, last_updated, name, slug, description, comments, group_id, custom_field_data) FROM stdin;
\.


--
-- Data for Name: tenancy_tenantgroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.tenancy_tenantgroup (id, name, slug, created, last_updated, parent_id, level, lft, rght, tree_id, description) FROM stdin;
\.


--
-- Data for Name: users_objectpermission; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_objectpermission (id, name, description, enabled, constraints, actions) FROM stdin;
\.


--
-- Data for Name: users_objectpermission_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_objectpermission_groups (id, objectpermission_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_objectpermission_object_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_objectpermission_object_types (id, objectpermission_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: users_objectpermission_users; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_objectpermission_users (id, objectpermission_id, user_id) FROM stdin;
\.


--
-- Data for Name: users_token; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_token (id, created, expires, key, write_enabled, description, user_id) FROM stdin;
1	2021-03-01 20:54:31.042231+00	\N	0123456789abcdef0123456789abcdef01234567	t		1
\.


--
-- Data for Name: users_userconfig; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_userconfig (id, data, user_id) FROM stdin;
1	{"tables": {"VRFTable": {"columns": ["name", "rd", "tenant", "description", "tags"]}, "DeviceInterfaceTable": {"columns": ["name", "label", "enabled", "type", "lag", "mtu", "mode", "description", "cable", "connection", "tags", "ip_addresses"]}, "IPAddressDetailTable": {"columns": ["address", "vrf", "tags", "assigned_object", "assigned_object_parent"]}}}	1
\.


--
-- Data for Name: virtualization_cluster; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_cluster (id, created, last_updated, name, comments, group_id, type_id, site_id, tenant_id, custom_field_data) FROM stdin;
\.


--
-- Data for Name: virtualization_clustergroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_clustergroup (id, name, slug, created, last_updated, description) FROM stdin;
\.


--
-- Data for Name: virtualization_clustertype; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_clustertype (id, name, slug, created, last_updated, description) FROM stdin;
\.


--
-- Data for Name: virtualization_virtualmachine; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_virtualmachine (id, created, last_updated, name, vcpus, memory, disk, comments, cluster_id, platform_id, primary_ip4_id, primary_ip6_id, tenant_id, status, role_id, local_context_data, custom_field_data) FROM stdin;
\.


--
-- Data for Name: virtualization_vminterface; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_vminterface (id, name, _name, enabled, mac_address, mtu, mode, description, untagged_vlan_id, virtual_machine_id) FROM stdin;
\.


--
-- Data for Name: virtualization_vminterface_tagged_vlans; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_vminterface_tagged_vlans (id, vminterface_id, vlan_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 332, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_circuit_id_seq', 1, false);


--
-- Name: circuits_circuittermination_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_circuittermination_id_seq', 1, false);


--
-- Name: circuits_circuittype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_circuittype_id_seq', 1, false);


--
-- Name: circuits_provider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_provider_id_seq', 1, false);


--
-- Name: dcim_cable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_cable_id_seq', 2, true);


--
-- Name: dcim_cablepath_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_cablepath_id_seq', 4, true);


--
-- Name: dcim_consoleport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleport_id_seq', 1, false);


--
-- Name: dcim_consoleporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleporttemplate_id_seq', 1, false);


--
-- Name: dcim_consoleserverport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleserverport_id_seq', 1, false);


--
-- Name: dcim_consoleserverporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleserverporttemplate_id_seq', 1, false);


--
-- Name: dcim_device_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_device_id_seq', 6, true);


--
-- Name: dcim_devicebay_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicebay_id_seq', 1, false);


--
-- Name: dcim_devicebaytemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicebaytemplate_id_seq', 1, false);


--
-- Name: dcim_devicerole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicerole_id_seq', 3, true);


--
-- Name: dcim_devicetype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicetype_id_seq', 1, true);


--
-- Name: dcim_frontport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_frontport_id_seq', 1, false);


--
-- Name: dcim_frontporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_frontporttemplate_id_seq', 1, false);


--
-- Name: dcim_interface_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interface_id_seq', 316, true);


--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interface_tagged_vlans_id_seq', 1, false);


--
-- Name: dcim_interfacetemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interfacetemplate_id_seq', 98, true);


--
-- Name: dcim_manufacturer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_manufacturer_id_seq', 1, true);


--
-- Name: dcim_module_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_module_id_seq', 1, false);


--
-- Name: dcim_platform_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_platform_id_seq', 1, false);


--
-- Name: dcim_powerfeed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerfeed_id_seq', 1, false);


--
-- Name: dcim_poweroutlet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_poweroutlet_id_seq', 1, false);


--
-- Name: dcim_poweroutlettemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_poweroutlettemplate_id_seq', 1, false);


--
-- Name: dcim_powerpanel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerpanel_id_seq', 1, false);


--
-- Name: dcim_powerport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerport_id_seq', 1, false);


--
-- Name: dcim_powerporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerporttemplate_id_seq', 1, false);


--
-- Name: dcim_rack_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rack_id_seq', 1, false);


--
-- Name: dcim_rackgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rackgroup_id_seq', 1, false);


--
-- Name: dcim_rackreservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rackreservation_id_seq', 1, false);


--
-- Name: dcim_rackrole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rackrole_id_seq', 1, false);


--
-- Name: dcim_rearport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rearport_id_seq', 1, false);


--
-- Name: dcim_rearporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rearporttemplate_id_seq', 1, false);


--
-- Name: dcim_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_region_id_seq', 1, false);


--
-- Name: dcim_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_site_id_seq', 1, true);


--
-- Name: dcim_virtualchassis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_virtualchassis_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 84, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 316, true);


--
-- Name: extras_configcontext_cluster_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_cluster_groups_id_seq', 1, false);


--
-- Name: extras_configcontext_clusters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_clusters_id_seq', 1, false);


--
-- Name: extras_configcontext_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_id_seq', 1, false);


--
-- Name: extras_configcontext_platforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_platforms_id_seq', 1, false);


--
-- Name: extras_configcontext_regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_regions_id_seq', 1, false);


--
-- Name: extras_configcontext_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_roles_id_seq', 1, false);


--
-- Name: extras_configcontext_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_sites_id_seq', 1, false);


--
-- Name: extras_configcontext_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_tags_id_seq', 1, false);


--
-- Name: extras_configcontext_tenant_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_tenant_groups_id_seq', 1, false);


--
-- Name: extras_configcontext_tenants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_tenants_id_seq', 1, false);


--
-- Name: extras_customfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_customfield_id_seq', 1, true);


--
-- Name: extras_customfield_obj_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_customfield_obj_type_id_seq', 1, true);


--
-- Name: extras_customlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_customlink_id_seq', 1, false);


--
-- Name: extras_exporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_exporttemplate_id_seq', 1, false);


--
-- Name: extras_imageattachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_imageattachment_id_seq', 1, false);


--
-- Name: extras_jobresult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_jobresult_id_seq', 1, false);


--
-- Name: extras_objectchange_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_objectchange_id_seq', 659, true);


--
-- Name: extras_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_tag_id_seq', 7, true);


--
-- Name: extras_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_taggeditem_id_seq', 54, true);


--
-- Name: extras_webhook_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_webhook_id_seq', 1, false);


--
-- Name: extras_webhook_obj_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_webhook_obj_type_id_seq', 1, false);


--
-- Name: ipam_aggregate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_aggregate_id_seq', 1, false);


--
-- Name: ipam_ipaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_ipaddress_id_seq', 22, true);


--
-- Name: ipam_prefix_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_prefix_id_seq', 18, true);


--
-- Name: ipam_rir_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_rir_id_seq', 1, true);


--
-- Name: ipam_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_role_id_seq', 1, false);


--
-- Name: ipam_routetarget_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_routetarget_id_seq', 1, false);


--
-- Name: ipam_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_service_id_seq', 1, false);


--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_service_ipaddresses_id_seq', 1, false);


--
-- Name: ipam_vlan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vlan_id_seq', 1, false);


--
-- Name: ipam_vlangroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vlangroup_id_seq', 1, false);


--
-- Name: ipam_vrf_export_targets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vrf_export_targets_id_seq', 1, false);


--
-- Name: ipam_vrf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vrf_id_seq', 3, true);


--
-- Name: ipam_vrf_import_targets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vrf_import_targets_id_seq', 1, false);


--
-- Name: secrets_secret_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.secrets_secret_id_seq', 1, false);


--
-- Name: secrets_secretrole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.secrets_secretrole_id_seq', 1, false);


--
-- Name: secrets_sessionkey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.secrets_sessionkey_id_seq', 1, false);


--
-- Name: secrets_userkey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.secrets_userkey_id_seq', 1, false);


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.taggit_tag_id_seq', 1, false);


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.taggit_taggeditem_id_seq', 1, false);


--
-- Name: tenancy_tenant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.tenancy_tenant_id_seq', 1, false);


--
-- Name: tenancy_tenantgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.tenancy_tenantgroup_id_seq', 1, false);


--
-- Name: users_objectpermission_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_objectpermission_groups_id_seq', 1, false);


--
-- Name: users_objectpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_objectpermission_id_seq', 1, false);


--
-- Name: users_objectpermission_object_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_objectpermission_object_types_id_seq', 1, false);


--
-- Name: users_objectpermission_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_objectpermission_users_id_seq', 1, false);


--
-- Name: users_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_token_id_seq', 2, true);


--
-- Name: users_userconfig_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_userconfig_id_seq', 1, true);


--
-- Name: virtualization_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_cluster_id_seq', 1, false);


--
-- Name: virtualization_clustergroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_clustergroup_id_seq', 1, false);


--
-- Name: virtualization_clustertype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_clustertype_id_seq', 1, false);


--
-- Name: virtualization_virtualmachine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_virtualmachine_id_seq', 1, false);


--
-- Name: virtualization_vminterface_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_vminterface_id_seq', 1, false);


--
-- Name: virtualization_vminterface_tagged_vlans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_vminterface_tagged_vlans_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: circuits_circuit circuits_circuit_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuit circuits_circuit_provider_id_cid_b6f29862_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_provider_id_cid_b6f29862_uniq UNIQUE (provider_id, cid);


--
-- Name: circuits_circuittermination circuits_circuittermination_circuit_id_term_side_b13efd0e_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_circuit_id_term_side_b13efd0e_uniq UNIQUE (circuit_id, term_side);


--
-- Name: circuits_circuittermination circuits_circuittermination_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuittype circuits_circuittype_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_name_key UNIQUE (name);


--
-- Name: circuits_circuittype circuits_circuittype_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuittype circuits_circuittype_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_slug_key UNIQUE (slug);


--
-- Name: circuits_provider circuits_provider_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_name_key UNIQUE (name);


--
-- Name: circuits_provider circuits_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_pkey PRIMARY KEY (id);


--
-- Name: circuits_provider circuits_provider_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_slug_key UNIQUE (slug);


--
-- Name: dcim_cable dcim_cable_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_pkey PRIMARY KEY (id);


--
-- Name: dcim_cable dcim_cable_termination_a_type_id_termination_a_id_e9d24bad_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_a_type_id_termination_a_id_e9d24bad_uniq UNIQUE (termination_a_type_id, termination_a_id);


--
-- Name: dcim_cable dcim_cable_termination_b_type_id_termination_b_id_057fc21f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_b_type_id_termination_b_id_057fc21f_uniq UNIQUE (termination_b_type_id, termination_b_id);


--
-- Name: dcim_cablepath dcim_cablepath_origin_type_id_origin_id_41b6f814_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_origin_type_id_origin_id_41b6f814_uniq UNIQUE (origin_type_id, origin_id);


--
-- Name: dcim_cablepath dcim_cablepath_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleport dcim_consoleport_device_id_name_293786b6_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_device_id_name_293786b6_uniq UNIQUE (device_id, name);


--
-- Name: dcim_consoleport dcim_consoleport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemplate_device_type_id_name_8208f9ca_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemplate_device_type_id_name_8208f9ca_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleserverport dcim_consoleserverport_device_id_name_fb1c5999_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_device_id_name_fb1c5999_uniq UNIQUE (device_id, name);


--
-- Name: dcim_consoleserverport dcim_consoleserverport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverportte_device_type_id_name_a05c974d_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverportte_device_type_id_name_a05c974d_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_device dcim_device_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_device dcim_device_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_pkey PRIMARY KEY (id);


--
-- Name: dcim_device dcim_device_primary_ip4_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip4_id_key UNIQUE (primary_ip4_id);


--
-- Name: dcim_device dcim_device_primary_ip6_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip6_id_key UNIQUE (primary_ip6_id);


--
-- Name: dcim_device dcim_device_rack_id_position_face_43208a79_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_rack_id_position_face_43208a79_uniq UNIQUE (rack_id, "position", face);


--
-- Name: dcim_device dcim_device_site_id_tenant_id_name_93f4f962_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_site_id_tenant_id_name_93f4f962_uniq UNIQUE (site_id, tenant_id, name);


--
-- Name: dcim_device dcim_device_virtual_chassis_id_vc_position_efea7133_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_virtual_chassis_id_vc_position_efea7133_uniq UNIQUE (virtual_chassis_id, vc_position);


--
-- Name: dcim_devicebay dcim_devicebay_device_id_name_2475a67b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_device_id_name_2475a67b_uniq UNIQUE (device_id, name);


--
-- Name: dcim_devicebay dcim_devicebay_installed_device_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_installed_device_id_key UNIQUE (installed_device_id);


--
-- Name: dcim_devicebay dcim_devicebay_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicebaytemplate dcim_devicebaytemplate_device_type_id_name_8f4899fe_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytemplate_device_type_id_name_8f4899fe_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_devicebaytemplate dcim_devicebaytemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicerole dcim_devicerole_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_name_key UNIQUE (name);


--
-- Name: dcim_devicerole dcim_devicerole_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicerole dcim_devicerole_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_slug_key UNIQUE (slug);


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_model_17948c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_model_17948c0c_uniq UNIQUE (manufacturer_id, model);


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_slug_a0b931cb_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_slug_a0b931cb_uniq UNIQUE (manufacturer_id, slug);


--
-- Name: dcim_devicetype dcim_devicetype_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_pkey PRIMARY KEY (id);


--
-- Name: dcim_frontport dcim_frontport_device_id_name_235b7af2_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_device_id_name_235b7af2_uniq UNIQUE (device_id, name);


--
-- Name: dcim_frontport dcim_frontport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_pkey PRIMARY KEY (id);


--
-- Name: dcim_frontport dcim_frontport_rear_port_id_rear_port_position_8b0bf7ca_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_rear_port_id_rear_port_position_8b0bf7ca_uniq UNIQUE (rear_port_id, rear_port_position);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_device_type_id_name_0a0a0e05_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_device_type_id_name_0a0a0e05_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_rear_port_id_rear_port_p_401fe927_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_rear_port_id_rear_port_p_401fe927_uniq UNIQUE (rear_port_id, rear_port_position);


--
-- Name: dcim_interface dcim_interface_device_id_name_bffc4ec4_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_device_id_name_bffc4ec4_uniq UNIQUE (device_id, name);


--
-- Name: dcim_interface dcim_interface_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_pkey PRIMARY KEY (id);


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_interface_id_vlan_id_0d55c576_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_interface_id_vlan_id_0d55c576_uniq UNIQUE (interface_id, vlan_id);


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_pkey PRIMARY KEY (id);


--
-- Name: dcim_interfacetemplate dcim_interfacetemplate_device_type_id_name_3a847237_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetemplate_device_type_id_name_3a847237_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_interfacetemplate dcim_interfacetemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_inventoryitem dcim_inventoryitem_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_manufacturer dcim_manufacturer_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_name_key UNIQUE (name);


--
-- Name: dcim_manufacturer dcim_manufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_pkey PRIMARY KEY (id);


--
-- Name: dcim_manufacturer dcim_manufacturer_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_slug_key UNIQUE (slug);


--
-- Name: dcim_inventoryitem dcim_module_device_id_parent_id_name_4d8292af_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_module_device_id_parent_id_name_4d8292af_uniq UNIQUE (device_id, parent_id, name);


--
-- Name: dcim_inventoryitem dcim_module_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_module_pkey PRIMARY KEY (id);


--
-- Name: dcim_platform dcim_platform_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_name_key UNIQUE (name);


--
-- Name: dcim_platform dcim_platform_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_pkey PRIMARY KEY (id);


--
-- Name: dcim_platform dcim_platform_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_slug_key UNIQUE (slug);


--
-- Name: dcim_powerfeed dcim_powerfeed_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerfeed dcim_powerfeed_power_panel_id_name_0fbaae9f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_power_panel_id_name_0fbaae9f_uniq UNIQUE (power_panel_id, name);


--
-- Name: dcim_poweroutlet dcim_poweroutlet_device_id_name_981b00c1_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_device_id_name_981b00c1_uniq UNIQUE (device_id, name);


--
-- Name: dcim_poweroutlet dcim_poweroutlet_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_pkey PRIMARY KEY (id);


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemplate_device_type_id_name_eafbb07d_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemplate_device_type_id_name_eafbb07d_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerpanel dcim_powerpanel_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerpanel dcim_powerpanel_site_id_name_804df4c0_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_site_id_name_804df4c0_uniq UNIQUE (site_id, name);


--
-- Name: dcim_powerport dcim_powerport_device_id_name_948af82c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_device_id_name_948af82c_uniq UNIQUE (device_id, name);


--
-- Name: dcim_powerport dcim_powerport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerporttemplate dcim_powerporttemplate_device_type_id_name_b4e9689f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttemplate_device_type_id_name_b4e9689f_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_powerporttemplate dcim_powerporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_rack dcim_rack_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_rack dcim_rack_group_id_facility_id_f16a53ae_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_group_id_facility_id_f16a53ae_uniq UNIQUE (group_id, facility_id);


--
-- Name: dcim_rack dcim_rack_group_id_name_846f3826_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_group_id_name_846f3826_uniq UNIQUE (group_id, name);


--
-- Name: dcim_rack dcim_rack_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackgroup dcim_rackgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackgroup
    ADD CONSTRAINT dcim_rackgroup_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackgroup dcim_rackgroup_site_id_name_c9bd921f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackgroup
    ADD CONSTRAINT dcim_rackgroup_site_id_name_c9bd921f_uniq UNIQUE (site_id, name);


--
-- Name: dcim_rackgroup dcim_rackgroup_site_id_slug_7fbfd118_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackgroup
    ADD CONSTRAINT dcim_rackgroup_site_id_slug_7fbfd118_uniq UNIQUE (site_id, slug);


--
-- Name: dcim_rackreservation dcim_rackreservation_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackrole dcim_rackrole_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_name_key UNIQUE (name);


--
-- Name: dcim_rackrole dcim_rackrole_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackrole dcim_rackrole_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_slug_key UNIQUE (slug);


--
-- Name: dcim_rearport dcim_rearport_device_id_name_4b14dde6_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_device_id_name_4b14dde6_uniq UNIQUE (device_id, name);


--
-- Name: dcim_rearport dcim_rearport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_pkey PRIMARY KEY (id);


--
-- Name: dcim_rearporttemplate dcim_rearporttemplate_device_type_id_name_9bdddb29_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplate_device_type_id_name_9bdddb29_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_rearporttemplate dcim_rearporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_region dcim_region_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_name_key UNIQUE (name);


--
-- Name: dcim_region dcim_region_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_pkey PRIMARY KEY (id);


--
-- Name: dcim_region dcim_region_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_slug_key UNIQUE (slug);


--
-- Name: dcim_site dcim_site_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_name_key UNIQUE (name);


--
-- Name: dcim_site dcim_site_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_pkey PRIMARY KEY (id);


--
-- Name: dcim_site dcim_site_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_slug_key UNIQUE (slug);


--
-- Name: dcim_virtualchassis dcim_virtualchassis_master_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_master_id_key UNIQUE (master_id);


--
-- Name: dcim_virtualchassis dcim_virtualchassis_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: extras_configcontext_clusters extras_configcontext_clu_configcontext_id_cluster_0c7e5d20_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_clu_configcontext_id_cluster_0c7e5d20_uniq UNIQUE (configcontext_id, cluster_id);


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_clu_configcontext_id_cluster_bc530192_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_clu_configcontext_id_cluster_bc530192_uniq UNIQUE (configcontext_id, clustergroup_id);


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_cluster_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_cluster_groups_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_clusters extras_configcontext_clusters_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_clusters_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext extras_configcontext_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext
    ADD CONSTRAINT extras_configcontext_name_key UNIQUE (name);


--
-- Name: extras_configcontext extras_configcontext_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext
    ADD CONSTRAINT extras_configcontext_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_platforms extras_configcontext_pla_configcontext_id_platfor_3c67c104_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_pla_configcontext_id_platfor_3c67c104_uniq UNIQUE (configcontext_id, platform_id);


--
-- Name: extras_configcontext_platforms extras_configcontext_platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_platforms_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_regions extras_configcontext_reg_configcontext_id_region__d4a1d77f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_reg_configcontext_id_region__d4a1d77f_uniq UNIQUE (configcontext_id, region_id);


--
-- Name: extras_configcontext_regions extras_configcontext_regions_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_regions_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_roles extras_configcontext_rol_configcontext_id_devicer_4d8dbb50_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_rol_configcontext_id_devicer_4d8dbb50_uniq UNIQUE (configcontext_id, devicerole_id);


--
-- Name: extras_configcontext_roles extras_configcontext_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_roles_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_sites extras_configcontext_sit_configcontext_id_site_id_a4fe5f4f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_sit_configcontext_id_site_id_a4fe5f4f_uniq UNIQUE (configcontext_id, site_id);


--
-- Name: extras_configcontext_sites extras_configcontext_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_sites_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_tags extras_configcontext_tags_configcontext_id_tag_id_f6c53016_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_tags_configcontext_id_tag_id_f6c53016_uniq UNIQUE (configcontext_id, tag_id);


--
-- Name: extras_configcontext_tags extras_configcontext_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_tags_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_tenants extras_configcontext_ten_configcontext_id_tenant__aefb257d_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_ten_configcontext_id_tenant__aefb257d_uniq UNIQUE (configcontext_id, tenant_id);


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_ten_configcontext_id_tenantg_d6afc6f5_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_ten_configcontext_id_tenantg_d6afc6f5_uniq UNIQUE (configcontext_id, tenantgroup_id);


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_tenant_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_tenant_groups_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_tenants extras_configcontext_tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_tenants_pkey PRIMARY KEY (id);


--
-- Name: extras_customfield extras_customfield_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield
    ADD CONSTRAINT extras_customfield_name_key UNIQUE (name);


--
-- Name: extras_customfield_content_types extras_customfield_obj_t_customfield_id_contentty_77878958_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_obj_t_customfield_id_contentty_77878958_uniq UNIQUE (customfield_id, contenttype_id);


--
-- Name: extras_customfield_content_types extras_customfield_obj_type_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_obj_type_pkey PRIMARY KEY (id);


--
-- Name: extras_customfield extras_customfield_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield
    ADD CONSTRAINT extras_customfield_pkey PRIMARY KEY (id);


--
-- Name: extras_customlink extras_customlink_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink
    ADD CONSTRAINT extras_customlink_name_key UNIQUE (name);


--
-- Name: extras_customlink extras_customlink_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink
    ADD CONSTRAINT extras_customlink_pkey PRIMARY KEY (id);


--
-- Name: extras_exporttemplate extras_exporttemplate_content_type_id_name_edca9b9b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplate_content_type_id_name_edca9b9b_uniq UNIQUE (content_type_id, name);


--
-- Name: extras_exporttemplate extras_exporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplate_pkey PRIMARY KEY (id);


--
-- Name: extras_imageattachment extras_imageattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_imageattachment
    ADD CONSTRAINT extras_imageattachment_pkey PRIMARY KEY (id);


--
-- Name: extras_jobresult extras_jobresult_job_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_job_id_key UNIQUE (job_id);


--
-- Name: extras_jobresult extras_jobresult_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_pkey PRIMARY KEY (id);


--
-- Name: extras_objectchange extras_objectchange_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_pkey PRIMARY KEY (id);


--
-- Name: extras_tag extras_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_tag
    ADD CONSTRAINT extras_tag_name_key UNIQUE (name);


--
-- Name: extras_tag extras_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_tag
    ADD CONSTRAINT extras_tag_pkey PRIMARY KEY (id);


--
-- Name: extras_tag extras_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_tag
    ADD CONSTRAINT extras_tag_slug_key UNIQUE (slug);


--
-- Name: extras_taggeditem extras_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: extras_webhook extras_webhook_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook
    ADD CONSTRAINT extras_webhook_name_key UNIQUE (name);


--
-- Name: extras_webhook_content_types extras_webhook_obj_type_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_obj_type_pkey PRIMARY KEY (id);


--
-- Name: extras_webhook_content_types extras_webhook_obj_type_webhook_id_contenttype_id_99b8b9c3_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_obj_type_webhook_id_contenttype_id_99b8b9c3_uniq UNIQUE (webhook_id, contenttype_id);


--
-- Name: extras_webhook extras_webhook_payload_url_type_create__dd332134_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook
    ADD CONSTRAINT extras_webhook_payload_url_type_create__dd332134_uniq UNIQUE (payload_url, type_create, type_update, type_delete);


--
-- Name: extras_webhook extras_webhook_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook
    ADD CONSTRAINT extras_webhook_pkey PRIMARY KEY (id);


--
-- Name: ipam_aggregate ipam_aggregate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate
    ADD CONSTRAINT ipam_aggregate_pkey PRIMARY KEY (id);


--
-- Name: ipam_ipaddress ipam_ipaddress_nat_inside_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_nat_inside_id_key UNIQUE (nat_inside_id);


--
-- Name: ipam_ipaddress ipam_ipaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_pkey PRIMARY KEY (id);


--
-- Name: ipam_prefix ipam_prefix_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_pkey PRIMARY KEY (id);


--
-- Name: ipam_rir ipam_rir_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_name_key UNIQUE (name);


--
-- Name: ipam_rir ipam_rir_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_pkey PRIMARY KEY (id);


--
-- Name: ipam_rir ipam_rir_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_slug_key UNIQUE (slug);


--
-- Name: ipam_role ipam_role_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_name_key UNIQUE (name);


--
-- Name: ipam_role ipam_role_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_pkey PRIMARY KEY (id);


--
-- Name: ipam_role ipam_role_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_slug_key UNIQUE (slug);


--
-- Name: ipam_routetarget ipam_routetarget_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_routetarget
    ADD CONSTRAINT ipam_routetarget_name_key UNIQUE (name);


--
-- Name: ipam_routetarget ipam_routetarget_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_routetarget
    ADD CONSTRAINT ipam_routetarget_pkey PRIMARY KEY (id);


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_pkey PRIMARY KEY (id);


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_service_id_ipaddress_id_d019a805_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_service_id_ipaddress_id_d019a805_uniq UNIQUE (service_id, ipaddress_id);


--
-- Name: ipam_service ipam_service_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlan ipam_vlan_group_id_name_e53919df_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_name_e53919df_uniq UNIQUE (group_id, name);


--
-- Name: ipam_vlan ipam_vlan_group_id_vid_5ca4cc47_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_vid_5ca4cc47_uniq UNIQUE (group_id, vid);


--
-- Name: ipam_vlan ipam_vlan_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlangroup ipam_vlangroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlangroup ipam_vlangroup_site_id_name_a38e981b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_site_id_name_a38e981b_uniq UNIQUE (site_id, name);


--
-- Name: ipam_vlangroup ipam_vlangroup_site_id_slug_6372a304_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_site_id_slug_6372a304_uniq UNIQUE (site_id, slug);


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targets_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targets_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targets_vrf_id_routetarget_id_63ba8c62_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targets_vrf_id_routetarget_id_63ba8c62_uniq UNIQUE (vrf_id, routetarget_id);


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targets_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targets_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targets_vrf_id_routetarget_id_399b155f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targets_vrf_id_routetarget_id_399b155f_uniq UNIQUE (vrf_id, routetarget_id);


--
-- Name: ipam_vrf ipam_vrf_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrf ipam_vrf_rd_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_rd_key UNIQUE (rd);


--
-- Name: secrets_secret secrets_secret_assigned_object_type_id__c3da11b2_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secret
    ADD CONSTRAINT secrets_secret_assigned_object_type_id__c3da11b2_uniq UNIQUE (assigned_object_type_id, assigned_object_id, role_id, name);


--
-- Name: secrets_secret secrets_secret_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secret
    ADD CONSTRAINT secrets_secret_pkey PRIMARY KEY (id);


--
-- Name: secrets_secretrole secrets_secretrole_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole
    ADD CONSTRAINT secrets_secretrole_name_key UNIQUE (name);


--
-- Name: secrets_secretrole secrets_secretrole_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole
    ADD CONSTRAINT secrets_secretrole_pkey PRIMARY KEY (id);


--
-- Name: secrets_secretrole secrets_secretrole_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole
    ADD CONSTRAINT secrets_secretrole_slug_key UNIQUE (slug);


--
-- Name: secrets_sessionkey secrets_sessionkey_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_sessionkey
    ADD CONSTRAINT secrets_sessionkey_pkey PRIMARY KEY (id);


--
-- Name: secrets_sessionkey secrets_sessionkey_userkey_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_sessionkey
    ADD CONSTRAINT secrets_sessionkey_userkey_id_key UNIQUE (userkey_id);


--
-- Name: secrets_userkey secrets_userkey_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_userkey
    ADD CONSTRAINT secrets_userkey_pkey PRIMARY KEY (id);


--
-- Name: secrets_userkey secrets_userkey_user_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_userkey
    ADD CONSTRAINT secrets_userkey_user_id_key UNIQUE (user_id);


--
-- Name: taggit_tag taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq UNIQUE (content_type_id, object_id, tag_id);


--
-- Name: taggit_taggeditem taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: tenancy_tenant tenancy_tenant_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_name_key UNIQUE (name);


--
-- Name: tenancy_tenant tenancy_tenant_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_pkey PRIMARY KEY (id);


--
-- Name: tenancy_tenant tenancy_tenant_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_slug_key UNIQUE (slug);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_name_key UNIQUE (name);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_pkey PRIMARY KEY (id);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_slug_key UNIQUE (slug);


--
-- Name: users_objectpermission_groups users_objectpermission_g_objectpermission_id_grou_3b62a39c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermission_g_objectpermission_id_grou_3b62a39c_uniq UNIQUE (objectpermission_id, group_id);


--
-- Name: users_objectpermission_groups users_objectpermission_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermission_groups_pkey PRIMARY KEY (id);


--
-- Name: users_objectpermission_object_types users_objectpermission_o_objectpermission_id_cont_7c40d31a_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermission_o_objectpermission_id_cont_7c40d31a_uniq UNIQUE (objectpermission_id, contenttype_id);


--
-- Name: users_objectpermission_object_types users_objectpermission_object_types_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermission_object_types_pkey PRIMARY KEY (id);


--
-- Name: users_objectpermission users_objectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission
    ADD CONSTRAINT users_objectpermission_pkey PRIMARY KEY (id);


--
-- Name: users_objectpermission_users users_objectpermission_u_objectpermission_id_user_3a7db108_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermission_u_objectpermission_id_user_3a7db108_uniq UNIQUE (objectpermission_id, user_id);


--
-- Name: users_objectpermission_users users_objectpermission_users_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermission_users_pkey PRIMARY KEY (id);


--
-- Name: users_token users_token_key_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_key_key UNIQUE (key);


--
-- Name: users_token users_token_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_pkey PRIMARY KEY (id);


--
-- Name: users_userconfig users_userconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_userconfig
    ADD CONSTRAINT users_userconfig_pkey PRIMARY KEY (id);


--
-- Name: users_userconfig users_userconfig_user_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_userconfig
    ADD CONSTRAINT users_userconfig_user_id_key UNIQUE (user_id);


--
-- Name: virtualization_cluster virtualization_cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_name_key UNIQUE (name);


--
-- Name: virtualization_cluster virtualization_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_pkey PRIMARY KEY (id);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_name_key UNIQUE (name);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_pkey PRIMARY KEY (id);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_slug_key UNIQUE (slug);


--
-- Name: virtualization_clustertype virtualization_clustertype_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_name_key UNIQUE (name);


--
-- Name: virtualization_clustertype virtualization_clustertype_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_pkey PRIMARY KEY (id);


--
-- Name: virtualization_clustertype virtualization_clustertype_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_slug_key UNIQUE (slug);


--
-- Name: virtualization_virtualmachine virtualization_virtualma_cluster_id_tenant_id_nam_56c69afb_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualma_cluster_id_tenant_id_nam_56c69afb_uniq UNIQUE (cluster_id, tenant_id, name);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_pkey PRIMARY KEY (id);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_primary_ip4_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_primary_ip4_id_key UNIQUE (primary_ip4_id);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_primary_ip6_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_primary_ip6_id_key UNIQUE (primary_ip6_id);


--
-- Name: virtualization_vminterface virtualization_vminterfa_virtual_machine_id_name_cfb9c423_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vminterfa_virtual_machine_id_name_cfb9c423_uniq UNIQUE (virtual_machine_id, name);


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vminterfa_vminterface_id_vlan_id_27e907db_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vminterfa_vminterface_id_vlan_id_27e907db_uniq UNIQUE (vminterface_id, vlan_id);


--
-- Name: virtualization_vminterface virtualization_vminterface_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vminterface_pkey PRIMARY KEY (id);


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vminterface_tagged_vlans_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vminterface_tagged_vlans_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: circuits_circuit_provider_id_d9195418; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_provider_id_d9195418 ON public.circuits_circuit USING btree (provider_id);


--
-- Name: circuits_circuit_tenant_id_812508a5; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_tenant_id_812508a5 ON public.circuits_circuit USING btree (tenant_id);


--
-- Name: circuits_circuit_type_id_1b9f485a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_type_id_1b9f485a ON public.circuits_circuit USING btree (type_id);


--
-- Name: circuits_circuittermination__cable_peer_type_id_bd122156; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination__cable_peer_type_id_bd122156 ON public.circuits_circuittermination USING btree (_cable_peer_type_id);


--
-- Name: circuits_circuittermination__path_id_6dfd8db0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination__path_id_6dfd8db0 ON public.circuits_circuittermination USING btree (_path_id);


--
-- Name: circuits_circuittermination_cable_id_35e9f703; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination_cable_id_35e9f703 ON public.circuits_circuittermination USING btree (cable_id);


--
-- Name: circuits_circuittermination_circuit_id_257e87e7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination_circuit_id_257e87e7 ON public.circuits_circuittermination USING btree (circuit_id);


--
-- Name: circuits_circuittermination_site_id_e6fe5652; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination_site_id_e6fe5652 ON public.circuits_circuittermination USING btree (site_id);


--
-- Name: circuits_circuittype_name_8256ea9a_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittype_name_8256ea9a_like ON public.circuits_circuittype USING btree (name varchar_pattern_ops);


--
-- Name: circuits_circuittype_slug_9b4b3cf9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittype_slug_9b4b3cf9_like ON public.circuits_circuittype USING btree (slug varchar_pattern_ops);


--
-- Name: circuits_provider_name_8f2514f5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_provider_name_8f2514f5_like ON public.circuits_provider USING btree (name varchar_pattern_ops);


--
-- Name: circuits_provider_slug_c3c0aa10_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_provider_slug_c3c0aa10_like ON public.circuits_provider USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_cable__termination_a_device_id_e59cde1c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cable__termination_a_device_id_e59cde1c ON public.dcim_cable USING btree (_termination_a_device_id);


--
-- Name: dcim_cable__termination_b_device_id_a9073762; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cable__termination_b_device_id_a9073762 ON public.dcim_cable USING btree (_termination_b_device_id);


--
-- Name: dcim_cable_termination_a_type_id_a614bab8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cable_termination_a_type_id_a614bab8 ON public.dcim_cable USING btree (termination_a_type_id);


--
-- Name: dcim_cable_termination_b_type_id_a91595d0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cable_termination_b_type_id_a91595d0 ON public.dcim_cable USING btree (termination_b_type_id);


--
-- Name: dcim_cablepath_destination_type_id_a8c1654b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cablepath_destination_type_id_a8c1654b ON public.dcim_cablepath USING btree (destination_type_id);


--
-- Name: dcim_cablepath_origin_type_id_6de54f6d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cablepath_origin_type_id_6de54f6d ON public.dcim_cablepath USING btree (origin_type_id);


--
-- Name: dcim_consoleport__cable_peer_type_id_52adb1be; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport__cable_peer_type_id_52adb1be ON public.dcim_consoleport USING btree (_cable_peer_type_id);


--
-- Name: dcim_consoleport__path_id_e40a4436; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport__path_id_e40a4436 ON public.dcim_consoleport USING btree (_path_id);


--
-- Name: dcim_consoleport_cable_id_a9ae5465; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport_cable_id_a9ae5465 ON public.dcim_consoleport USING btree (cable_id);


--
-- Name: dcim_consoleport_device_id_f2d90d3c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport_device_id_f2d90d3c ON public.dcim_consoleport USING btree (device_id);


--
-- Name: dcim_consoleporttemplate_device_type_id_075d4015; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleporttemplate_device_type_id_075d4015 ON public.dcim_consoleporttemplate USING btree (device_type_id);


--
-- Name: dcim_consoleserverport__cable_peer_type_id_132b6744; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport__cable_peer_type_id_132b6744 ON public.dcim_consoleserverport USING btree (_cable_peer_type_id);


--
-- Name: dcim_consoleserverport__path_id_dc5abe09; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport__path_id_dc5abe09 ON public.dcim_consoleserverport USING btree (_path_id);


--
-- Name: dcim_consoleserverport_cable_id_f2940dfd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport_cable_id_f2940dfd ON public.dcim_consoleserverport USING btree (cable_id);


--
-- Name: dcim_consoleserverport_device_id_d9866581; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport_device_id_d9866581 ON public.dcim_consoleserverport USING btree (device_id);


--
-- Name: dcim_consoleserverporttemplate_device_type_id_579bdc86; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverporttemplate_device_type_id_579bdc86 ON public.dcim_consoleserverporttemplate USING btree (device_type_id);


--
-- Name: dcim_device_asset_tag_8dac1079_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_asset_tag_8dac1079_like ON public.dcim_device USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_device_cluster_id_cf852f78; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_cluster_id_cf852f78 ON public.dcim_device USING btree (cluster_id);


--
-- Name: dcim_device_device_role_id_682e8188; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_device_role_id_682e8188 ON public.dcim_device USING btree (device_role_id);


--
-- Name: dcim_device_device_type_id_d61b4086; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_device_type_id_d61b4086 ON public.dcim_device USING btree (device_type_id);


--
-- Name: dcim_device_platform_id_468138f1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_platform_id_468138f1 ON public.dcim_device USING btree (platform_id);


--
-- Name: dcim_device_rack_id_23bde71f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_rack_id_23bde71f ON public.dcim_device USING btree (rack_id);


--
-- Name: dcim_device_site_id_ff897cf6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_site_id_ff897cf6 ON public.dcim_device USING btree (site_id);


--
-- Name: dcim_device_tenant_id_dcea7969; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_tenant_id_dcea7969 ON public.dcim_device USING btree (tenant_id);


--
-- Name: dcim_device_virtual_chassis_id_aed51693; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_virtual_chassis_id_aed51693 ON public.dcim_device USING btree (virtual_chassis_id);


--
-- Name: dcim_devicebay_device_id_0c8a1218; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicebay_device_id_0c8a1218 ON public.dcim_devicebay USING btree (device_id);


--
-- Name: dcim_devicebaytemplate_device_type_id_f4b24a29; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicebaytemplate_device_type_id_f4b24a29 ON public.dcim_devicebaytemplate USING btree (device_type_id);


--
-- Name: dcim_devicerole_name_1c813306_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicerole_name_1c813306_like ON public.dcim_devicerole USING btree (name varchar_pattern_ops);


--
-- Name: dcim_devicerole_slug_7952643b_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicerole_slug_7952643b_like ON public.dcim_devicerole USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_devicetype_manufacturer_id_a3e8029e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicetype_manufacturer_id_a3e8029e ON public.dcim_devicetype USING btree (manufacturer_id);


--
-- Name: dcim_devicetype_slug_448745bd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicetype_slug_448745bd ON public.dcim_devicetype USING btree (slug);


--
-- Name: dcim_devicetype_slug_448745bd_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicetype_slug_448745bd_like ON public.dcim_devicetype USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_frontport__cable_peer_type_id_c4690f56; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport__cable_peer_type_id_c4690f56 ON public.dcim_frontport USING btree (_cable_peer_type_id);


--
-- Name: dcim_frontport_cable_id_04ff8aab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport_cable_id_04ff8aab ON public.dcim_frontport USING btree (cable_id);


--
-- Name: dcim_frontport_device_id_950557b5; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport_device_id_950557b5 ON public.dcim_frontport USING btree (device_id);


--
-- Name: dcim_frontport_rear_port_id_78df2532; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport_rear_port_id_78df2532 ON public.dcim_frontport USING btree (rear_port_id);


--
-- Name: dcim_frontporttemplate_device_type_id_f088b952; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontporttemplate_device_type_id_f088b952 ON public.dcim_frontporttemplate USING btree (device_type_id);


--
-- Name: dcim_frontporttemplate_rear_port_id_9775411b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontporttemplate_rear_port_id_9775411b ON public.dcim_frontporttemplate USING btree (rear_port_id);


--
-- Name: dcim_interface__cable_peer_type_id_ce52cb81; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface__cable_peer_type_id_ce52cb81 ON public.dcim_interface USING btree (_cable_peer_type_id);


--
-- Name: dcim_interface__path_id_f8f4f7f0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface__path_id_f8f4f7f0 ON public.dcim_interface USING btree (_path_id);


--
-- Name: dcim_interface_cable_id_1b264edb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_cable_id_1b264edb ON public.dcim_interface USING btree (cable_id);


--
-- Name: dcim_interface_device_id_359c6115; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_device_id_359c6115 ON public.dcim_interface USING btree (device_id);


--
-- Name: dcim_interface_lag_id_ea1a1d12; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_lag_id_ea1a1d12 ON public.dcim_interface USING btree (lag_id);


--
-- Name: dcim_interface_tagged_vlans_interface_id_5870c9e9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_tagged_vlans_interface_id_5870c9e9 ON public.dcim_interface_tagged_vlans USING btree (interface_id);


--
-- Name: dcim_interface_tagged_vlans_vlan_id_e027005c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_tagged_vlans_vlan_id_e027005c ON public.dcim_interface_tagged_vlans USING btree (vlan_id);


--
-- Name: dcim_interface_untagged_vlan_id_838dc7be; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_untagged_vlan_id_838dc7be ON public.dcim_interface USING btree (untagged_vlan_id);


--
-- Name: dcim_interfacetemplate_device_type_id_4bfcbfab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interfacetemplate_device_type_id_4bfcbfab ON public.dcim_interfacetemplate USING btree (device_type_id);


--
-- Name: dcim_inventoryitem_asset_tag_d3289273_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_asset_tag_d3289273_like ON public.dcim_inventoryitem USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_inventoryitem_tree_id_4676ade2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_tree_id_4676ade2 ON public.dcim_inventoryitem USING btree (tree_id);


--
-- Name: dcim_manufacturer_name_841fcd92_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_manufacturer_name_841fcd92_like ON public.dcim_manufacturer USING btree (name varchar_pattern_ops);


--
-- Name: dcim_manufacturer_slug_00430749_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_manufacturer_slug_00430749_like ON public.dcim_manufacturer USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_module_device_id_53cfd5be; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_module_device_id_53cfd5be ON public.dcim_inventoryitem USING btree (device_id);


--
-- Name: dcim_module_manufacturer_id_95322cbb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_module_manufacturer_id_95322cbb ON public.dcim_inventoryitem USING btree (manufacturer_id);


--
-- Name: dcim_module_parent_id_bb5d0341; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_module_parent_id_bb5d0341 ON public.dcim_inventoryitem USING btree (parent_id);


--
-- Name: dcim_platform_manufacturer_id_83f72d3d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_platform_manufacturer_id_83f72d3d ON public.dcim_platform USING btree (manufacturer_id);


--
-- Name: dcim_platform_name_c2f04255_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_platform_name_c2f04255_like ON public.dcim_platform USING btree (name varchar_pattern_ops);


--
-- Name: dcim_platform_slug_b0908ae4_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_platform_slug_b0908ae4_like ON public.dcim_platform USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_powerfeed__cable_peer_type_id_9f930589; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed__cable_peer_type_id_9f930589 ON public.dcim_powerfeed USING btree (_cable_peer_type_id);


--
-- Name: dcim_powerfeed__path_id_a1ea1f28; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed__path_id_a1ea1f28 ON public.dcim_powerfeed USING btree (_path_id);


--
-- Name: dcim_powerfeed_cable_id_ec44c4f8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed_cable_id_ec44c4f8 ON public.dcim_powerfeed USING btree (cable_id);


--
-- Name: dcim_powerfeed_power_panel_id_32bde3be; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed_power_panel_id_32bde3be ON public.dcim_powerfeed USING btree (power_panel_id);


--
-- Name: dcim_powerfeed_rack_id_7abba090; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed_rack_id_7abba090 ON public.dcim_powerfeed USING btree (rack_id);


--
-- Name: dcim_poweroutlet__cable_peer_type_id_bbff28d0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet__cable_peer_type_id_bbff28d0 ON public.dcim_poweroutlet USING btree (_cable_peer_type_id);


--
-- Name: dcim_poweroutlet__path_id_cbb47bb9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet__path_id_cbb47bb9 ON public.dcim_poweroutlet USING btree (_path_id);


--
-- Name: dcim_poweroutlet_cable_id_8dbea1ec; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet_cable_id_8dbea1ec ON public.dcim_poweroutlet USING btree (cable_id);


--
-- Name: dcim_poweroutlet_device_id_286351d7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet_device_id_286351d7 ON public.dcim_poweroutlet USING btree (device_id);


--
-- Name: dcim_poweroutlet_power_port_id_9bdf4163; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet_power_port_id_9bdf4163 ON public.dcim_poweroutlet USING btree (power_port_id);


--
-- Name: dcim_poweroutlettemplate_device_type_id_26b2316c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlettemplate_device_type_id_26b2316c ON public.dcim_poweroutlettemplate USING btree (device_type_id);


--
-- Name: dcim_poweroutlettemplate_power_port_id_c0fb0c42; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlettemplate_power_port_id_c0fb0c42 ON public.dcim_poweroutlettemplate USING btree (power_port_id);


--
-- Name: dcim_powerpanel_rack_group_id_76467cc9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerpanel_rack_group_id_76467cc9 ON public.dcim_powerpanel USING btree (rack_group_id);


--
-- Name: dcim_powerpanel_site_id_c430bc89; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerpanel_site_id_c430bc89 ON public.dcim_powerpanel USING btree (site_id);


--
-- Name: dcim_powerport__cable_peer_type_id_9df2a278; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport__cable_peer_type_id_9df2a278 ON public.dcim_powerport USING btree (_cable_peer_type_id);


--
-- Name: dcim_powerport__path_id_9fe4af8f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport__path_id_9fe4af8f ON public.dcim_powerport USING btree (_path_id);


--
-- Name: dcim_powerport_cable_id_c9682ba2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport_cable_id_c9682ba2 ON public.dcim_powerport USING btree (cable_id);


--
-- Name: dcim_powerport_device_id_ef7185ae; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport_device_id_ef7185ae ON public.dcim_powerport USING btree (device_id);


--
-- Name: dcim_powerporttemplate_device_type_id_1ddfbfcc; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerporttemplate_device_type_id_1ddfbfcc ON public.dcim_powerporttemplate USING btree (device_type_id);


--
-- Name: dcim_rack_asset_tag_f88408e5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_asset_tag_f88408e5_like ON public.dcim_rack USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_rack_group_id_44e90ea9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_group_id_44e90ea9 ON public.dcim_rack USING btree (group_id);


--
-- Name: dcim_rack_role_id_62d6919e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_role_id_62d6919e ON public.dcim_rack USING btree (role_id);


--
-- Name: dcim_rack_site_id_403c7b3a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_site_id_403c7b3a ON public.dcim_rack USING btree (site_id);


--
-- Name: dcim_rack_tenant_id_7cdf3725; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_tenant_id_7cdf3725 ON public.dcim_rack USING btree (tenant_id);


--
-- Name: dcim_rackgroup_parent_id_cc315105; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackgroup_parent_id_cc315105 ON public.dcim_rackgroup USING btree (parent_id);


--
-- Name: dcim_rackgroup_site_id_13520e89; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackgroup_site_id_13520e89 ON public.dcim_rackgroup USING btree (site_id);


--
-- Name: dcim_rackgroup_slug_3f4582a7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackgroup_slug_3f4582a7 ON public.dcim_rackgroup USING btree (slug);


--
-- Name: dcim_rackgroup_slug_3f4582a7_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackgroup_slug_3f4582a7_like ON public.dcim_rackgroup USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_rackgroup_tree_id_9c2ad6f4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackgroup_tree_id_9c2ad6f4 ON public.dcim_rackgroup USING btree (tree_id);


--
-- Name: dcim_rackreservation_rack_id_1ebbaa9b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackreservation_rack_id_1ebbaa9b ON public.dcim_rackreservation USING btree (rack_id);


--
-- Name: dcim_rackreservation_tenant_id_eb5e045f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackreservation_tenant_id_eb5e045f ON public.dcim_rackreservation USING btree (tenant_id);


--
-- Name: dcim_rackreservation_user_id_0785a527; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackreservation_user_id_0785a527 ON public.dcim_rackreservation USING btree (user_id);


--
-- Name: dcim_rackrole_name_9077cfcc_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackrole_name_9077cfcc_like ON public.dcim_rackrole USING btree (name varchar_pattern_ops);


--
-- Name: dcim_rackrole_slug_40bbcd3a_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackrole_slug_40bbcd3a_like ON public.dcim_rackrole USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_rearport__cable_peer_type_id_cecf241c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearport__cable_peer_type_id_cecf241c ON public.dcim_rearport USING btree (_cable_peer_type_id);


--
-- Name: dcim_rearport_cable_id_42c0e4e7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearport_cable_id_42c0e4e7 ON public.dcim_rearport USING btree (cable_id);


--
-- Name: dcim_rearport_device_id_0bdfe9c0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearport_device_id_0bdfe9c0 ON public.dcim_rearport USING btree (device_id);


--
-- Name: dcim_rearporttemplate_device_type_id_6a02fd01; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearporttemplate_device_type_id_6a02fd01 ON public.dcim_rearporttemplate USING btree (device_type_id);


--
-- Name: dcim_region_name_ba5a7082_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_name_ba5a7082_like ON public.dcim_region USING btree (name varchar_pattern_ops);


--
-- Name: dcim_region_parent_id_2486f5d4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_parent_id_2486f5d4 ON public.dcim_region USING btree (parent_id);


--
-- Name: dcim_region_slug_ff078a66_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_slug_ff078a66_like ON public.dcim_region USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_region_tree_id_a09ea9a7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_tree_id_a09ea9a7 ON public.dcim_region USING btree (tree_id);


--
-- Name: dcim_site_name_8fe66c76_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_name_8fe66c76_like ON public.dcim_site USING btree (name varchar_pattern_ops);


--
-- Name: dcim_site_region_id_45210932; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_region_id_45210932 ON public.dcim_site USING btree (region_id);


--
-- Name: dcim_site_slug_4412c762_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_slug_4412c762_like ON public.dcim_site USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_site_tenant_id_15e7df63; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_tenant_id_15e7df63 ON public.dcim_site USING btree (tenant_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: extras_configcontext_cluster_groups_clustergroup_id_f4322ce8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_cluster_groups_clustergroup_id_f4322ce8 ON public.extras_configcontext_cluster_groups USING btree (clustergroup_id);


--
-- Name: extras_configcontext_cluster_groups_configcontext_id_8f50b794; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_cluster_groups_configcontext_id_8f50b794 ON public.extras_configcontext_cluster_groups USING btree (configcontext_id);


--
-- Name: extras_configcontext_clusters_cluster_id_6abd47a1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_clusters_cluster_id_6abd47a1 ON public.extras_configcontext_clusters USING btree (cluster_id);


--
-- Name: extras_configcontext_clusters_configcontext_id_ed579a40; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_clusters_configcontext_id_ed579a40 ON public.extras_configcontext_clusters USING btree (configcontext_id);


--
-- Name: extras_configcontext_name_4bbfe25d_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_name_4bbfe25d_like ON public.extras_configcontext USING btree (name varchar_pattern_ops);


--
-- Name: extras_configcontext_platforms_configcontext_id_2a516699; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_platforms_configcontext_id_2a516699 ON public.extras_configcontext_platforms USING btree (configcontext_id);


--
-- Name: extras_configcontext_platforms_platform_id_3fdfedc0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_platforms_platform_id_3fdfedc0 ON public.extras_configcontext_platforms USING btree (platform_id);


--
-- Name: extras_configcontext_regions_configcontext_id_73003dbc; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_regions_configcontext_id_73003dbc ON public.extras_configcontext_regions USING btree (configcontext_id);


--
-- Name: extras_configcontext_regions_region_id_35c6ba9d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_regions_region_id_35c6ba9d ON public.extras_configcontext_regions USING btree (region_id);


--
-- Name: extras_configcontext_roles_configcontext_id_59b67386; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_roles_configcontext_id_59b67386 ON public.extras_configcontext_roles USING btree (configcontext_id);


--
-- Name: extras_configcontext_roles_devicerole_id_d3a84813; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_roles_devicerole_id_d3a84813 ON public.extras_configcontext_roles USING btree (devicerole_id);


--
-- Name: extras_configcontext_sites_configcontext_id_8c54feb9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_sites_configcontext_id_8c54feb9 ON public.extras_configcontext_sites USING btree (configcontext_id);


--
-- Name: extras_configcontext_sites_site_id_cbb76c96; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_sites_site_id_cbb76c96 ON public.extras_configcontext_sites USING btree (site_id);


--
-- Name: extras_configcontext_tags_configcontext_id_64a392b1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tags_configcontext_id_64a392b1 ON public.extras_configcontext_tags USING btree (configcontext_id);


--
-- Name: extras_configcontext_tags_tag_id_129a5d87; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tags_tag_id_129a5d87 ON public.extras_configcontext_tags USING btree (tag_id);


--
-- Name: extras_configcontext_tenant_groups_configcontext_id_92f68345; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tenant_groups_configcontext_id_92f68345 ON public.extras_configcontext_tenant_groups USING btree (configcontext_id);


--
-- Name: extras_configcontext_tenant_groups_tenantgroup_id_0909688d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tenant_groups_tenantgroup_id_0909688d ON public.extras_configcontext_tenant_groups USING btree (tenantgroup_id);


--
-- Name: extras_configcontext_tenants_configcontext_id_b53552a6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tenants_configcontext_id_b53552a6 ON public.extras_configcontext_tenants USING btree (configcontext_id);


--
-- Name: extras_configcontext_tenants_tenant_id_8d0aa28e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tenants_tenant_id_8d0aa28e ON public.extras_configcontext_tenants USING btree (tenant_id);


--
-- Name: extras_customfield_name_2fe72707_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfield_name_2fe72707_like ON public.extras_customfield USING btree (name varchar_pattern_ops);


--
-- Name: extras_customfield_obj_type_contenttype_id_6890b714; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfield_obj_type_contenttype_id_6890b714 ON public.extras_customfield_content_types USING btree (contenttype_id);


--
-- Name: extras_customfield_obj_type_customfield_id_82480f86; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfield_obj_type_customfield_id_82480f86 ON public.extras_customfield_content_types USING btree (customfield_id);


--
-- Name: extras_customlink_content_type_id_4d35b063; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customlink_content_type_id_4d35b063 ON public.extras_customlink USING btree (content_type_id);


--
-- Name: extras_customlink_name_daed2d18_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customlink_name_daed2d18_like ON public.extras_customlink USING btree (name varchar_pattern_ops);


--
-- Name: extras_exporttemplate_content_type_id_59737e21; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_exporttemplate_content_type_id_59737e21 ON public.extras_exporttemplate USING btree (content_type_id);


--
-- Name: extras_imageattachment_content_type_id_90e0643d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_imageattachment_content_type_id_90e0643d ON public.extras_imageattachment USING btree (content_type_id);


--
-- Name: extras_jobresult_obj_type_id_475e80aa; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_jobresult_obj_type_id_475e80aa ON public.extras_jobresult USING btree (obj_type_id);


--
-- Name: extras_jobresult_user_id_d35285ab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_jobresult_user_id_d35285ab ON public.extras_jobresult USING btree (user_id);


--
-- Name: extras_objectchange_changed_object_type_id_b755bb60; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_objectchange_changed_object_type_id_b755bb60 ON public.extras_objectchange USING btree (changed_object_type_id);


--
-- Name: extras_objectchange_related_object_type_id_fe6e521f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_objectchange_related_object_type_id_fe6e521f ON public.extras_objectchange USING btree (related_object_type_id);


--
-- Name: extras_objectchange_time_224380ea; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_objectchange_time_224380ea ON public.extras_objectchange USING btree ("time");


--
-- Name: extras_objectchange_user_id_7fdf8186; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_objectchange_user_id_7fdf8186 ON public.extras_objectchange USING btree (user_id);


--
-- Name: extras_tag_name_9550b3d9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_tag_name_9550b3d9_like ON public.extras_tag USING btree (name varchar_pattern_ops);


--
-- Name: extras_tag_slug_aaa5b7e9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_tag_slug_aaa5b7e9_like ON public.extras_tag USING btree (slug varchar_pattern_ops);


--
-- Name: extras_taggeditem_content_type_id_ba5562ed; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_taggeditem_content_type_id_ba5562ed ON public.extras_taggeditem USING btree (content_type_id);


--
-- Name: extras_taggeditem_content_type_id_object_id_80e28e23_idx; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_taggeditem_content_type_id_object_id_80e28e23_idx ON public.extras_taggeditem USING btree (content_type_id, object_id);


--
-- Name: extras_taggeditem_object_id_31b2aa77; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_taggeditem_object_id_31b2aa77 ON public.extras_taggeditem USING btree (object_id);


--
-- Name: extras_taggeditem_tag_id_d48af7c7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_taggeditem_tag_id_d48af7c7 ON public.extras_taggeditem USING btree (tag_id);


--
-- Name: extras_webhook_name_82cf60b5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_webhook_name_82cf60b5_like ON public.extras_webhook USING btree (name varchar_pattern_ops);


--
-- Name: extras_webhook_obj_type_contenttype_id_85c7693b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_webhook_obj_type_contenttype_id_85c7693b ON public.extras_webhook_content_types USING btree (contenttype_id);


--
-- Name: extras_webhook_obj_type_webhook_id_c7bed170; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_webhook_obj_type_webhook_id_c7bed170 ON public.extras_webhook_content_types USING btree (webhook_id);


--
-- Name: ipam_aggregate_rir_id_ef7a27bd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_aggregate_rir_id_ef7a27bd ON public.ipam_aggregate USING btree (rir_id);


--
-- Name: ipam_aggregate_tenant_id_637dd1a1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_aggregate_tenant_id_637dd1a1 ON public.ipam_aggregate USING btree (tenant_id);


--
-- Name: ipam_ipaddress_assigned_object_type_id_02354370; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_ipaddress_assigned_object_type_id_02354370 ON public.ipam_ipaddress USING btree (assigned_object_type_id);


--
-- Name: ipam_ipaddress_tenant_id_ac55acfd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_ipaddress_tenant_id_ac55acfd ON public.ipam_ipaddress USING btree (tenant_id);


--
-- Name: ipam_ipaddress_vrf_id_51fcc59b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_ipaddress_vrf_id_51fcc59b ON public.ipam_ipaddress USING btree (vrf_id);


--
-- Name: ipam_prefix_role_id_0a98d415; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_role_id_0a98d415 ON public.ipam_prefix USING btree (role_id);


--
-- Name: ipam_prefix_site_id_0b20df05; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_site_id_0b20df05 ON public.ipam_prefix USING btree (site_id);


--
-- Name: ipam_prefix_tenant_id_7ba1fcc4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_tenant_id_7ba1fcc4 ON public.ipam_prefix USING btree (tenant_id);


--
-- Name: ipam_prefix_vlan_id_1db91bff; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_vlan_id_1db91bff ON public.ipam_prefix USING btree (vlan_id);


--
-- Name: ipam_prefix_vrf_id_34f78ed0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_vrf_id_34f78ed0 ON public.ipam_prefix USING btree (vrf_id);


--
-- Name: ipam_rir_name_64a71982_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_rir_name_64a71982_like ON public.ipam_rir USING btree (name varchar_pattern_ops);


--
-- Name: ipam_rir_slug_ff1a369a_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_rir_slug_ff1a369a_like ON public.ipam_rir USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_role_name_13784849_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_role_name_13784849_like ON public.ipam_role USING btree (name varchar_pattern_ops);


--
-- Name: ipam_role_slug_309ca14c_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_role_slug_309ca14c_like ON public.ipam_role USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_routetarget_name_212be79f_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_routetarget_name_212be79f_like ON public.ipam_routetarget USING btree (name varchar_pattern_ops);


--
-- Name: ipam_routetarget_tenant_id_5a0b35e8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_routetarget_tenant_id_5a0b35e8 ON public.ipam_routetarget USING btree (tenant_id);


--
-- Name: ipam_service_device_id_b4d2bb9c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_device_id_b4d2bb9c ON public.ipam_service USING btree (device_id);


--
-- Name: ipam_service_ipaddresses_ipaddress_id_b4138c6d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_ipaddresses_ipaddress_id_b4138c6d ON public.ipam_service_ipaddresses USING btree (ipaddress_id);


--
-- Name: ipam_service_ipaddresses_service_id_ae26b9ab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_ipaddresses_service_id_ae26b9ab ON public.ipam_service_ipaddresses USING btree (service_id);


--
-- Name: ipam_service_virtual_machine_id_e8b53562; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_virtual_machine_id_e8b53562 ON public.ipam_service USING btree (virtual_machine_id);


--
-- Name: ipam_vlan_group_id_88cbfa62; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_group_id_88cbfa62 ON public.ipam_vlan USING btree (group_id);


--
-- Name: ipam_vlan_role_id_f5015962; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_role_id_f5015962 ON public.ipam_vlan USING btree (role_id);


--
-- Name: ipam_vlan_site_id_a59334e3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_site_id_a59334e3 ON public.ipam_vlan USING btree (site_id);


--
-- Name: ipam_vlan_tenant_id_71a8290d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_tenant_id_71a8290d ON public.ipam_vlan USING btree (tenant_id);


--
-- Name: ipam_vlangroup_site_id_264f36f6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlangroup_site_id_264f36f6 ON public.ipam_vlangroup USING btree (site_id);


--
-- Name: ipam_vlangroup_slug_40abcf6b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlangroup_slug_40abcf6b ON public.ipam_vlangroup USING btree (slug);


--
-- Name: ipam_vlangroup_slug_40abcf6b_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlangroup_slug_40abcf6b_like ON public.ipam_vlangroup USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_vrf_export_targets_routetarget_id_8d9319f7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_export_targets_routetarget_id_8d9319f7 ON public.ipam_vrf_export_targets USING btree (routetarget_id);


--
-- Name: ipam_vrf_export_targets_vrf_id_6f4875c4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_export_targets_vrf_id_6f4875c4 ON public.ipam_vrf_export_targets USING btree (vrf_id);


--
-- Name: ipam_vrf_import_targets_routetarget_id_0e05b144; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_import_targets_routetarget_id_0e05b144 ON public.ipam_vrf_import_targets USING btree (routetarget_id);


--
-- Name: ipam_vrf_import_targets_vrf_id_ed491b19; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_import_targets_vrf_id_ed491b19 ON public.ipam_vrf_import_targets USING btree (vrf_id);


--
-- Name: ipam_vrf_rd_0ac1bde1_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_rd_0ac1bde1_like ON public.ipam_vrf USING btree (rd varchar_pattern_ops);


--
-- Name: ipam_vrf_tenant_id_498b0051; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_tenant_id_498b0051 ON public.ipam_vrf USING btree (tenant_id);


--
-- Name: secrets_secret_assigned_object_type_id_285b92a4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX secrets_secret_assigned_object_type_id_285b92a4 ON public.secrets_secret USING btree (assigned_object_type_id);


--
-- Name: secrets_secret_role_id_39d9347f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX secrets_secret_role_id_39d9347f ON public.secrets_secret USING btree (role_id);


--
-- Name: secrets_secretrole_name_7b6ee7a4_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX secrets_secretrole_name_7b6ee7a4_like ON public.secrets_secretrole USING btree (name varchar_pattern_ops);


--
-- Name: secrets_secretrole_slug_a06c885e_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX secrets_secretrole_slug_a06c885e_like ON public.secrets_secretrole USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_tag_name_58eb2ed9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_tag_name_58eb2ed9_like ON public.taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_6be58b2c_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_tag_slug_6be58b2c_like ON public.taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_content_type_id_9957a03c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_taggeditem_content_type_id_9957a03c ON public.taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_content_type_id_object_id_196cc965_idx; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_taggeditem_content_type_id_object_id_196cc965_idx ON public.taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: taggit_taggeditem_object_id_e2d7d1df; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_taggeditem_object_id_e2d7d1df ON public.taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_tag_id_f4f5b767; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_taggeditem_tag_id_f4f5b767 ON public.taggit_taggeditem USING btree (tag_id);


--
-- Name: tenancy_tenant_group_id_7daef6f4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenant_group_id_7daef6f4 ON public.tenancy_tenant USING btree (group_id);


--
-- Name: tenancy_tenant_name_f6e5b2f5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenant_name_f6e5b2f5_like ON public.tenancy_tenant USING btree (name varchar_pattern_ops);


--
-- Name: tenancy_tenant_slug_0716575e_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenant_slug_0716575e_like ON public.tenancy_tenant USING btree (slug varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_name_53363199_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenantgroup_name_53363199_like ON public.tenancy_tenantgroup USING btree (name varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_parent_id_2542fc18; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenantgroup_parent_id_2542fc18 ON public.tenancy_tenantgroup USING btree (parent_id);


--
-- Name: tenancy_tenantgroup_slug_e2af1cb6_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenantgroup_slug_e2af1cb6_like ON public.tenancy_tenantgroup USING btree (slug varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_tree_id_769a98bf; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenantgroup_tree_id_769a98bf ON public.tenancy_tenantgroup USING btree (tree_id);


--
-- Name: users_objectpermission_groups_group_id_fb7ba6e0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_groups_group_id_fb7ba6e0 ON public.users_objectpermission_groups USING btree (group_id);


--
-- Name: users_objectpermission_groups_objectpermission_id_2f7cc117; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_groups_objectpermission_id_2f7cc117 ON public.users_objectpermission_groups USING btree (objectpermission_id);


--
-- Name: users_objectpermission_obj_objectpermission_id_38c7d8f5; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_obj_objectpermission_id_38c7d8f5 ON public.users_objectpermission_object_types USING btree (objectpermission_id);


--
-- Name: users_objectpermission_object_types_contenttype_id_594b1cc7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_object_types_contenttype_id_594b1cc7 ON public.users_objectpermission_object_types USING btree (contenttype_id);


--
-- Name: users_objectpermission_users_objectpermission_id_78a9c2e6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_users_objectpermission_id_78a9c2e6 ON public.users_objectpermission_users USING btree (objectpermission_id);


--
-- Name: users_objectpermission_users_user_id_16c0905d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_users_user_id_16c0905d ON public.users_objectpermission_users USING btree (user_id);


--
-- Name: users_token_key_820deccd_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_token_key_820deccd_like ON public.users_token USING btree (key varchar_pattern_ops);


--
-- Name: users_token_user_id_af964690; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_token_user_id_af964690 ON public.users_token USING btree (user_id);


--
-- Name: virtualization_cluster_group_id_de379828; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_group_id_de379828 ON public.virtualization_cluster USING btree (group_id);


--
-- Name: virtualization_cluster_name_1b59a61b_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_name_1b59a61b_like ON public.virtualization_cluster USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_cluster_site_id_4d5af282; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_site_id_4d5af282 ON public.virtualization_cluster USING btree (site_id);


--
-- Name: virtualization_cluster_tenant_id_bc2868d0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_tenant_id_bc2868d0 ON public.virtualization_cluster USING btree (tenant_id);


--
-- Name: virtualization_cluster_type_id_4efafb0a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_type_id_4efafb0a ON public.virtualization_cluster USING btree (type_id);


--
-- Name: virtualization_clustergroup_name_4fcd26b4_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustergroup_name_4fcd26b4_like ON public.virtualization_clustergroup USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_clustergroup_slug_57ca1d23_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustergroup_slug_57ca1d23_like ON public.virtualization_clustergroup USING btree (slug varchar_pattern_ops);


--
-- Name: virtualization_clustertype_name_ea854d3d_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustertype_name_ea854d3d_like ON public.virtualization_clustertype USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_clustertype_slug_8ee4d0e0_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustertype_slug_8ee4d0e0_like ON public.virtualization_clustertype USING btree (slug varchar_pattern_ops);


--
-- Name: virtualization_virtualmachine_cluster_id_6c9f9047; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_cluster_id_6c9f9047 ON public.virtualization_virtualmachine USING btree (cluster_id);


--
-- Name: virtualization_virtualmachine_platform_id_a6c5ccb2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_platform_id_a6c5ccb2 ON public.virtualization_virtualmachine USING btree (platform_id);


--
-- Name: virtualization_virtualmachine_role_id_0cc898f9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_role_id_0cc898f9 ON public.virtualization_virtualmachine USING btree (role_id);


--
-- Name: virtualization_virtualmachine_tenant_id_d00d1d77; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_tenant_id_d00d1d77 ON public.virtualization_virtualmachine USING btree (tenant_id);


--
-- Name: virtualization_vminterface_tagged_vlans_vlan_id_4e77411e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_tagged_vlans_vlan_id_4e77411e ON public.virtualization_vminterface_tagged_vlans USING btree (vlan_id);


--
-- Name: virtualization_vminterface_tagged_vlans_vminterface_id_904b12de; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_tagged_vlans_vminterface_id_904b12de ON public.virtualization_vminterface_tagged_vlans USING btree (vminterface_id);


--
-- Name: virtualization_vminterface_untagged_vlan_id_aea4fc69; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_untagged_vlan_id_aea4fc69 ON public.virtualization_vminterface USING btree (untagged_vlan_id);


--
-- Name: virtualization_vminterface_virtual_machine_id_e9f89829; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_virtual_machine_id_e9f89829 ON public.virtualization_vminterface USING btree (virtual_machine_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_provider_id_d9195418_fk_circuits_provider_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_provider_id_d9195418_fk_circuits_provider_id FOREIGN KEY (provider_id) REFERENCES public.circuits_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_tenant_id_812508a5_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_tenant_id_812508a5_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_type_id_1b9f485a_fk_circuits_circuittype_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_type_id_1b9f485a_fk_circuits_circuittype_id FOREIGN KEY (type_id) REFERENCES public.circuits_circuittype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm__cable_peer_type_id_bd122156_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm__cable_peer_type_id_bd122156_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm__path_id_6dfd8db0_fk_dcim_cabl; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm__path_id_6dfd8db0_fk_dcim_cabl FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm_circuit_id_257e87e7_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm_circuit_id_257e87e7_fk_circuits_ FOREIGN KEY (circuit_id) REFERENCES public.circuits_circuit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuittermination_cable_id_35e9f703_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_cable_id_35e9f703_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuittermination_site_id_e6fe5652_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_site_id_e6fe5652_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable__termination_a_device_id_e59cde1c_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable__termination_a_device_id_e59cde1c_fk_dcim_device_id FOREIGN KEY (_termination_a_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable__termination_b_device_id_a9073762_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable__termination_b_device_id_a9073762_fk_dcim_device_id FOREIGN KEY (_termination_b_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable_termination_a_type_i_a614bab8_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_a_type_i_a614bab8_fk_django_co FOREIGN KEY (termination_a_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable_termination_b_type_i_a91595d0_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_b_type_i_a91595d0_fk_django_co FOREIGN KEY (termination_b_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cablepath dcim_cablepath_destination_type_id_a8c1654b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_destination_type_id_a8c1654b_fk_django_co FOREIGN KEY (destination_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cablepath dcim_cablepath_origin_type_id_6de54f6d_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_origin_type_id_6de54f6d_fk_django_co FOREIGN KEY (origin_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport__cable_peer_type_id_52adb1be_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport__cable_peer_type_id_52adb1be_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport__path_id_e40a4436_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport__path_id_e40a4436_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport_cable_id_a9ae5465_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_cable_id_a9ae5465_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport_device_id_f2d90d3c_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_device_id_f2d90d3c_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemp_device_type_id_075d4015_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemp_device_type_id_075d4015_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverpo__cable_peer_type_id_132b6744_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverpo__cable_peer_type_id_132b6744_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverpo_device_type_id_579bdc86_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverpo_device_type_id_579bdc86_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport__path_id_dc5abe09_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport__path_id_dc5abe09_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport_cable_id_f2940dfd_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_cable_id_f2940dfd_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport_device_id_d9866581_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_device_id_d9866581_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_cluster_id_cf852f78_fk_virtualization_cluster_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_cluster_id_cf852f78_fk_virtualization_cluster_id FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_device_role_id_682e8188_fk_dcim_devicerole_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_device_role_id_682e8188_fk_dcim_devicerole_id FOREIGN KEY (device_role_id) REFERENCES public.dcim_devicerole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_device_type_id_d61b4086_fk_dcim_devicetype_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_device_type_id_d61b4086_fk_dcim_devicetype_id FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_platform_id_468138f1_fk_dcim_platform_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_platform_id_468138f1_fk_dcim_platform_id FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_primary_ip4_id_2ccd943a_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip4_id_2ccd943a_fk_ipam_ipaddress_id FOREIGN KEY (primary_ip4_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_primary_ip6_id_d180fe91_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip6_id_d180fe91_fk_ipam_ipaddress_id FOREIGN KEY (primary_ip6_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_rack_id_23bde71f_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_rack_id_23bde71f_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_site_id_ff897cf6_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_site_id_ff897cf6_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_tenant_id_dcea7969_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_tenant_id_dcea7969_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_virtual_chassis_id_aed51693_fk_dcim_virt; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_virtual_chassis_id_aed51693_fk_dcim_virt FOREIGN KEY (virtual_chassis_id) REFERENCES public.dcim_virtualchassis(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebay dcim_devicebay_device_id_0c8a1218_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_device_id_0c8a1218_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebay dcim_devicebay_installed_device_id_04618112_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_installed_device_id_04618112_fk_dcim_device_id FOREIGN KEY (installed_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebaytemplate dcim_devicebaytempla_device_type_id_f4b24a29_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytempla_device_type_id_f4b24a29_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_a3e8029e_fk_dcim_manu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_a3e8029e_fk_dcim_manu FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport__cable_peer_type_id_c4690f56_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport__cable_peer_type_id_c4690f56_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_cable_id_04ff8aab_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_cable_id_04ff8aab_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_device_id_950557b5_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_device_id_950557b5_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_rear_port_id_78df2532_fk_dcim_rearport_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_rear_port_id_78df2532_fk_dcim_rearport_id FOREIGN KEY (rear_port_id) REFERENCES public.dcim_rearport(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontporttemplate dcim_frontporttempla_device_type_id_f088b952_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttempla_device_type_id_f088b952_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontporttemplate dcim_frontporttempla_rear_port_id_9775411b_fk_dcim_rear; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttempla_rear_port_id_9775411b_fk_dcim_rear FOREIGN KEY (rear_port_id) REFERENCES public.dcim_rearporttemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface__cable_peer_type_id_ce52cb81_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface__cable_peer_type_id_ce52cb81_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface__path_id_f8f4f7f0_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface__path_id_f8f4f7f0_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_cable_id_1b264edb_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_cable_id_1b264edb_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_device_id_359c6115_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_device_id_359c6115_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_lag_id_ea1a1d12_fk_dcim_interface_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_lag_id_ea1a1d12_fk_dcim_interface_id FOREIGN KEY (lag_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagge_interface_id_5870c9e9_fk_dcim_inte; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagge_interface_id_5870c9e9_fk_dcim_inte FOREIGN KEY (interface_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_vlan_id_e027005c_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_vlan_id_e027005c_fk_ipam_vlan_id FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_untagged_vlan_id_838dc7be_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_untagged_vlan_id_838dc7be_fk_ipam_vlan_id FOREIGN KEY (untagged_vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interfacetemplate dcim_interfacetempla_device_type_id_4bfcbfab_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetempla_device_type_id_4bfcbfab_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_device_id_033d83f8_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_device_id_033d83f8_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_manufacturer_id_dcd1b78a_fk_dcim_manu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_manufacturer_id_dcd1b78a_fk_dcim_manu FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_parent_id_7ebcd457_fk_dcim_inventoryitem_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_parent_id_7ebcd457_fk_dcim_inventoryitem_id FOREIGN KEY (parent_id) REFERENCES public.dcim_inventoryitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_platform dcim_platform_manufacturer_id_83f72d3d_fk_dcim_manufacturer_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_manufacturer_id_83f72d3d_fk_dcim_manufacturer_id FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed__cable_peer_type_id_9f930589_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed__cable_peer_type_id_9f930589_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed__path_id_a1ea1f28_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed__path_id_a1ea1f28_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_cable_id_ec44c4f8_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_cable_id_ec44c4f8_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_power_panel_id_32bde3be_fk_dcim_powerpanel_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_power_panel_id_32bde3be_fk_dcim_powerpanel_id FOREIGN KEY (power_panel_id) REFERENCES public.dcim_powerpanel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_rack_id_7abba090_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_rack_id_7abba090_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet__cable_peer_type_id_bbff28d0_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet__cable_peer_type_id_bbff28d0_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet__path_id_cbb47bb9_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet__path_id_cbb47bb9_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_cable_id_8dbea1ec_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_cable_id_8dbea1ec_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_device_id_286351d7_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_device_id_286351d7_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_power_port_id_9bdf4163_fk_dcim_powerport_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_power_port_id_9bdf4163_fk_dcim_powerport_id FOREIGN KEY (power_port_id) REFERENCES public.dcim_powerport(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemp_device_type_id_26b2316c_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemp_device_type_id_26b2316c_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemp_power_port_id_c0fb0c42_fk_dcim_powe; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemp_power_port_id_c0fb0c42_fk_dcim_powe FOREIGN KEY (power_port_id) REFERENCES public.dcim_powerporttemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerpanel dcim_powerpanel_rack_group_id_76467cc9_fk_dcim_rackgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_rack_group_id_76467cc9_fk_dcim_rackgroup_id FOREIGN KEY (rack_group_id) REFERENCES public.dcim_rackgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerpanel dcim_powerpanel_site_id_c430bc89_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_site_id_c430bc89_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport__cable_peer_type_id_9df2a278_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport__cable_peer_type_id_9df2a278_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport__path_id_9fe4af8f_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport__path_id_9fe4af8f_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport_cable_id_c9682ba2_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_cable_id_c9682ba2_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport_device_id_ef7185ae_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_device_id_ef7185ae_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerporttemplate dcim_powerporttempla_device_type_id_1ddfbfcc_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttempla_device_type_id_1ddfbfcc_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_group_id_44e90ea9_fk_dcim_rackgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_group_id_44e90ea9_fk_dcim_rackgroup_id FOREIGN KEY (group_id) REFERENCES public.dcim_rackgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_role_id_62d6919e_fk_dcim_rackrole_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_role_id_62d6919e_fk_dcim_rackrole_id FOREIGN KEY (role_id) REFERENCES public.dcim_rackrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_site_id_403c7b3a_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_site_id_403c7b3a_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_tenant_id_7cdf3725_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_tenant_id_7cdf3725_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackgroup dcim_rackgroup_parent_id_cc315105_fk_dcim_rackgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackgroup
    ADD CONSTRAINT dcim_rackgroup_parent_id_cc315105_fk_dcim_rackgroup_id FOREIGN KEY (parent_id) REFERENCES public.dcim_rackgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackgroup dcim_rackgroup_site_id_13520e89_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackgroup
    ADD CONSTRAINT dcim_rackgroup_site_id_13520e89_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_rack_id_1ebbaa9b_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_rack_id_1ebbaa9b_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_tenant_id_eb5e045f_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_tenant_id_eb5e045f_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_user_id_0785a527_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_user_id_0785a527_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearport dcim_rearport__cable_peer_type_id_cecf241c_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport__cable_peer_type_id_cecf241c_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearport dcim_rearport_cable_id_42c0e4e7_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_cable_id_42c0e4e7_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearport dcim_rearport_device_id_0bdfe9c0_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_device_id_0bdfe9c0_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearporttemplate dcim_rearporttemplat_device_type_id_6a02fd01_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplat_device_type_id_6a02fd01_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_region dcim_region_parent_id_2486f5d4_fk_dcim_region_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_parent_id_2486f5d4_fk_dcim_region_id FOREIGN KEY (parent_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site dcim_site_region_id_45210932_fk_dcim_region_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_region_id_45210932_fk_dcim_region_id FOREIGN KEY (region_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site dcim_site_tenant_id_15e7df63_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_tenant_id_15e7df63_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_virtualchassis dcim_virtualchassis_master_id_ab54cfc6_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_master_id_ab54cfc6_fk_dcim_device_id FOREIGN KEY (master_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_clusters extras_configcontext_cluster_id_6abd47a1_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_cluster_id_6abd47a1_fk_virtualiz FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_clustergroup_id_f4322ce8_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_clustergroup_id_f4322ce8_fk_virtualiz FOREIGN KEY (clustergroup_id) REFERENCES public.virtualization_clustergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_platforms extras_configcontext_configcontext_id_2a516699_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_configcontext_id_2a516699_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_roles extras_configcontext_configcontext_id_59b67386_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_configcontext_id_59b67386_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tags extras_configcontext_configcontext_id_64a392b1_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_configcontext_id_64a392b1_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_regions extras_configcontext_configcontext_id_73003dbc_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_configcontext_id_73003dbc_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_sites extras_configcontext_configcontext_id_8c54feb9_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_configcontext_id_8c54feb9_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_configcontext_id_8f50b794_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_configcontext_id_8f50b794_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_configcontext_id_92f68345_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_configcontext_id_92f68345_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenants extras_configcontext_configcontext_id_b53552a6_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_configcontext_id_b53552a6_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_clusters extras_configcontext_configcontext_id_ed579a40_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_configcontext_id_ed579a40_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_roles extras_configcontext_devicerole_id_d3a84813_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_devicerole_id_d3a84813_fk_dcim_devi FOREIGN KEY (devicerole_id) REFERENCES public.dcim_devicerole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_platforms extras_configcontext_platform_id_3fdfedc0_fk_dcim_plat; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_platform_id_3fdfedc0_fk_dcim_plat FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_regions extras_configcontext_region_id_35c6ba9d_fk_dcim_regi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_region_id_35c6ba9d_fk_dcim_regi FOREIGN KEY (region_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_sites extras_configcontext_sites_site_id_cbb76c96_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_sites_site_id_cbb76c96_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tags extras_configcontext_tags_tag_id_129a5d87_fk_extras_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_tags_tag_id_129a5d87_fk_extras_tag_id FOREIGN KEY (tag_id) REFERENCES public.extras_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenants extras_configcontext_tenant_id_8d0aa28e_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_tenant_id_8d0aa28e_fk_tenancy_t FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_tenantgroup_id_0909688d_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_tenantgroup_id_0909688d_fk_tenancy_t FOREIGN KEY (tenantgroup_id) REFERENCES public.tenancy_tenantgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfield_content_types extras_customfield_c_contenttype_id_2997ba90_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_c_contenttype_id_2997ba90_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfield_content_types extras_customfield_c_customfield_id_3842aaf3_fk_extras_cu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_c_customfield_id_3842aaf3_fk_extras_cu FOREIGN KEY (customfield_id) REFERENCES public.extras_customfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customlink extras_customlink_content_type_id_4d35b063_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink
    ADD CONSTRAINT extras_customlink_content_type_id_4d35b063_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_exporttemplate extras_exporttemplat_content_type_id_59737e21_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplat_content_type_id_59737e21_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_imageattachment extras_imageattachme_content_type_id_90e0643d_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_imageattachment
    ADD CONSTRAINT extras_imageattachme_content_type_id_90e0643d_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_jobresult extras_jobresult_obj_type_id_475e80aa_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_obj_type_id_475e80aa_fk_django_content_type_id FOREIGN KEY (obj_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_jobresult extras_jobresult_user_id_d35285ab_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_user_id_d35285ab_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_objectchange extras_objectchange_changed_object_type__b755bb60_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_changed_object_type__b755bb60_fk_django_co FOREIGN KEY (changed_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_objectchange extras_objectchange_related_object_type__fe6e521f_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_related_object_type__fe6e521f_fk_django_co FOREIGN KEY (related_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_objectchange extras_objectchange_user_id_7fdf8186_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_user_id_7fdf8186_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_taggeditem extras_taggeditem_content_type_id_ba5562ed_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_content_type_id_ba5562ed_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_taggeditem extras_taggeditem_tag_id_d48af7c7_fk_extras_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_tag_id_d48af7c7_fk_extras_tag_id FOREIGN KEY (tag_id) REFERENCES public.extras_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_webhook_content_types extras_webhook_conte_contenttype_id_3fc2c4d3_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_conte_contenttype_id_3fc2c4d3_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_webhook_content_types extras_webhook_conte_webhook_id_0c169800_fk_extras_we; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_conte_webhook_id_0c169800_fk_extras_we FOREIGN KEY (webhook_id) REFERENCES public.extras_webhook(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_aggregate ipam_aggregate_rir_id_ef7a27bd_fk_ipam_rir_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate
    ADD CONSTRAINT ipam_aggregate_rir_id_ef7a27bd_fk_ipam_rir_id FOREIGN KEY (rir_id) REFERENCES public.ipam_rir(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_aggregate ipam_aggregate_tenant_id_637dd1a1_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate
    ADD CONSTRAINT ipam_aggregate_tenant_id_637dd1a1_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_assigned_object_type_02354370_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_assigned_object_type_02354370_fk_django_co FOREIGN KEY (assigned_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_nat_inside_id_a45fb7c5_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_nat_inside_id_a45fb7c5_fk_ipam_ipaddress_id FOREIGN KEY (nat_inside_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_tenant_id_ac55acfd_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_tenant_id_ac55acfd_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_vrf_id_51fcc59b_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_vrf_id_51fcc59b_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_role_id_0a98d415_fk_ipam_role_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_role_id_0a98d415_fk_ipam_role_id FOREIGN KEY (role_id) REFERENCES public.ipam_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_site_id_0b20df05_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_site_id_0b20df05_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_tenant_id_7ba1fcc4_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_tenant_id_7ba1fcc4_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_vlan_id_1db91bff_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_vlan_id_1db91bff_fk_ipam_vlan_id FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_vrf_id_34f78ed0_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_vrf_id_34f78ed0_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_routetarget ipam_routetarget_tenant_id_5a0b35e8_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_routetarget
    ADD CONSTRAINT ipam_routetarget_tenant_id_5a0b35e8_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service ipam_service_device_id_b4d2bb9c_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_device_id_b4d2bb9c_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddre_ipaddress_id_b4138c6d_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddre_ipaddress_id_b4138c6d_fk_ipam_ipad FOREIGN KEY (ipaddress_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_service_id_ae26b9ab_fk_ipam_service_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_service_id_ae26b9ab_fk_ipam_service_id FOREIGN KEY (service_id) REFERENCES public.ipam_service(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service ipam_service_virtual_machine_id_e8b53562_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_virtual_machine_id_e8b53562_fk_virtualiz FOREIGN KEY (virtual_machine_id) REFERENCES public.virtualization_virtualmachine(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_group_id_88cbfa62_fk_ipam_vlangroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_88cbfa62_fk_ipam_vlangroup_id FOREIGN KEY (group_id) REFERENCES public.ipam_vlangroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_role_id_f5015962_fk_ipam_role_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_role_id_f5015962_fk_ipam_role_id FOREIGN KEY (role_id) REFERENCES public.ipam_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_site_id_a59334e3_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_site_id_a59334e3_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_tenant_id_71a8290d_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_tenant_id_71a8290d_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlangroup ipam_vlangroup_site_id_264f36f6_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_site_id_264f36f6_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targ_routetarget_id_8d9319f7_fk_ipam_rout; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targ_routetarget_id_8d9319f7_fk_ipam_rout FOREIGN KEY (routetarget_id) REFERENCES public.ipam_routetarget(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targets_vrf_id_6f4875c4_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targets_vrf_id_6f4875c4_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targ_routetarget_id_0e05b144_fk_ipam_rout; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targ_routetarget_id_0e05b144_fk_ipam_rout FOREIGN KEY (routetarget_id) REFERENCES public.ipam_routetarget(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targets_vrf_id_ed491b19_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targets_vrf_id_ed491b19_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf ipam_vrf_tenant_id_498b0051_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_tenant_id_498b0051_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: secrets_secret secrets_secret_assigned_object_type_285b92a4_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secret
    ADD CONSTRAINT secrets_secret_assigned_object_type_285b92a4_fk_django_co FOREIGN KEY (assigned_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: secrets_secret secrets_secret_role_id_39d9347f_fk_secrets_secretrole_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secret
    ADD CONSTRAINT secrets_secret_role_id_39d9347f_fk_secrets_secretrole_id FOREIGN KEY (role_id) REFERENCES public.secrets_secretrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: secrets_sessionkey secrets_sessionkey_userkey_id_3ca6176b_fk_secrets_userkey_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_sessionkey
    ADD CONSTRAINT secrets_sessionkey_userkey_id_3ca6176b_fk_secrets_userkey_id FOREIGN KEY (userkey_id) REFERENCES public.secrets_userkey(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: secrets_userkey secrets_userkey_user_id_13ada46b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_userkey
    ADD CONSTRAINT secrets_userkey_user_id_13ada46b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_9957a03c_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_9957a03c_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_tenant tenancy_tenant_group_id_7daef6f4_fk_tenancy_tenantgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_group_id_7daef6f4_fk_tenancy_tenantgroup_id FOREIGN KEY (group_id) REFERENCES public.tenancy_tenantgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_parent_id_2542fc18_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_parent_id_2542fc18_fk_tenancy_t FOREIGN KEY (parent_id) REFERENCES public.tenancy_tenantgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_object_types users_objectpermissi_contenttype_id_594b1cc7_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermissi_contenttype_id_594b1cc7_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_groups users_objectpermissi_group_id_fb7ba6e0_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermissi_group_id_fb7ba6e0_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_groups users_objectpermissi_objectpermission_id_2f7cc117_fk_users_obj; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermissi_objectpermission_id_2f7cc117_fk_users_obj FOREIGN KEY (objectpermission_id) REFERENCES public.users_objectpermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_object_types users_objectpermissi_objectpermission_id_38c7d8f5_fk_users_obj; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermissi_objectpermission_id_38c7d8f5_fk_users_obj FOREIGN KEY (objectpermission_id) REFERENCES public.users_objectpermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_users users_objectpermissi_objectpermission_id_78a9c2e6_fk_users_obj; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermissi_objectpermission_id_78a9c2e6_fk_users_obj FOREIGN KEY (objectpermission_id) REFERENCES public.users_objectpermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_users users_objectpermission_users_user_id_16c0905d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermission_users_user_id_16c0905d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_token users_token_user_id_af964690_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_user_id_af964690_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_userconfig users_userconfig_user_id_afd44184_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_userconfig
    ADD CONSTRAINT users_userconfig_user_id_afd44184_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_clust_group_id_de379828_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_clust_group_id_de379828_fk_virtualiz FOREIGN KEY (group_id) REFERENCES public.virtualization_clustergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_clust_type_id_4efafb0a_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_clust_type_id_4efafb0a_fk_virtualiz FOREIGN KEY (type_id) REFERENCES public.virtualization_clustertype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_cluster_site_id_4d5af282_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_site_id_4d5af282_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_cluster_tenant_id_bc2868d0_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_tenant_id_bc2868d0_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_cluster_id_6c9f9047_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_cluster_id_6c9f9047_fk_virtualiz FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_platform_id_a6c5ccb2_fk_dcim_plat; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_platform_id_a6c5ccb2_fk_dcim_plat FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_primary_ip4_id_942e42ae_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_primary_ip4_id_942e42ae_fk_ipam_ipad FOREIGN KEY (primary_ip4_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_primary_ip6_id_b7904e73_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_primary_ip6_id_b7904e73_fk_ipam_ipad FOREIGN KEY (primary_ip6_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_role_id_0cc898f9_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_role_id_0cc898f9_fk_dcim_devi FOREIGN KEY (role_id) REFERENCES public.dcim_devicerole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_tenant_id_d00d1d77_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_tenant_id_d00d1d77_fk_tenancy_t FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vmint_untagged_vlan_id_aea4fc69_fk_ipam_vlan; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vmint_untagged_vlan_id_aea4fc69_fk_ipam_vlan FOREIGN KEY (untagged_vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vmint_virtual_machine_id_e9f89829_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vmint_virtual_machine_id_e9f89829_fk_virtualiz FOREIGN KEY (virtual_machine_id) REFERENCES public.virtualization_virtualmachine(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vmint_vlan_id_4e77411e_fk_ipam_vlan; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vmint_vlan_id_4e77411e_fk_ipam_vlan FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vmint_vminterface_id_904b12de_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vmint_vminterface_id_904b12de_fk_virtualiz FOREIGN KEY (vminterface_id) REFERENCES public.virtualization_vminterface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

