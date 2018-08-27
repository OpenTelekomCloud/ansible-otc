Ansible for Open Telekom Cloud  [![GitHub release](https://img.shields.io/github/release/eumel8/ansible-otc.svg?maxAge=3600)](https://github.com/eumel8/ansible-otc/releases)
==============================

[![Documentation Status](https://readthedocs.org/projects/ansible-otc/badge/?version=latest)](http://ansible-otc.readthedocs.io/en/latest/?badge=latest)
[![Build Status](https://travis-ci.org/eumel8/ansible-otc.svg?branch=master)](https://travis-ci.org/eumel8/ansible-otc)

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/25eee063b94b455b90e3aa9d915071fa)](https://www.codacy.com/app/eumel/ansible-otc?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=eumel8/ansible-otc&amp;utm_campaign=Badge_Grade)

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
* Relational Database Service (RDS)

and other useful things. The portfolio will rapidly developed.


Content
=======

Full documentation is using Sphinx and is now hosted on http://ansible-otc.readthedocs.io/en/latest/

For local build use:

```
    tox -edocs
    pip install -r requirements.txt
```


Presentations
=============

* https://www.slideshare.net/FrankKloeker/ansible-otc


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

