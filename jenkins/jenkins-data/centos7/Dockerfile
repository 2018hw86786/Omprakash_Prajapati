FROM centos:7
# RUN cd /etc/yum.repos.d/
# RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
# RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum update -y && \
    yum -y install epel-release && \
    yum -y install openssh-server

RUN useradd remote_user && \
    echo "remote_user:1234" | chpasswd  && \
    echo "root:1234" | chpasswd  && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh    

COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user -R /home/remote_user/ && \
    chown 600 /home/remote_user/.ssh/authorized_keys

RUN /usr/sbin/sshd-keygen

RUN yum -y install mysql

RUN curl -O https://bootstrap.pypa.io/pip/2.7/get-pip.py && \ 
    python get-pip.py && \
    pip install awscli --upgrade

#RUN groupadd -r devops && useradd -r -g devops mysql

CMD /usr/sbin/sshd -D

# https://bootstrap.pypa.io/pip/2.7/get-pip.py  https://bootstrap.pypa.io/get-pip.py