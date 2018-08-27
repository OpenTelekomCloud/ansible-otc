Configuration of Ansible-OTC
============================

Command line variables and variable files
-----------------------------------------

Ansible can handle variables in different ways. The easiest way is to
pass variables on command line. This will always overwrite pre-defines.

Two examples:

create and start virtual machine with file injection 
(inject up to 5 max 1k base64 encoded files)::

    ansible-playbook ecs_create.yml -e "ecs_fileinject_1=/etc/hosts ecs_fileinject_data_1=$(base64 -w 0 hosts.txt) ecs_fileinject_2=/root/README.md2 ecs_fileinject_data_2=$(base64 -w 0 hallo.txt)" --vault-password-file vaultpass.txt

create and start virtual machine with injection user_data
(inject max 32k base64 encoded user-data files)::

    ansible-playbook ecs_create.yml -e "ecs_user_data=$(base64 -w 0 user-data.txt)" --vault-password-file vaultpass.txt

You can also put the variables in an extra file and pass them on command
line::

    ansible-playbook ecs_create.yml -e "@my_ecs_data.yml"

More options are described on
`Ansible Lookups <http://docs.ansible.com/ansible/latest/playbooks_lookups.html>`__

INI file variables
------------------

A human readable form of configuration files in key=value format. The
INI file is divided into section. A section is a definition of an ECS
instance, or EVS/ELB, or DNS zone.
A [default] section on topic is valid for each other
section where values are overwritten. Example is in
playbooks/vars/tenant.ini

YAML file variables
-------------------

YAML are also human readable. The format is key:value, but the value can
also include another key, so you can group your items like::

    default-default_of_whatever

    vms-vm1
       -vm2
       -vm3
    evs-evs1
       -evs2
       -evs3
    elb-elb1
       -elb2
       -elb3

Example is on playbooks/vars/tenant.yml

JSON file variables
-------------------

`JSON Schema <http://json-schema.org/>`__ can be a very powerful tool
for configuration handling. Basically it's also a key:value store like
YAML or INI, but in JSON you can define your own schema. This includes
the definition of field types, like strings or values. It would be
useful if you know the schema definition of OTC API. Then you could copy
the schema one to one. Or you start with your own definition which
should be well considered. A basic example of using JSON is on
playbooks/vars/tenant.json

