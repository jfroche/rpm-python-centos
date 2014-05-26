#!/bin/bash
set -e -x
VERSION="2.7.6-7"
if [ ! -f python-$VERSION.el6.src.rpm ]; then
    wget -q http://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/source/SRPMS/p/python-$VERSION.fc21.src.rpm -O python-$VERSION.el6.src.rpm
fi
rpm -i python-$VERSION.el6.src.rpm
rpmbuild --define "dist b${BUILD_NUMBER}r${SVN_REVISION}" -ba python-opt-$VERSION.spec
