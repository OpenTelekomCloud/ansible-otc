Ansible for Open Telekom Cloud
==============================

Intro
=====

Deutsche Telekom offers since March 2016 an IaaS Service named
Open Telekom Cloud (OTC). The service includes
* Virtual Private Cloud (VPC)
* Elastic Cloud Server (ECS)
* Elastic Load Balancer (ELB)
* Elastic Volume Service (EVS)
* Image Management Service (IMS)
* Object Storage Service (OBS)
* Dynamic Name Service (DNS)
and other useful things. The portfolio will rapidly developed.


Content
=======
Here are some roles to demonstrate how to interact with OTC-API.
ECS-API is origin developed by Huawei and described here:
http://support.hwclouds.com/en-us/api/ecs/en-us_topic_0020805967.html

Roles
=====
|role         | description|
|-------------|------------|
|ecs                    | list virtual machines|
|ecs_create             | create and start virtual machine|
|ecs_delete             | delete a specific virtual machine|
|ecs_show               | information about a specific virtual machine|
|eip                    | show elastic ip-addresses|
|eip_apply              | apply a new elastic ip-address|
|eip_delete             | delete elastic ip-address|
|elb                    | list elastic loadbalancers|
|elb_create             | create elastic loadbalancer|
|elb_delete             | delete elastic loadbalancer|
|elb_show               | show elastic loadbalancer|
|elb_certificate        | show elastic loadbalancer certificates|
|elb_certificate_create | create elastic loadbalancer certificate|
|elb_certificate_delete | delete elastic loadbalancer certificate|
|elb_healthcheck_create | create elastic loadbalancer healthcheck|
|elb_healthcheck_delete | delete elastic loadbalancer healthcheck|
|elb_healthcheck_show   | show elastic loadbalancer healthcheck|
|elb_listener           | list listener for elastic loadbalancer|
|elb_listener_create    | create listener for elastic loadbalancer|
|elb_listener_delete    | delete listener from elastic loadbalancer|
|elb_backends           | list backends for elastic loadbalancer|
|elb_backends_create    | create backends for elastic loadbalancer|
|elb_backends_delete    | delete backends for elastic loadbalancer|
|endpoints              | discover API endpoints|
|evs                    | list volumes|
|evs_create             | create a volume|
|evs_delete             | delete a volume|
|evs_show               | information about a specific volume|
|flavors                | show flavors|
|images                 | show images|
|image_create           | create an image from obs|
|image_delete           | delete an image |
|job                    | show job status|
|keypairs               | show ssh keypairs|
|keypair_create         | create a ssh keypair|
|keypair_delete         | delete a ssh keypair|
|services               | discover API services|
|s3                     | show s3 buckets|
|s3_bucket_create       | create s3 bucket|
|s3_bucket_delete       | delete s3 bucket|
|s3_upload              | upload files in s3 object store|
|secgroups              | show security groups|
|secgroup_create        | create security group|
|secgroup_delete        | delete security group|
|secgrouprule_create    | create security group rule|
|secgrouprule_delete    | delete security group rule|
|subnet                 | show subnet|
|subnet_create          | create subnet (vars in subnet_var.yml)|
|subnet_delete          | delete subnet|
|token                  | get auth token|
|vpc                    | show vpc|
|create_vpc             | create vpc|
|delete_vpc             | delete vpc|
|zones                  | show DNS zones|
|zonerecords            | show DNS zonerecords|
|zone_create            | create DNS zone|
|zone_delete            | delete DNS zone|
|zonerecord_create      | create DNS zonerecord|
|zonerecord_delete      | delete DNS zonerecord|

Requirements
============
* curl
* openssl
* base64
* Ansible >=2.0.1.0

  *Ubuntu 12.04/14.04/16.04:*
  
  ```
     apt-get install software-properties-common
     apt-add-repository ppa:ansible/ansible
     apt-get update
     apt-cache policy ansible
     # should have version >2.1.0
     apt-get install ansible
  ```
  
  *OpenSuSE 13.2:*
  
  ```
     zypper ar http://download.opensuse.org/repositories/systemsmanagement/openSUSE_13.2/systemsmanagement.repo
     zypper up
     zypper install ansible
  ```    
      
(should work on all other *nix systems)

* :exclamation: credentials on OTC (username, projectid, generated API key, S3 access/secret key)

Files
=====
| filename       | description|
|----------------|------------|
|ajob            | shell script to fetch job status from OTC|
|secrets.yml     | var file for OTC credentials and endpoints (ansible-vault)|
|ecs_secrets.yml | var file for virtual machine and volume conf (ansible-vault)|
|elb_secrets.yml | var file for elastic loadbalancer conf (ansible-vault)|
|secgrouprule.yml| var file for single security group rule |
|subnet_var.yml  | var file for subnet |
|vaultpass.txt   | password file for ansible-vault. The default password is: linux :-)|
|hosts           | host file for ansible (we use only localhost)|

