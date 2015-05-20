#!/bin/bash

cat > /etc/yum.repos.d/rdo-buildsys.repo<<- EOM
[cloud7-openstack-kilo-testing]
name=cloud7-openstack-kilo-testing
baseurl=http://cbs.centos.org/repos/cloud7-openstack-kilo-testing/x86_64/os/
enabled=1
gpgcheck=0

[cloud7-openstack-common-testing]
name=cloud7-openstack-common-testing
baseurl=http://cbs.centos.org/repos/cloud7-openstack-common-testing/x86_64/os/
enabled=1
gpgcheck=0

EOM

yum install centos-release-openstack-kilo
yum install yum-utils &&  yum-config-manager --enable  centos-openstack-kilo-test &&  yum install openstack-packstack && packstack --allinone
if [ $? -eq 0 ]; then 
  echo 'Pass!'
else
  echo 'Fail.'
fi