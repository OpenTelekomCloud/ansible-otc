otc_evs
=======

OTC role for Elastic Volume Service (EVS).

Variables:
^^^^^^^^^^

+-------------------------+-----------------------------------------------------------+
| Name                    | Description                                               |
+=========================+===========================================================+
| evs_availability_zone   | Availability Zone for EVS                                 |
+-------------------------+-----------------------------------------------------------+
| evs_id                  | id of EVS                                                 |
+-------------------------+-----------------------------------------------------------+
| evs_name                | name of EVS                                               |
+-------------------------+-----------------------------------------------------------+
| evs_volume_type         | Volume type of EVS (SATA,SSD,SAS)                         |
+-------------------------+-----------------------------------------------------------+
| evs_size                | Volume size in GB                                         |
+-------------------------+-----------------------------------------------------------+
| evs_ims_id              | ims_id from which the volume should created               |
+-------------------------+-----------------------------------------------------------+
| evs_backup_id           | backup_id from which the volume should created            |
+-------------------------+-----------------------------------------------------------+
| evs_scsi                | hw passthrough enabled                                    |
+-------------------------+-----------------------------------------------------------+
| evs_multiattach         | multi attache enabled                                     |
+-------------------------+-----------------------------------------------------------+


Functions:
^^^^^^^^^^

Create::

    ansible-playbook tenant_yml.yml -e "evs_name=ansible-evs01" -e "localaction=create"

Show::

    ./grole otc_evs; ansible-playbook roles.yml -e "evs_name=ansible-evs01" -e "localaction=show"

List::

    ./grole otc_evs; ansible-playbook roles.yml -e "localaction=list"

Delete::

    ./grole otc_evs; ansible-playbook roles.yml -e "evs_name=ansible-evs01" -e "localaction=delete"
