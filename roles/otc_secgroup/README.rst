otc_secgroup
============

OTC role for security groups. This role creates security groups defined
for an ECS and creates the rules. The rules are defined in an extra section.
Standard rules will be removed before the defined rules are created.

Variables:
^^^^^^^^^^

+-------------------------+---------------------------------------------+
| Name                    | Description                                 |
+=========================+=============================================+
| secgroup_name           | name of Secgroup                            |
+-------------------------+---------------------------------------------+
| secgroup_id             | id of Secgroup                              |
+-------------------------+---------------------------------------------+
| secgroup_ids            | list of secgroup_ids (to bind on ECS        |
+-------------------------+---------------------------------------------+
| secgroups               | list of secgroups in ecs section            |
+-------------------------+---------------------------------------------+
| secgrouprules           | list of rules for a security group          |
+-------------------------+---------------------------------------------+
| secgrouprule_id         | id of a secgroup rule                       |
+-------------------------+---------------------------------------------+

Functions:
^^^^^^^^^^

Create::

    ansible-playbook tenant_yml.yml -e "ecs_name=ansible-test01" -e "localaction=create"

    ansible-playbook tenant_ini.yml -e "ecs_name=ansible-test01" -e "localaction=create"

    ansible-playbook tenant_json.yml -e "ecs_name=ansible-test01" -e "localaction=create"

note: subnet will create during ECS creating workflow

Show::

    ./grole otc_secgroup; ansible-playbook roles.yml -e "secgroup_name=ansible-secgroup01" -e "localaction=show"

List::

    ./grole otc_secgroup; ansible-playbook roles.yml -e "localaction=list"

    ./grole otc_secgroup; ansible-playbook roles.yml -e "vpc_id=1234567891234567890" -e "localaction=list"

    ./grole otc_vpc otc_secgroup; ansible-playbook roles.yml -e "vpc_name=ansible-vpc01" -e "localaction=list"

Delete::

    ./grole otc_secgroup; ansible-playbook roles.yml -e "secgroup_name=ansible-secgroup01" -e "localaction=delete"
