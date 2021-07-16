Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"
    config.vm.network "private_network", type: "dhcp"
  
    config.vm.provider "virtualbox" do |v|
      v.memory = 4096
    end

    config.vm.provision "shell", name: "Installing Docker, Pip, Netbox, Ansible, docker-topo, and gen-cfg", privileged: true, inline: <<-SHELLROOT
        # Install Docker and pip
        apt-get update
        apt-get -y install docker.io
        apt-get -y install docker-compose
        apt-get -y install python3-pip

        # Add vagrant to docker group
        usermod -aG docker vagrant

        # Install Ansible
        add-apt-repository ppa:ansible/ansible-2.9
        apt-get update
        apt-get -y install ansible

        # Install docker-topo
        python3 -m pip install git+https://github.com/networkop/docker-topo.git

        # Upgrade requests and install gen-cfg 
        pip3 install --upgrade requests
        pip3 install /vagrant/gencfg

        mkdir /tmp/git && cd /tmp/git

        # Install netbox-docker and modify it so Postgres will import demo data
        git clone -b release https://github.com/netbox-community/netbox-docker.git && cd netbox-docker
        cp /vagrant/netbox/docker-compose.override.yml .
        mkdir postgres
        cp /vagrant/netbox/Dockerfile-netbox-postgres postgres/Dockerfile
        cp /vagrant/netbox/netbox_data.sql postgres 
        sed -i -f /vagrant/netbox/patch_netbox_docker_postgres.sed docker-compose.yml
        docker-compose pull
        docker-compose up -d

        # Add cEOS to docker repo
        test -f /vagrant/cEOS-lab.tar && docker import /vagrant/cEOS-lab.tar ceos:latest
    SHELLROOT

    config.vm.provision "shell", name: "Building demo environment", privileged: false, inline: <<-SHELLVAGRANT
        # Change to the home directory
        cd ~

        # Copy over the docker-topo directory
        cp -r /vagrant/docker-topo .

        # Make a demo directory and copy in Ansible stuff and templates
        mkdir demo
        cp -r /vagrant/ansible/* demo
        cp -r /vagrant/templates/ demo
    SHELLVAGRANT

  end