#!/bin/sh

cd tests

# test otc_ims: show image 
ansible-playbook test.yml
# test ecs list
# ansible-playbook test.yml -e "localaction=list"
# e2e test
# ansible-playbook create_test.yml -e "ecs_name=travis-test01"
# ansible-playbook delete_test.yml -e "ecs_name=travis-test01"
