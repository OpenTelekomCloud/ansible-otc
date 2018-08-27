otc_ims
=======

OTC role for Image.

Variables:
^^^^^^^^^^

+-------------------------+-----------------------------------------------------------+
| Name                    | Description                                               |
+=========================+===========================================================+
| image_name              | name of image                                             |
+-------------------------+-----------------------------------------------------------+
| image_id                | id of image                                               |
+-------------------------+-----------------------------------------------------------+
| image_url               | s3 source url for image upload                            |
|                         | <bucket>:<file>                                           |
|                         | ansible1:/xenial-server-cloudimg-amd64-disk1.vmdk         |
+-------------------------+-----------------------------------------------------------+
| ecs_id                  | ecs_id as source for image creation (ECS must be stopped) |
+-------------------------+-----------------------------------------------------------+
| image_min_disk          | minimal disk size for image creation (in GB)              |
+-------------------------+-----------------------------------------------------------+
| image_os_version        | os_version of the created image                           |
+-------------------------+-----------------------------------------------------------+


Functions:
^^^^^^^^^^

Create::

    ansible-playbook tenant_yml.yml -e "image_name=ansible-image01" -e "image_url=ansible1:/xenial-server-cloudimg-amd64-disk1.vmdk" -e "image_min_disk=12" "localaction=create"

    ansible-playbook tenant_yml.yml -e "image_name=ansible-image01" -e "ecs_id=12345678901234567890" -e "image_min_disk=12" "localaction=create"

Show::

    ./grole otc_evs; ansible-playbook roles.yml -e "image_name=Community_Ubuntu_16.04_TSI_latest" -e "localaction=show"

List::

    ./grole otc_evs; ansible-playbook roles.yml -e "localaction=list"

Delete::

    ./grole otc_evs; ansible-playbook roles.yml -e "image_name=ansible-image01" -e "localaction=delete"
