Installrequirements
-------------------

* curl
* openssl
* base64
* ansible==2.5.0.0
* python-jmespath
* python-netaddr
* libxml2-utils


  *Ubuntu 14.04/16.04:*::
  
     apt-get install software-properties-common
     apt-get update
     apt-cache policy ansible
     apt-get install curl python-pip python-jmespath python-netaddr
     pip install ansible==2.5.0.0
  
  *OpenSuSE 13.2:*::
  
     zypper ar http://download.opensuse.org/repositories/systemsmanagement/openSUSE_13.2/systemsmanagement.repo
     zypper up
     zypper install curl ansible python-jmespath python-netaddr
      
(should work on all other \*nix systems, check the right version of ansible!!!)

credentials on OTC (username, password, domain, S3 access/secret key)


