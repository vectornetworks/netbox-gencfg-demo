#!/usr/bin/env bash

docker exec -it netboxdocker_postgres_1 pg_dump -d netbox -U netbox > /vagrant/netbox/netbox_data.sql