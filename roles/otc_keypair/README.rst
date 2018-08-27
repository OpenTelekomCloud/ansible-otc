otc_keypair
===========

OTC role for ssh keys.

Variables:
^^^^^^^^^^

+-------------------------+-----------------------------------------------------------+
| Name                    | Description                                               |
+=========================+===========================================================+
| ecs_adminkey            | Name of the ssh key (to upload)                           |
+-------------------------+-----------------------------------------------------------+
| ecs_adminkey_name       | Lookup name of ssh key                                    |
+-------------------------+-----------------------------------------------------------+
| keypair_file            | File to upload as ssh key                                 |
+-------------------------+-----------------------------------------------------------+


Functions:
^^^^^^^^^^

Create::

    ./grole otc_keypair; ansible-playbook roles.yml -e "ecs_adminkey=ansible-key01" -e "keypair_file=.ssh/authorized_keys" -e "localaction=create"

    ansible-playbook tenant_yml.yml -e "ecs_adminkey=ansible-key01" -e "keypair_file=.ssh/authorized_keys" -e "localaction=create"

note: keypair will be created during ECS creating worklflow

Show::

    ./grole otc_keypair; ansible-playbook roles.yml -e "ecs_adminkey=ansible-key01" -e "localaction=show"

List::

    ./grole otc_keypair; ansible-playbook roles.yml -e "localaction=list"

Delete::

    ./grole otc_keypair; ansible-playbook roles.yml -e "ecs_adminkey=ansible-key01" -e "localaction=delete"
