#!/bin/bash
set -e -x
VERSION="2.7.8-6"
if [ ! -f python-$VERSION.el6.src.rpm ]; then
    wget -q http://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/source/SRPMS/p/python-$VERSION.fc22.src.rpm -O python-$VERSION.el6.src.rpm
fi
rpm -i python-$VERSION.el6.src.rpm
yum-builddep -y /root/rpmbuild/SPECS/python-opt-$VERSION.spec
rpmbuild --define "dist b${BUILD_NUMBER}r${SVN_REVISION}" -ba /root/rpmbuild/SPECS/python-opt-$VERSION.spec
