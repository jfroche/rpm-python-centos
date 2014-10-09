#!/bin/bash
set -e -x
VERSION="2.0-8"
wget http://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/source/SRPMS/p/python-setuptools-${VERSION}.fc21.src.rpm
rpm -i python-setuptools-${VERSION}.fc21.src.rpm
yum-builddep -y /root/rpmbuild/SPECS/python-opt-setuptools.spec
rpmbuild --define "dist b${BUILD_NUMBER}r${SVN_REVISION}" -ba /root/rpmbuild/SPECS/python-opt-setuptools.spec