Examples
========

```
    cp secrets.yml  _secrets.yml 
    cp ecs_secrets.yml  _ecs_secrets.yml 
    cp elb_secrets.yml _elb_secrets.yml
```
  
:exclamation: **adjust your own data in this file before you using the examples:**

list virtual machines

    ansible-playbook -i hosts ecs.yml --vault-password-file vaultpass.txt

create and start virtual machine (defined in _ecs_secrets.yml)

    ansible-playbook -i hosts ecs_create.yml -e @_ecs_secrets.yml --vault-password-file vaultpass.txt

create and start virtual machine (defined in _ecs_secrets.yml and overwrite options)

    ansible-playbook -i hosts ecs_create.yml -e @_ecs_secrets.yml -e "ecs_name=test02-ansible" --vault-password-file vaultpass.txt

create and start virtual machine with file injection 
(inject up to 5 max 1k base64 encoded files)

    ansible-playbook -i hosts -e "ecs_fileinject_1=/etc/hosts ecs_fileinject_data_1=$(base64 -w 0 hosts.txt) ecs_fileinject_2=/root/README.md2 ecs_fileinject_data_2=$(base64 -w 0 hallo.txt)" ecs_create.yml --vault-password-file vaultpass.txt

create and start virtual machine with injection user_data
(inject max 32k base64 encoded user-data files)

    ansible-playbook -i hosts -e "ecs_user_data=$(base64 -w 0 user-data.txt)" ecs_create.yml --vault-password-file vaultpass.txt

(!) You can define ecs_fileinject_1, ecs_fileinject_data_1 and ecs_user_data also in _ecs_secrets.yml. Files must be base64 encoded.

show virtual machine (single)

    ansible-playbook -e "ecs_id=51b6558a-7a6d-49f4-94e5-f4ec94314746 ecs_name=test05-ansible" -i hosts ecs_show.yml --vault-password-file vaultpass.txt

delete virtual machine (only the machine)

    ansible-playbook -e "ecs_id=51b6558a-7a6d-49f4-94e5-f4ec94314746 ecs_name=test05-ansible" -i hosts ecs_delete.yml --vault-password-file vaultpass.txt

delete virtual machine (delete also floating ip and attached volumes)

    ansible-playbook -e "ecs_id=f6b7536e-b954-4d73-940f-248de71ce58b ecs_name=test06-ansible delete_publicip=1 delete_volume=1" -i hosts ecs_delete.yml --vault-password-file vaultpass.txt


show information about a single virtual machines

    ansible-playbook -e "ecs_id=f6b7536e-b954-4d73-940f-248de71ce58b ecs_name=test06-ansible" -i hosts ecs_info.yml --vault-password-file vaultpass.txt
    
list elastic loadbalancers

    ansible-playbook -i hosts elb.yml --vault-password-file vaultpass.txt

create elastic loadbalancer

    ansible-playbook -i hosts elb_create.yml --vault-password-file vaultpass.txt

delete elastic loadbalancer

    ansible-playbook -i hosts -e "elb_id=43848329789145988d1e0bf25edb5ea8" elb_delete.yml --vault-password-file vaultpass.txt

show elastic loadbalancer

    ansible-playbook -i hosts -e "elb_id=43848329789145988d1e0bf25edb5ea8" elb_show.yml --vault-password-file vaultpass.txt

list elastic loadbalancer certificates

    ansible-playbook -i hosts  elb_certificate.yml --vault-password-file vaultpass.txt

create elastic loadbalancer certificate

    ansible-playbook -i hosts -e "elb_certificate_name=ansible-cert elb_certificate_key_file=cert.key elb_certificate_certificate_file=cert.crt"  elb_certificate_create.yml --vault-password-file vaultpass.txt

delete elastic loadbalancer certificates

    ansible-playbook -i hosts -e "elb_certificate_id=43848329789145988d1e0bf25edb5ea8"  elb_certificate_delete.yml --vault-password-file vaultpass.txt

create elastic loadbalancer healthcheck

    ansible-playbook -i hosts -e "elb_listener_id=1595f0e7b6984395ab2832a22cd246f2" elb_healthcheck_create.yml --vault-password-file vaultpass.txt

delete elastic loadbalancer healthcheck

    ansible-playbook -i hosts -e "elb_healthcheck_id=e12454b93f304b759be699cb0270648c" elb_healthcheck_delete.yml --vault-password-file vaultpass.txt

show elastic loadbalancer healthcheck

    ansible-playbook -i hosts -e "elb_healthcheck_id=e12454b93f304b759be699cb0270648c" elb_healthcheck_show.yml --vault-password-file vaultpass.txt

