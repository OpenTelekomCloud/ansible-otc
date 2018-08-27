otc_vpc
=======

OTC role for VPC.

Variables:
^^^^^^^^^^

+-------------------------+---------------------------------------------+
| Name                    | Description                                 |
+=========================+=============================================+
| localaction=router      | Information about VPC Router as fact        |
+-------------------------+---------------------------------------------+
| localaction=snat        | Configure SNAT on VPC                       |
+-------------------------+---------------------------------------------+
| enable_snat=true|false  | Enable or disable SNAT                      |
+-------------------------+---------------------------------------------+
| vpc_name                | name of VPC                                 |
+-------------------------+---------------------------------------------+
| vpc_id                  | id of VPC                                   |
+-------------------------+---------------------------------------------+

Functions:
^^^^^^^^^^

Create::

    ansible-playbook tenant_yml.yml -e "ecs_name=ansible-test01" -e "localaction=create"

    ansible-playbook tenant_ini.yml -e "ecs_name=ansible-test01" -e "localaction=create"

    ansible-playbook tenant_json.yml -e "ecs_name=ansible-test01" -e "localaction=create"

note: VPC will create during ECS creating workflow

Show::

    ./grole otc_vpc; ansible-playbook roles.yml -e "vpc_name=ansible-vpc01" -e "localaction=show"

List::

    ./grole otc_vpc; ansible-playbook roles.yml -e "localaction=list"

Delete::

    ./grole otc_vpc; ansible-playbook roles.yml -e "vpc_name=ansible-vpc01" -e "localaction=delete"
