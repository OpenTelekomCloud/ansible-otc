otc_subnet
==========

OTC role for Subnet.

Variables:
^^^^^^^^^^

+-------------------------+---------------------------------------------+
| Name                    | Description                                 |
+=========================+=============================================+
| subnet_name             | name of Subnet                              |
+-------------------------+---------------------------------------------+
| subnet_id               | id of Subnet                                |
+-------------------------+---------------------------------------------+

Functions:
^^^^^^^^^^

Create::

    ansible-playbook tenant_yml.yml -e "ecs_name=ansible-test01" -e "localaction=create"

    ansible-playbook tenant_ini.yml -e "ecs_name=ansible-test01" -e "localaction=create"

    ansible-playbook tenant_json.yml -e "ecs_name=ansible-test01" -e "localaction=create"

note: subnet will create during ECS creating workflow

Show::

    ./grole otc_subnet; ansible-playbook roles.yml -e "subnet_name=ansible-subnet01" -e "localaction=show"

List::

    ./grole otc_subnet; ansible-playbook roles.yml -e "localaction=list"

Delete::

    ./grole otc_subnet; ansible-playbook roles.yml -e "subnet_name=ansible-subnet01" -e "localaction=delete"
