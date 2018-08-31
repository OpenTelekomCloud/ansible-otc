Ansible Galaxy
==============

Ansible Galaxy is a repository for sharing roles.
You can search for specific roles on `Galaxy website <http://galaxy.ansible.com/>`__.
All ansible-otc are to find there and you can also use the CLI::

    ansible-galaxy search otc_

To install a specific role you can use::

    ansible-galaxy install eumel8.otc_auth

or with the requirements file with Galaxy source::

    ansible-galaxy install -r galaxy.yml

or with the requirements file with Git source::

    ansible-galaxy install -r ansible-role-requirements.yml

You need to adjust the roles_path in ansible.cfg. The system-white
roles_path is /etc/ansible/roles

WIP: This feature is a Proof of Concept
