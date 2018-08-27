#!/bin/sh

export ANSIBLE_CALLBACK_PLUGINS=$(python -c "import os,ara; print(os.path.dirname(ara.__file__))")/plugins/callbacks
export ANSIBLE_ACTION_PLUGINS=$(python -c "import os,ara; print(os.path.dirname(ara.__file__))")/plugins/actions
export ANSIBLE_LIBRARY=$(python -c "import os,ara; print(os.path.dirname(ara.__file__))")/plugins/modules

ansible-playbook roles.yml
ara generate html ./html
