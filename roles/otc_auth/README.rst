otc_auth
========

OTC role for authentification.

Supports:

* os-client-config
* env variables

Variables:
^^^^^^^^^^

+--------------+---------------------------------------------+
| Name         | Description                                 |
+==============+=============================================+
| USERNAME     | cloud username                              |
|              | env variable or content of os-client config |
+--------------+---------------------------------------------+
| PASSWORD     | cloud password                              |
|              | env variable or content of os-client config |
+--------------+---------------------------------------------+
| PROJECTNAME  | cloud project name, e.g. eu-de              |
|              | env variable or content of os-client config |
+--------------+---------------------------------------------+
| DOMAIN       | cloud user domain, e.g. OTC-eu-de-0012345   |
|              | env variable or content of os-client config |
+--------------+---------------------------------------------+

Functions:
^^^^^^^^^^

Create::

    role otc_auth

Read::

    n/a

Update::

    n/a

Delete::

    n/a
