#!/bin/bash

sudo rpm -aq|grep yum|xargs sudo rpm -e --nodeps

rpm -aq|grep yum

sudo rpm -ivh http://mirrors.163.com/centos/6/os/x86_64/Packages/python-iniparse-0.3.1-2.1.el6.noarch.rpm
sudo rpm -ivh http://mirrors.163.com/centos/6/os/x86_64/Packages/yum-metadata-parser-1.1.2-16.el6.x86_64.rpm
sudo rpm -ivh http://mirrors.163.com/centos/6/os/x86_64/Packages/yum-3.2.29-40.el6.centos.noarch.rpm
sudo rpm -ivh http://mirrors.163.com/centos/6/os/x86_64/Packages/yum-plugin-fastestmirror-1.1.30-14.el6.noarch.rpm

sudo cp  yum.conf  /etc/yum.conf
sudo cp  CentOS6-Base-163.repo   /etc/yum.repos.d/CentOS6-Base-163.repo

sudo yum clean all
sudo yum makecache

sudo yum groupinstall "Development Tools"

curl -L https://get.rvm.io | bash -s stable
source /home/wuzhong/.rvm/scripts/rvm

rvm remove all
rvm list
rvm reinstall 1.9.3 --with-libyaml-dir=~/.rvm/usr


