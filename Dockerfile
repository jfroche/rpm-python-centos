FROM centos
RUN yum -y install git
RUN yum -y install rpm-build
RUN yum -y install yum-utils
RUN yum -y install rpmdevtools
RUN yum -y install wget
ENV HOME /root
WORKDIR /root/
RUN echo '%_topdir %(echo $HOME)/rpmbuild' > /root/.rpmmacros
RUN mkdir $HOME/rpmbuild
ADD build27.sh /root/build27.sh
ADD python-opt-2.7.6-7.spec /root/rpmbuild/SPECS/python-opt-2.7.6-7.spec
RUN chmod 755 /root/build27.sh
RUN chown root:root /root/rpmbuild/SPECS/python-opt-2.7.6-7.spec
RUN /root/build27.sh
RUN rpm -ivh /root/rpmbuild/RPMS/x86_64/python27-opt-libs-2.7.6-7br.x86_64.rpm
RUN rpm -ivh /root/rpmbuild/RPMS/x86_64/python27-opt-2.7.6-7br.x86_64.rpm
RUN rpm -ivh /root/rpmbuild/RPMS/x86_64/tkinter27-2.7.6-7br.x86_64.rpm
RUN rpm -ivh /root/rpmbuild/RPMS/x86_64/python27-opt-devel-2.7.6-7br.x86_64.rpm
