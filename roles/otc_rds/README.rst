otc_rds
=======

OTC role for RDS.

Variables:
^^^^^^^^^^

+-------------------------+-----------------------------------------------------------+
| Name                    | Description                                               |
+=========================+===========================================================+
| rds_version_id          | ID of the RDS version (to use to fetch flavor             |
+-------------------------+-----------------------------------------------------------+
| rds_name                | Name of RDS instance                                      |
+-------------------------+-----------------------------------------------------------+
| rds_type                | RDS type (MySQL or PostgreSQL)                            |
+-------------------------+-----------------------------------------------------------+
| rds_version             | RDS version (i.e. 5.6.7)                                  |
+-------------------------+-----------------------------------------------------------+
| rds_flavor_id           | ID of RDS flavor                                          |
+-------------------------+-----------------------------------------------------------+
| rds_volume_type         | Type of RDS volume (COMMON (SATA) or ULTRAHIGH (SSD))     |
+-------------------------+-----------------------------------------------------------+
| rds_volume_size         | Size of RDS volume (100 GB smallest)                      |
+-------------------------+-----------------------------------------------------------+
| rds_port                | RDS port                                                  |
+-------------------------+-----------------------------------------------------------+
| rds_ram                 | Memory for RDS in MB                                      |
+-------------------------+-----------------------------------------------------------+
| rds_availability_zone   | RDS Availability Zone ( i.e. eu_de-01)                    |
+-------------------------+-----------------------------------------------------------+
| rds_secgroup_name       | RDS Security Group                                        |
+-------------------------+-----------------------------------------------------------+
| rds_subnet_name         | RDS subnet                                                |
+-------------------------+-----------------------------------------------------------+
| rds_backup_time         | Start time of backup (i.e. 01:00:00)                      |
+-------------------------+-----------------------------------------------------------+
| rds_backup_id           | ID of RDS backup (required for restore                    |
+-------------------------+-----------------------------------------------------------+
| rds_backup_name         | Name if manual generated backup                           |
+-------------------------+-----------------------------------------------------------+
| rds_backup_time         | Start time of backup (i.e. 01:00:00)                      |
+-------------------------+-----------------------------------------------------------+
| rds_backup_days         | Keep days of backups (between 1-35, 0 = disabled)         |
+-------------------------+-----------------------------------------------------------+
| rds_restore_time        | Timestamp of RDS restore                                  |
+-------------------------+-----------------------------------------------------------+
| rds_ha_enabled          | RDS HA enabled or not (true or false)                     |
+-------------------------+-----------------------------------------------------------+
| rds_ha_replication_mode | RDS replication mode (async or semisync for MySQL,        |
|                         | async or sync for PostgreSQL)                             |
+-------------------------+-----------------------------------------------------------+
| rds_root_password       | RDS root password                                         |
+-------------------------+-----------------------------------------------------------+
| errorlog_startdate      | Start date of error log (i.e. 2018-04-05+23:59)           |
+-------------------------+-----------------------------------------------------------+
| errorlog_enddate        | End date of error log (i.e. 2018-05-05+23:59)             |
+-------------------------+-----------------------------------------------------------+
| errorlog_curpage        | Pages per error log (default 1)                           |
+-------------------------+-----------------------------------------------------------+
| errorlog_perpage        | Error message per page (1-100, default 100)               |
+-------------------------+-----------------------------------------------------------+
| slowlog_type            | Type of slowlog (INSERT, UPDATE, SELECT, DELETE, CREATE)  |
+-------------------------+-----------------------------------------------------------+


Functions:
^^^^^^^^^^

Version::

     ./grole otc_rds; ansible-playbook roles.yml -e "localaction=version"

Flavor::

    ./grole otc_rds; ansible-playbook roles.yml -e "localaction=flavor rds_type=MySQL rds_version=5.7.20"

List::

    ./grole otc_rds; ansible-playbook roles.yml -e "localaction=list"

Show::

    ./grole otc_rds; ansible-playbook roles.yml -e "localaction=show rds_name=ansible-mysql01_node0"

Note: configured rds_name will automatically append with number of instances starting from ``_node0``

Resize Volume::

    ./grole otc_rds; ansible-playbook roles.yml -e "localaction=resize_volume  rds_name=ansible-mysql01_node0 rds_volume_size=120"

Resize Flavor::

    ./grole otc_rds; ansible-playbook roles.yml -e "localaction=resize_flavor  rds_name=ansible-mysql01_node0 rds_ram=8196  rds_type=MySQL rds_version=5.7.20 rds_ha_enabled=false"

Reboot an instance::

    ./grole otc_rds; ansible-playbook roles.yml -e "localaction=reboot rds_name=ansible-mysql01_node0"

Delete an instance::

    ./grole otc_rds; ansible-playbook roles.yml -e "localaction=delete rds_name=ansible-mysql01_node0"

List backups::

    ./grole otc_rds; ansible-playbook roles.yml -e "localaction=backups"

Create a backup::

    ./grole otc_rds; ansible-playbook roles.yml -e "localaction=create_backup rds_name=ansible-mysql01_node0 rds_backup_name=my_backup_mysql01_1"

Delete a backup::

    ./grole otc_rds; ansible-playbook roles.yml -e "localaction=delete_backup rds_backup_id=04eabf2523c8445e80faa0452c991e87br01"

Note: grab the rds_backup_id from ``List backups``

Restore current DB::

    ./grole otc_rds; ansible-playbook roles.yml -e "localaction=restore_backup_current rds_backup_id=04eabf2523c8445e80faa0452c991e87br01 rds_restore_time='2018-05-13 19:30:01' rds_name=ansible-mysql01_node0" 

Restore to a new instance::

    ./grole otc_rds; ansible-playbook roles.yml -e "localaction=restore_backup_new rds_backup_id=04eabf2523c8445e80faa0452c991e87br01" rds_backup_instance_id=a5c2ec42d49f41a8b1738f054d88fbc2no01 rds_restore_time='2018-05-13 19:30:01' rds_name=ansible-mysql02 rds_volume_size=120  rds_ram=4096 rds_type=MySQL rds_version=5.7.20 rds_ha_enabled=false" 

Note: grab the different IDs for example from ``List backups``

Query error log::

    ./grole otc_rds; ansible-playbook roles.yml -e "localaction=errorlog rds_name=ansible-mysql01_node0 errorlog_startdate=2018-05-01+00:00 errorlog_enddate=2018-05-13+18:00"

Note: You can only query error logs generated within a month.

Query slow query log::

    ./grole otc_rds; ansible-playbook roles.yml -e "localaction=slowlog rds_name=ansible-mysql01_node0"

    ./grole otc_rds; ansible-playbook roles.yml -e "localaction=slowlog rds_name=ansible-mysql01_node0 slowlog_type=SELECT"

Note: if ``slowlog_type`` is not set, all types will be queried
