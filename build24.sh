#!/bin/bash
set -e -x
VERSION="2.4.6-1"
spectool -R -g /root/rpmbuild/SPECS/python-opt-$VERSION.spec
yum-builddep -y /root/rpmbuild/SPECS/python-opt-$VERSION.spec
cd /root/rpmbuild/SPECS
mv /usr/bin/python /tmp
rpmbuild -ba /root/rpmbuild/SPECS/python-opt-$VERSION.spec