list listener for elastic loadbalancer

    ansible-playbook -i hosts -e "elb_id=e12454b93f304b759be699cb0270648c" elb_listener.yml --vault-password-file vaultpass.txt

create listener for elastic loadbalancer

    ansible-playbook -i hosts -e "elb_id=e12454b93f304b759be699cb0270648c" elb_listener_create.yml --vault-password-file vaultpass.txt

delete listener for elastic loadbalancer

    ansible-playbook -i hosts -e "elb_listener_id=e12454b93f304b759be699cb0270648c" elb_listener_delete.yml --vault-password-file vaultpass.txt

list backends for elastic loadbalancer

    ansible-playbook -i hosts -e "elb_listener_id=e12454b93f304b759be699cb0270648c elb_backends.yml --vault-password-file vaultpass.txt

create backends for elastic loadbalancer

    ansible-playbook -i hosts -e "elb_listener_id=e12454b93f304b759be699cb0270648c ecs_id=f6b7536e-b954-4d73-940f-248de71ce58b ecs_address=192.168.0.112" elb_backends_create.yml --vault-password-file vaultpass.txt

delete backends for elastic loadbalancer

    ansible-playbook -i hosts -e "elb_listener_id=e12454b93f304b759be699cb0270648c elb_backends_id=f6b7536e-b954-4d73-940f-248de71ce58b" elb_backends_delete.yml --vault-password-file vaultpass.txt

discover API endpoints

    ansible-playbook -i hosts endpoints.yml --vault-password-file vaultpass.txt

list volumes

    ansible-playbook -i hosts evs.yml --vault-password-file vaultpass.txt

create a volume (defined in ecs_secrets.yml)

    ansible-playbook -i hosts evs_create.yml --vault-password-file vaultpass.txt

delete a volume 

    ansible-playbook -i hosts evs_delete.yml -e "evs_id=05f143e0-3ca9-4ec7-97e6-733dd281c283" --vault-password-file vaultpass.txt

show information about a single volume

    ansible-playbook -i hosts evs_show.yml -e "evs_id=05f143e0-3ca9-4ec7-97e6-733dd281c283" --vault-password-file vaultpass.txt

show flavors

    ansible-playbook -i hosts flavors.yml --vault-password-file vaultpass.txt

show elastic ip-addresses

    ansible-playbook -i hosts eip.yml --vault-password-file vaultpass.txt

apply a new elastic ip-address (bandwidth between 1-300 MBit/s)

    ansible-playbook -i hosts eip_apply.yml -e "eip_bandwidth_name=ansible-eip1" -e "eip_bandwidth_size=100"  --vault-password-file vaultpass.txt

delete elastic ip-address

    ansible-playbook -i hosts eip_delete.yml -e "eip_id=c417c3bf-fdd2-47c4-a64f-320add5759b5"  --vault-password-file vaultpass.txt

show images

    ansible-playbook -i hosts images.yml --vault-password-file vaultpass.txt

delete an image (API return code is 204 when success, ansible expected 200 and may give an error)

     ansible-playbook -i hosts -e "image_id=af0a0bcf-7be3-4722-98ba-3350801a8cd5" image_delete.yml  --vault-password-file vaultpass.txt

show job status

    ansible-playbook -e "job_id=2c9eb2c15693b00901571e32ad5e1755" -i hosts job.yml --vault-password-file vaultpass.txt

    ./ajob 2c9eb2c15693b00901571e32ad5e1755

show keypairs

    ansible-playbook -i hosts keypairs.yml --vault-password-file vaultpass.txt

create keypair

    ansible-playbook -i hosts -e "keypair_name=test-key" -e "keypair_file=~/.ssh/id_rsa.pub" keypair_create.yml --vault-password-file vaultpass.txt

delete keypair

    ansible-playbook -i hosts -e "keypair_name=test-key"  keypair_delete.yml --vault-password-file vaultpass.txt

discover API services

    ansible-playbook -i hosts services.yml --vault-password-file vaultpass.txt

show s3 buckets

    ansible-playbook -i hosts s3.yml --vault-password-file vaultpass.txt

create s3 bucket

    ansible-playbook -i hosts -e "bucket=mybucket"  s3_bucket_create.yml  --vault-password-file vaultpass.txt

delete s3 bucket

    ansible-playbook -i hosts -e "bucket=mybucket"  s3_bucket_delete.yml  --vault-password-file vaultpass.txt

upload files in s3 object store (VHD, ZVHD, VMDK, QCOW2 are supported for otc image service)

    ansible-playbook -i hosts -e "bucket=mybucket" -e "object=xenial-server-cloudimg-amd64-disk1.vmdk"  s3_upload.yml  --vault-password-file vaultpass.txt

show security groups

    ansible-playbook -i hosts secgroups.yml --vault-password-file vaultpass.txt

