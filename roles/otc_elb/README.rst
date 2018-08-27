otc_elb
=======

OTC role for Elastic Load Balancer (ELB).

Variables:
^^^^^^^^^^

+------------------------------------+---------------------------------------------------------------+
| Name                               | Description                                                   |
+====================================+===============================================================+
| localaction="list"                 | List ELB                                                      |
+------------------------------------+---------------------------------------------------------------+
| localaction="create"               | Create ELB                                                    |
+------------------------------------+---------------------------------------------------------------+
| localaction="show"                 | Show ELB resources                                            |
+------------------------------------+---------------------------------------------------------------+
| localaction="listenercreate"       | Create ELB Listener                                           |
+------------------------------------+---------------------------------------------------------------+
| localaction="listenershow"         | Show ELB Listener resources                                   |
+------------------------------------+---------------------------------------------------------------+
| localaction="healthcheckcreate"    | Create ELB Healthcheck                                        |
+------------------------------------+---------------------------------------------------------------+
| localaction="certificatecreate"    | Create ELB Certificate                                        |
+------------------------------------+---------------------------------------------------------------+
| localaction="backendcreate"        | Create ELB Backend                                            |
+------------------------------------+---------------------------------------------------------------+
| localaction="backenddelete"        | Delete ELB Backend                                            |
+------------------------------------+---------------------------------------------------------------+
| localaction="delete"               | Delete ELB                                                    |
+------------------------------------+---------------------------------------------------------------+
| localaction="listenerdelete"       | Delete ELB Listener                                           |
+------------------------------------+---------------------------------------------------------------+
| localaction="healthcheckdelete"    | Delete ELB Healthcheck                                        |
+------------------------------------+---------------------------------------------------------------+
| localaction="certificatedelete"    | Delete ELB certificate                                        |
+------------------------------------+---------------------------------------------------------------+
| localaction="backenddelete"        | Delete ELB Backend                                            |
+------------------------------------+---------------------------------------------------------------+
| elb_name                           | name of ELB                                                   |
+------------------------------------+---------------------------------------------------------------+
| elb_id                             | id of ELB                                                     |
+------------------------------------+---------------------------------------------------------------+
| admin_state_up                     | state of the ELB                                              |
+------------------------------------+---------------------------------------------------------------+
| elb_availability_zone              | Availability zone where ELB is located                        |
+------------------------------------+---------------------------------------------------------------+
| elb_bandwidth                      | Bandwidth of the ELB                                          |
+------------------------------------+---------------------------------------------------------------+
| elb_type                           | Typ of ELB (internal or external                              |
+------------------------------------+---------------------------------------------------------------+
| elb_secgroup_name                  | Security Group bound on ELB                                   |
+------------------------------------+---------------------------------------------------------------+
| elb_subnet_name                    | Subnet of ELB                                                 |
+------------------------------------+---------------------------------------------------------------+
| elb_vpc_name                       | VPC of ELB                                                    |
+------------------------------------+---------------------------------------------------------------+
| listener_protocol                  | Listener protocol (HTTP, HTTPS, TCP)                          |
+------------------------------------+---------------------------------------------------------------+
| listener_port                      | Listener Port                                                 |
+------------------------------------+---------------------------------------------------------------+
| listener_backend_protocol          | Listener Backend Protocol (HTTP, HTTPS, TCP)                  |
+------------------------------------+---------------------------------------------------------------+
| listener_backend_port              | Listener Backend Port                                         |
+------------------------------------+---------------------------------------------------------------+
| listener_lb_algorithm              | Listener Algorithm (source,  roundrobin, leastconn)           |
+------------------------------------+---------------------------------------------------------------+
| listener_certificate_name          | Listener SSL Certificate Name                                 |
+------------------------------------+---------------------------------------------------------------+
| listener_tcp_timeout               | Listener TCP timeout                                          |
+------------------------------------+---------------------------------------------------------------+
| listener_cookie_timeout            | Listener Timeout for Cookies                                  |
+------------------------------------+---------------------------------------------------------------+
| listener_sticky_session_type       | Listener Sticky Session Type (insert if Cookie used)          |
+------------------------------------+---------------------------------------------------------------+
| listener_session_sticky            | Listener Session Sticky (true or false)                       |
+------------------------------------+---------------------------------------------------------------+
| healthcheck_connect_port           | Connect Port for the health check                             |
+------------------------------------+---------------------------------------------------------------+
| healthcheck_interval               | Interval for the health check                                 |
+------------------------------------+---------------------------------------------------------------+
| healthcheck_protocol               | Protocol for the health check                                 |
+------------------------------------+---------------------------------------------------------------+
| healthcheck_timeout                | Timeout for the health check                                  |
+------------------------------------+---------------------------------------------------------------+
| healthcheck_uri                    | URI for the health check (HTTP/HTTPS)                         |
+------------------------------------+---------------------------------------------------------------+
| unhealthy_threshold                | Treshold for unhealthy state                                  |
+------------------------------------+---------------------------------------------------------------+
| backend_members                    | Backend member for the ELB Listener                           |
+------------------------------------+---------------------------------------------------------------+

Functions:
^^^^^^^^^^

Create::

    ansible-playbook tenant_yml.yml -e "elb_name=ansible-elb01" -e "localaction=create"

    ansible-playbook tenant_yml.yml -e "elb_name=ansible-elb01" -e "listener_name=ansible-listener01" -e "localaction=listenercreate"

    ansible-playbook tenant_yml.yml -e "elb_name=ansible-elb01" -e "listener_name=ansible-listener01" -e "localaction=healthcheckcreate"

    ansible-playbook tenant_yml.yml -e "elb_name=ansible-elb01" -e "listener_name=ansible-listener01" -e "localaction=backendcreate"

    ./grole otc_elb; ansible-playbook roles.yml -e "localaction=certificatecreate" -e "elb_certificate_name=ansible-cert01" -e "elb_certificate_certificate_file=cert.pem" -e "elb_certificate_key_file=key.pem"


note: similar with ini, and json conf

Show::

    ./grole otc_elb; ansible-playbook roles.yml -e "elb_name=ansible-elb01" -e "localaction=show"

    ./grole otc_elb; ansible-playbook roles.yml -e "elb_name=ansible-elb01" -e "localaction=listenershow"

List::

    ./grole otc_elb; ansible-playbook roles.yml -e "localaction=list"

Delete::

    ./grole otc_elb; ansible-playbook roles.yml -e "elb_name=ansible-elb01" -e "localaction=delete"

    ansible-playbook tenant_yml.yml -e "elb_name=ansible-elb01" -e "localaction=delete"

    ansible-playbook tenant_yml.yml -e "elb_name=ansible-elb01" -e "listener_name=ansible-listener01" -e "localaction=listenerdelete"

    ansible-playbook tenant_yml.yml -e "elb_name=ansible-elb01" -e "listener_name=ansible-listener01" -e "localaction=healthcheckdelete"

    ansible-playbook tenant_yml.yml -e "elb_name=ansible-elb01" -e "listener_name=ansible-listener01" -e "localaction=backenddelete" -e "ecs_name=ansible-test02"

    ./grole otc_elb; ansible-playbook roles.yml -e "localaction=certificatedelete" -e "elb_certificate_name=ansible-cert01"
