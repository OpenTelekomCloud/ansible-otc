os-client-config
================

OTC role for generate os-clientconfig

Variables:
^^^^^^^^^^

+-------------------------+---------------------------------------------+
| Name                    | Description                                 |
+=========================+=============================================+
| occ_profile_name        | cloud profile name, e.g. otc                |
+-------------------------+---------------------------------------------+
| occ_auth_url            | IAM auth url (version 3 is default)         |
+-------------------------+---------------------------------------------+
| occ_region_name         | cloud region name                           |
+-------------------------+---------------------------------------------+
| occ_username            | cloud username                              |
+-------------------------+---------------------------------------------+
| occ_password            | cloud password                              |
+-------------------------+---------------------------------------------+
| occ_project_name        | cloud project name, e.g. eu-de              |
+-------------------------+---------------------------------------------+
| occ_project_domain_name | cloud project domain name, e.g. Default     |
+-------------------------+---------------------------------------------+
| occ_user_domain_name    | cloud user domain, e.g. OTC-eu-de-0012345   |
+-------------------------+---------------------------------------------+

Functions:
^^^^^^^^^^

Create::

     ansible-playbook os-client-config.yml

Read::

    n/a

Update::

    n/a

Delete::

    n/a
