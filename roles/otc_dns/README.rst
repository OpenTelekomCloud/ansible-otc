otc_dns
=======

OTC role for DNS. This role creates zones, zone records and reverse
entries (PTR records).
With as transfer option it's possible to fetch zone information from
existing DNS and write an OTC DNS config file in ini, yml, or json
format. This action required xfer rights on the source DNS server.

Variables:
^^^^^^^^^^

+-------------------------+---------------------------------------------+
| Name                    | Description                                 |
+=========================+=============================================+
| zone_name               | name of DNS zone                            |
+-------------------------+---------------------------------------------+
| zone_id                 | id of DNS zone                              |
+-------------------------+---------------------------------------------+
| zone_description        | Description of DNS zone                     |
+-------------------------+---------------------------------------------+
| zone_type               | DNS zone type (public/private)              |
+-------------------------+---------------------------------------------+
| zone_email              | Email address of SOA                        |
+-------------------------+---------------------------------------------+
| zone_ttl                | DNS zone TTL in sec                         |
+-------------------------+---------------------------------------------+
| zone_records            | List of zone records                        |
+-------------------------+---------------------------------------------+
| ptr_name                | FQDN for PTR record                         |
+-------------------------+---------------------------------------------+
| config                  | Format for Zonetransfer (ini,yml,json)      |
+-------------------------+---------------------------------------------+


Functions:
^^^^^^^^^^

create (public)::

    ansible-playbook dns_yml.yml -e "zone_name=ansible.otc.telekomcloud99.com" -e "localaction=create"

    ansible-playbook dns_ini.yml -e "zone_name=ansible.otc.telekomcloud99.com" -e "localaction=create"

    ansible-playbook dns_json.yml -e "zone_name=ansible.otc.telekomcloud99.com" -e "localaction=create"

create (internal)::

    ansible-playbook dns_yml.yml -e "zone_name=ansible.internal.corp" -e "vpc_name=ansible-vpc01" -e "localaction=create"

    ansible-playbook dns_ini.yml -e "zone_name=ansible.internal.corp" -e "vpc_name=ansible-vpc01" -e "localaction=create"

    ansible-playbook dns_json.yml -e "zone_name=ansible.internal.corp" -e "vpc_name=ansible-vpc01" -e "localaction=create"


ptrcreate::

    ansible-playbook tenant_yml.yml -e "zone_name=ansible.otc.telekomcloud99.com" -e "ecs_name=ansible-test01" -e "localaction=ptrcreate"

ptrdelete::

    ansible-playbook tenant_yml.yml -e "zone_name=ansible.otc.telekomcloud99.com" -e "ecs_name=ansible-test01" -e "localaction=ptrdelete"


show::

    ./grole otc_dns; ansible-playbook roles.yml -e "zone_name=ansible.otc.telekomcloud99.com" -e "localaction=show"

    ./grole otc_vpc otc_dns; ansible-playbook roles.yml -e "zone_name=ansible.otc.telekomcloud99.com" -e "vpc_name=ansible-vpc01" -e "localaction=show"


list::

    ./grole otc_dns; ansible-playbook roles.yml -e "zone_name=ansible.otc.telekomcloud99.com" -e "localaction=list"

    ./grole otc_vpc otc_dns; ansible-playbook roles.yml -e "zone_name=ansible.internal.corp" -e "vpc_name=ansible-vpc01" -e "localaction=list"


delete::

    ./grole otc_dns; ansible-playbook roles.yml ansible-playbook tenant_yml.yml -e "zone_name=ansible.otc.telekomcloud99.com" -e "localaction=delete"

    ./grole otc_vpc otc_dns; ansible-playbook roles.yml  -e "zone_name=ansible.internal.corp" -e "vpc_name=ansible-vpc01" -e "localaction=delete"

transfer::

    ansible-playbook dns_ini.yml -e "config=ini" -e "localaction=transfer" -e "dns_server=192.168.0.1" -e "zone_name=example.com" -e "zone_type=public" -e "zone_email=nobody@localhost" -e "zone_ttl=86400"

    ansible-playbook dns_yml.yml -e "config=yml" -e "localaction=transfer" -e "dns_server=192.168.0.1" -e "zone_name=example.com" -e "zone_type=public" -e "zone_email=nobody@localhost" -e "zone_ttl=86400"

    ansible-playbook dns_json.yml -e "config=json" -e "localaction=transfer" -e "dns_server=192.168.0.1" -e "zone_name=example.com" -e "zone_type=public" -e "zone_email=nobody@localhost" -e "zone_ttl=86400"