show security groups (only from one vpc)

    ansible-playbook -i hosts secgroups.yml -e "vpc_id=d59284de-ad78-4fee-8f2d-d6ff335f4961" --vault-password-file vaultpass.txt

create security group

    ansible-playbook -i hosts secgroup_create.yml -e "secgroup_name=ansible-secgroup01" -e "vpc_id=d59284de-ad78-4fee-8f2d-d6ff335f4961" --vault-password-file vaultpass.txt

delete security group

    ansible-playbook -i hosts secgroup_delete.yml -e "secgroup_id="6e8ac0a0-e0ec-4c4d-a786-9c9c946fd673"" --vault-password-file vaultpass.txt

create security group rule

    ansible-playbook -i hosts secgrouprule_create.yml -e "secgroup_id=e67e7ef1-b582-47f7-a43f-6a244fd01353" -e @secgrouprule.yml --vault-password-file vaultpass.txt

delete security group rule

    ansible-playbook -i hosts secgrouprule_delete.yml -e "secgrouprule_id=3c329359-fef5-402f-b29a-caac734065a1" --vault-password-file vaultpass.txt

show subnets

    ansible-playbook -i hosts subnet.yml --vault-password-file vaultpass.txt

create subnet (vars in subnet_var.yml)

    ansible-playbook -i hosts subnet_create.yml -e @subnet_var.yml  --vault-password-file vaultpass.txt

delete subnet

    ansible-playbook -i hosts subnet_delete.yml -e "vpc_id=0db2af4b-115d-426a-acae-889b025110c8" -e "subnet_id=3ec461e1-eca4-485b-a2a5-91a840968a4f"  --vault-password-file vaultpass.txt

show vpc

    ansible-playbook -i hosts vpc.yml --vault-password-file vaultpass.txt

create vpc

    ansible-playbook -i hosts vpc_create.yml -e "vpc_name=ansible-vpc1" -e "vpc_net=192.168.0.0/16" --vault-password-file vaultpass.txt 

delete vpc

    ansible-playbook -i hosts vpc_delete.yml -e "vpc_id=0db2af4b-115d-426a-acae-889b025110c8" --vault-password-file vaultpass.txt 
show DNS zones

    ansible-playbook -i hosts  zones.yml --vault-password-file vaultpass.txt

create DNS zone (name and ttl are mandatory)

    ansible-playbook -i hosts -e "zone_name=example.com." -e "zone_description=example zone" -e "zone_email=example@example.com" -e "zone_ttl=86400" zone_create.yml --vault-password-file vaultpass.txt

delete DNS zone

    ansible-playbook -i hosts -e "zoneid=ff80808257e2bb5e0157ec5ca2620234" zone_delete.yml --vault-password-file vaultpass.txt

show DNS zone records

    ansible-playbook -i hosts  zonerecords.yml --vault-password-file vaultpass.txt

create DNS zonerecord (A-Record) possible values A,AAAA,MX,CNAME,PTR,TXT,NS

    ansible-playbook -i hosts -e "zoneid=ff80808257e2bb5e0157ec620968023a" -e "zonerecord_name=testserver.example.com." -e "zonerecord_type=A" -e "zonerecord_value=160.44.196.210" -e "zonerecord_ttl=86400" zonerecord_create.yml --vault-password-file vaultpass.txt

create DNS zonerecord (PTR-Record)

    first create reverse zone:

    ansible-playbook -i hosts -e "zone_name=210.196.44.160.in-addr.arpa." -e "zone_description=reverse  zone 160.44.196.210" -e "zone_email=test@example.com" -e "zone_ttl=300" zone_create.yml --vault-password-file vaultpass.txt

    then create PTR-Record:
    
    ansible-playbook -i hosts -e "zoneid=ff80808257e2bb5e0157ec8911e60240" -e "zonerecord_name=210.196.44.160.in-addr.arpa." -e "zonerecord_type=PTR" -e "zonerecord_value=testserver.example.com" -e "zonerecord_ttl=300" zonerecord_create.yml --vault-password-file vaultpass.txt

    beware of "." in the end of name and name convention of the PTR zones

delete DNS zonerecord 

    ansible-playbook -i hosts -e "zoneid=ff80808257e2bb5e0157ec620968023a" -e "zonerecordid=ff80808257e2bb050157ec789b5e027e"  zonerecord_delete.yml --vault-password-file vaultpass.txt


Contributing
------------
Very welcome. We are in a very early state of automated platform deployment
on OTC. So each help is still welcome

1. Fork it.
2. Create a branch (`git checkout -b my_markup`)
3. Commit your changes (`git commit -am "Added Snarkdown"`)
4. Push to the branch (`git push origin my_markup`)
5. Open a [Pull Request][1]
6. Enjoy a refreshing Diet Coke and wait

