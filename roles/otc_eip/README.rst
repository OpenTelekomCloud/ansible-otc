otc_eip
=======

OTC role for floating ip (EIP).

Variables:
^^^^^^^^^^

+-------------------------+-----------------------------------------------------------+
| Name                    | Description                                               |
+=========================+===========================================================+
| public_ip_address       | Public ip address (alreay allocated or new                |
+-------------------------+-----------------------------------------------------------+
| eip_id                  | id of EIP                                                 |
+-------------------------+-----------------------------------------------------------+
| eip_bandwidth_name      | Bandwith name of EIP                                      |
+-------------------------+-----------------------------------------------------------+
| eip_bandwidth_size      | Bandwith size of EIP (5-500 Mbit/s                        |
+-------------------------+-----------------------------------------------------------+


Functions:
^^^^^^^^^^

Create::

    ansible-playbook tenant_yml.yml -e "public_ip_address=0.0.0.0" -e "localaction=create"

Show::

    ./grole otc_eip; ansible-playbook roles.yml -e "public_ip_address=160.44.1.1" -e "localaction=show"

List::

    ./grole otc_eip; ansible-playbook roles.yml -e "localaction=list"

Delete::

    ./grole otc_eip; ansible-playbook roles.yml -e "public_ip_address=160.44.1.1" -e "localaction=delete"
