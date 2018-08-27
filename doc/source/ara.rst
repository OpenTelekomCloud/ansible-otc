ARA - Ansible Run Analysis
==========================

ARA records Ansible playbook runs and makes the recorded data
available and intuitive for users and systems. It's described
on `ARA ReadTheDocs <http://ara.readthedocs.io/en/latest/>`__.

ARA doesn't run your playbooks for you: it integrates with Ansible
as a callback plugin wherever it is. In ``playbooks/ara.sh`` is a
workflow described as an example::

    export ANSIBLE_CALLBACK_PLUGINS=$(python -c "import os,ara; print(os.path.dirname(ara.__file__))")/plugins/callbacks
    export ANSIBLE_ACTION_PLUGINS=$(python -c "import os,ara; print(os.path.dirname(ara.__file__))")/plugins/actions
    export ANSIBLE_LIBRARY=$(python -c "import os,ara; print(os.path.dirname(ara.__file__))")/plugins/modules

    ansible-playbook roles.yml
    ara generate html ./html

The ``html`` directory should be accessable within a webbrowser to fits
the best view.
It's also possible to handle this in CI/CD environments,
like .gitlab-ci.yml::

    araweb:
      stage: araweb
      script:
        - tar cfz ara_html.tgz tests/html
      tags:
        - araweb
      artifacts:
        paths:
        - ara_html*.tgz
        expire_in: 1 week


See also on `Github <https://github.com/openstack/ara>`__ and this
`OpenStack SuperUser article <http://superuser.openstack.org/articles/scaling-ara-ansible/>`__.
