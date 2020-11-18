#!/bin/bash -ex
sudo apt-get update
sudo apt-get install -y git python-minimal python-pip python-boto software-properties-common ntp unzip build-essential
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install -y ansible
sudo apt-get install -y python3-pip
pip install boto boto3
git clone https://DeeAjayi:f46a2af83aef3632d21f8cebd1e78f51f598ac22@github.com/DeeAjayi/telios-aws-test /home/devops/demo
ansible-playbook -c local /home/devops/demo/install-nginx.yaml