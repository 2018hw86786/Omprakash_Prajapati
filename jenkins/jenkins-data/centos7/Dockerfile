FROM centos
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum update -y && \
    yum -y install epel-release && \
    yum -y install openssh-server
RUN groupadd centos && \
    
    echo "%centos   ALL=(ALL)   NOPASSWD: ALL" | tee -a /etc/sudoers.d/centos

RUN useradd remote_user && \
    echo "remote_user:1234" | chpasswd  && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh && \
    usermod -aG centos remote_user && \

COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user -R /home/remote_user/ && \
    chown 600 /home/remote_user/.ssh/authorized_keys

RUN /usr/sbin/sshd-keygen

CMD /usr/sbin/sshd -D