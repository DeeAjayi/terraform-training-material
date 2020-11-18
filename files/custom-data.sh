#!/bin/bash -ex
sudo apt-get update
sudo apt-get install -y git python-minimal python-pip python-boto software-properties-common ntp unzip build-essential
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install -y ansible
sudo apt-get install -y python3-pip
pip install boto boto3
# git clone https://DeeAjayi:12809b9946e2b1f5b4f6d2000e00cadd405ee722@github.com/DeeAjayi/telios-aws-test /home/devops/demo
# ansible-playbook -c local /home/azureuser/nginx.yaml