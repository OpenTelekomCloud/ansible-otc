Build your own images with ansible
==================================

1. Download Ubuntu Cloud Image
2. Upload to IMS (private, generic name)
3. Boot VM with this image
4. Login ssh, install, configure, doing things
5. Shutdown VM
6. Upload VM image to IMS (private, customize name)

Supported OS:
-------------

* Ubuntu 14.04
* Ubuntu 16.04

Requirements:
-------------

** adjust vars/buildservice_var.yml::

    vi vars/buildservice_var.yml

** copy secret file to your own::

    cp vars/secrets.yml vars/_secrets.yml

** adjust S3 credentials::

     ansible-vault edit vars/_secrets.yml --vault-password-file vars/vaultpass.txt **

Usage:
------

::
    ansible-playbook buildservice.yml -e "distro=trusty" --vault-password-file vaultpass.txt

    ansible-playbook buildservice.yml -e "distro=xenial" --vault-password-file vaultpass.txt


Easy to adapt for other operating systems
