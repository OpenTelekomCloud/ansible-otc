Authentification
================

As described in :ref:`Connect_Cheat_Sheet` there are different ways to
connect to the cloud. Ansible-OTC provides three ways:


Using Ansible Vault
-------------------

The feature to store secrets is `Ansible Vault <https://docs.ansible.com/ansible/2.4/vault.html>`__.
In Ansible-OTC is a files named *secrets.yml* which contains auth
credentials for OTC services::

    # adjust account data here or in clouds.yml
    USERNAME: "<username>"
    PASSWORD: "<password>"
    DOMAIN: "OTC-EU-DE-0000000000100000XXXX"
    PROJECT_NAME: "eu-de"

    EC2_ACCESS_KEY: "<obs access key>"
    EC2_SECRET_KEY: "<obs secret key>"
    EC2_URL: "https://obs.otc.t-systems.com"

    # endpoint urls
    IAM_AUTH_URL: "https://iam.{{ PROJECT_NAME }}.otc.t-systems.com/v3"
    AUTH_URL_ELB: "https://elb.{{ PROJECT_NAME }}.otc.t-systems.com/v1.0"
    AUTH_URL_ECS_CLOUD: "https://ecs.{{ PROJECT_NAME }}.otc.t-systems.com/v1"
    AUTH_URL_RDS: "https://rds.{{ PROJECT_NAME }}.otc.t-systems.com/rds/v1"


The file is on the git repo. So copy the file first before you adjust your
credentials::

    cp secrets.yml _secrets.yml 
    ansible-vault edit _secrets.yml

We will looking for *_secrets.yml* file in the role ``otc_auth``

Call the playbooks with vault param to encrypt the secret store::

    ansible-playbook ecs.yml --vault-password-file vaultpass.txt


*vaultpass.txt* contains in this case the ansible-vault password.
The default password on our repo is: linux :-)

os-client config
----------------

for more comfort and standardization we moved later credential lookup
from *secrets.yml* to *clouds.yml* (`refer os-client-config <https://docs.openstack.org/developer/os-client-config/>`__).
If you already configured your OTC credentials there put your profile name in env.yml or use

::

    ansible-playbook -e "CLOUD=otc" ...

if your profile named otc

If you like to start with this feature run once os-client-config.yml and answer the question. A basic yml file with one
profile will created for you::


   ansible-playbook  os-client-config.yml


This will generate a file on *~/.config/openstack/clouds.yml*

Environment variables
---------------------

Sometimes are requirements to never store auth credentials on local
disc (like Travis). For this use cases environment variables are also
supported on Ansible-OTC. This 4 variables are expected::

    export OS_USERNAME=travis
    export OS_PASSWORD=xxxxxxxxxxxxxxxxxxxxxxxxxx
    export OS_PROJECT_NAME=eu-de
    export OS_USER_DOMAIN_NAME=OTC-EU-DE-00000000000000000000
