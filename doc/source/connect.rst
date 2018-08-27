.. _Connect_Cheat_Sheet:

OTC Connect Cheat Sheet
=======================

How to connect to the Open Telekom Cloud
----------------------------------------

Install prerequisites as root on your Ubuntu 16.04 machine:

Using requirements file in ansible-otc repo::

    apt-get update
    apt-get -y install curl git python-pip libs3-2 jq
    pip install pip -U
    pip install -r https://raw.githubusercontent.com/eumel8/ansible-otc/dev/requirements.txt

Alternate way::

    apt-get update
    apt-get -y install curl git python-openstackclient python-pip python-jmespath python-netaddr libs3-2 jq
    pip install pip -U
    pip install python-otcclient
    pip install ansible==2.5.0.0

Follow instruction as normal user. You need always username, password, domain data.


1. Openstack-Client
-------------------

source::

    mkdir -p ~/.config/openstack
    touch ~/.config/openstack/clouds.yml
    chmod 600 ~/.config/openstack/clouds.yml
    vi ~/.config/openstack/clouds.yml

clouds.yml::

    clouds:
        otc.10000:
            auth:
                auth_url: https://iam.eu-de.otc.t-systems.com:443/v3
                username: xxxxxx
                password: xxxxxx
                project_name: eu-de
                project_domain_name: Default
                user_domain_name: OTC-EU-DE-00000000001000010000
            region_name: eu-de
            identity_api_version: "3"
        otc.19720:
            auth:
                auth_url: https://iam.eu-de.otc.t-systems.com:443/v3
                username: xxxxx
                password: xxxxx
                project_name: eu-de
                project_domain_name: Default
                user_domain_name: OTC-EU-DE-00000000001000019720
            region_name: eu-de
            identity_api_version: "3"



For multiple mandants you can use different chapter. At least you need
per chapter username, password,user_domain_name.
Region is limited to eu-de but can also adjust to other regions

Test connection::

    openstack --os-cloud otc.19720 server list


2. Python OTC-Client
--------------------

source::

    mkdir -p ~/.otc
    touch ~/.otc/config
    chmod 600 ~/.otc/config
    vi ~/.otc/config


config:

source::

    [otc]
    # otc_access_key_id = yyyyy
    # otc_secret_access_key = yyyyy
    username = xxxxx
    apikey = xxxxx
    domain = OTC-EU-DE-00000000001000019720


otc_access_key_id/otc_secret_access_key are not necessary. *apikey* means password

Test connection::

    otc ecs describe_instances


3. Bash OTC-Tools
-----------------

source::

    git clone https://github.com/OpenTelekomCloud/otc-tools.git
    touch ~/.otc_env.sh
    chmod 600 ~/.otc_env.sh
    vi ~/.otc_env.sh


Variables are set in shell env or in .otc_env.sh

source::

    OS_USERNAME=xxxxx
    OS_PASSWORD=xxxxx
    OS_USER_DOMAIN_NAME=OTC-EU-DE-00000000001000019720
    OS_PROJECT_NAME=eu-de
    OS_AUTH_URL=https://iam.eu-de.otc.t-systems.com/v3

Test connection::

    cd otc-tools
    ./otc.sh ecs list
    cd ~

4. Ansible for Open Telekom Cloud
---------------------------------

source::

    git clone https://github.com/eumel8/ansible-otc.git
    cd ansible-otc/playbooks
    cp vars/secrets.yml  vars/_secrets.yml 
    ansible-vault edit vars/_secrets.yml --vault-password-file vars/vaultpass.txt

Adjust these lines::

    USERNAME: "xxxxx"
    PASSWORD: "xxxxx"
    DOMAIN: "OTC-EU-DE-00000000001000019720"

Test connection::

    ./grole otc_ecs; ansible-playbook roles.yml -e "localaction=list" --vault-password-file vaultpass.txt
