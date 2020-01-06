#!/bin/bash

if [ ! -d "/etc/python-virtualenvs" ] 
then
    echo 'Creating folder /etc/python-virtualenvs'
    mkdir "/etc/python-virtualenvs"
fi

echo 'Installing PIP Python 3'
apt install -y python3-pip

echo 'Installing system dependencies (root)'
pip3 install virtualenv

if [ ! -d "/etc/python-virtualenvs/ansible" ] 
then
    echo 'Creating virtualenv'
    virtualenv --system-site-packages -p /usr/bin/python3 /etc/python-virtualenvs/ansible
fi

echo 'Installing dependencies on virtualenvs'
/etc/python-virtualenvs/ansible/bin/pip install -r requirements.txt

echo 'Creating Symlink'
ln -sfn /etc/python-virtualenvs/ansible/bin/ansible /usr/local/bin/ansible
ln -sfn /etc/python-virtualenvs/ansible/bin/ansible-playbook /usr/local/bin/ansible-playbook