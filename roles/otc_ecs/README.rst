otc_ecs
=======

OTC role for ECS.

Variables:
^^^^^^^^^^

+---------------------------+---------------------------------------------------------------+
| Name                      | Description                                                   |
+===========================+===============================================================+
| localaction=flavors       | show flavors                                                  |
+---------------------------+---------------------------------------------------------------+
| ecs_name                  | name of ECS                                                   |
+---------------------------+---------------------------------------------------------------+
| ecs_id                    | id of ECS                                                     |
+---------------------------+---------------------------------------------------------------+
| ecs_volumetype            | Volume type of ECS (SATA,SSD,SAS)                             |
+---------------------------+---------------------------------------------------------------+
| ecs_volumesize            | Size of ECS volume in GB (or image default)                   |
+---------------------------+---------------------------------------------------------------+
| ecs_ram                   | RAM size of ECS                                               |
+---------------------------+---------------------------------------------------------------+
| ecs_vcpus                 | CPU core of ECS                                               |
+---------------------------+---------------------------------------------------------------+
| ecs_ipaddress             | IP address of ECS                                             |
+---------------------------+---------------------------------------------------------------+
| ecs_fileinject_[1-5]      | Personal data (file injection)                                |
|                           | up to 5 files                                                 |
|                           | example: ansible-playbook -e "ecs_fileinject_1=/etc/hosts \   |
|                           | ecs_fileinject_data_1=$(base64 -w 0 hosts.txt)"               |
+---------------------------+---------------------------------------------------------------+
| ecs_fileinject_data_[1-5] |  Personal data (file injection)                               |
+---------------------------+---------------------------------------------------------------+
| ecs_user_data             | cloud-init user data file                                     |
|                           | example [...] -e "ecs_user_data=$(base64 -w 0 user-data.txt)" |
+---------------------------+---------------------------------------------------------------+
| ecs_adminpass             | Admin password ECS                                            |
+---------------------------+---------------------------------------------------------------+
| ecs_adminkey              | SSH key name of ECS                                           |
+---------------------------+---------------------------------------------------------------+

Functions:
^^^^^^^^^^

Create::

    ansible-playbook tenant_yml.yml -e "ecs_name=ansible-test01" -e "localaction=create"

    ansible-playbook tenant_ini.yml -e "ecs_name=ansible-test01" -e "localaction=create"

    ansible-playbook tenant_json.yml -e "ecs_name=ansible-test01" -e "localaction=create"

Show::

    ./grole otc_ecs; ansible-playbook roles.yml -e "ecs_name=ansible-test01" -e "localaction=show"

List::

    ./grole otc_ecs; ansible-playbook roles.yml -e "localaction=list"

Delete::

    ./grole otc_ecs; ansible-playbook roles.yml -e "ecs_name=ansible-test01" -e "localaction=delete"
