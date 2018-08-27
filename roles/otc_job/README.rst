otc_job
=======

OTC role for Job Control. Print out the status and some
messages about OTC jobs, e.g. building ECS.

Variables:
^^^^^^^^^^

+--------------+---------------------------------------------+
| Name         | Description                                 |
+==============+=============================================+
| job_id       | Job ID to lookup                            |
+--------------+---------------------------------------------+

Functions:
^^^^^^^^^^

Create::

    n/a

Read::

    ansible-playbook -e "job_id=1234567890" job.yml

    ./ajob "1234567890"

Update::

    n/a

Delete::

    n/a
