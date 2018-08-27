Ansible OTC Workshop
====================

You need  a valid connetion to OTC with ansible. See :ref:`Connect_Cheat_Sheet` section 4.

All commands are working from::

    cd playbooks

1. List all running ECS instances (VMs)::

    ./grole otc_ecs; ansible-playbook roles.yml -e "localaction=list"

2. List all available images (IMS)::

    ./grole otc_ims; ansible-playbook roles.yml -e "localaction=list"

3. List all available VPC (Network)::

    ./grole otc_vpc; ansible-playbook roles.yml -e "localaction=list"

4. List all available Floating IP (EIP)::

    ./grole otc_eip; ansible-playbook roles.yml -e "localaction=list"

5. List all available security groups (Network)::

    ./grole otc_secgroups; ansible-playbook roles.yml -e "localaction=list"

6. Generate local ssh-key::

    ssh-keygen

7. Configure your ECS instance in vars/tenant.ini

    To distinguish the resources, use your own namespace::

        # section name is instance name of the VM
        [myecs]
        # image name of the ECS instance. grab a valid name from the list below
        image_name=Community_Ubuntu_16.04_TSI_latest
        # volume type of the ECS instance. valid names are SATA, SAS or SSD
        ecs_volumetype=SATA
        # RAM in MB of the ECS instance
        ecs_ram=2048
        # Count of vCPU of the ECS instance
        ecs_vcpus=2
        # VPC name grapped by list. Or a new Virtual Private Cloud (VPC)
        vpc_name=cloudcamp-vpc01
        # Setup a security group for the ECS instance and a set of rules
        secgroups=["cloudcamp-secgroup01"]
        # Network of the whole VPC
        vpc_net=192.168.0.0/16
        # Name of the subnet inside the VPC where the ECS instance is running
        subnet_name=cloudcamp-subnet01
        subnet_net=192.168.0.0/24
        # ipaddress of the subnet router
        subnet_gateway=192.168.0.1
        # Should DHCP running inside the subnet
        subnet_dhcp_enable=true
        # Valid nameserver, will attached to the ecs instance as resolver
        subnet_primary_dns=8.8.8.8
        subnet_secondary_dns=8.4.4.8
        # Availabilty Zone where the instance is runnig. Valid names are eu-de-01 and eu-de-02
        availability_zone=eu-de-01
        # Configure a static internal ipaddress (optional)
        ecs_ipaddress=192.168.0.80
        # Configure a public floating ipaddress. Set value if address is known. 0.0.0.0 to apply a new one. If empty no floating ip will set
        ecs_publicip=0.0.0.0
        # Name and site of the floating ipaddress (bandwidth in Mbit/sec)
        eip_bandwidth_name=cloudcamp-eip1
        eip_bandwidth_size=100
        ecs_adminkey=my-key
        # SSH-key to inject the ecs instance
        keypair_file=~/.ssh/id_rsa.pub
        [securitygroups]
        cloudcamp-secgroup01=["ingress;IPv4;tcp;22;22;0.0.0.0/0", "ingress;IPv4;tcp;80;80;0.0.0.0/0"]

  Pitfalls: 

    * ecs_ipaddress must be in subnet_net
    * subnet_net must be in vpc_net
    * names are often not unique. multiple ecs, security groups can have the same name

8. Start and check your ECS instance::

    ansible-playbook tenant_ini.yml -e "ecs_name=myecs" -e "localaction=create"

  ansible should work through the playbooks. Last task should output the JobID. 
  You can check the job status (use your own JobID) ::

    ./ajob "2c9eb2c55c913859015c9636c3a5151f"

  When the status is SUCCESS ECS instance is running.
  In ansible output below you find in eip_apply the new floating ip. 
  Test connectivity (use your own address)::

    ping 160.44.xxx.xxx

  Alternate way to catch the floating ip:

  * in detail view of your ecs instance search for internal ipaddress
  * grab the list of eip and compare association of internal and floating ip-addresses

  cmd::

    ./grole otc_ecs; ansible-playbook roles.yml -e "ecs_name=myecs" -e "localaction=list"
    ./grole otc_eip; ansible-playbook roles.yml -e "localaction=list"

9. SSH Login in your ECS instance::

    ssh -i .ssh/id_rsa ubuntu@160.44.xxx.xxx
    exit

10. Delete ECS instance::

    ./grole otc_ecs; ansible-playbook roles.yml -e "ecs_name=myecs" -e "localaction=delete"
