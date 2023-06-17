FROM centos

RUN yum update -y && \
    yum -y install openssh-server

RUN useradd -aG wheel remote_user && \
    echo "1234" | passwd remote_user --stdin && \
    mkhomedir_helper remote_user && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh

COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user -R /home/remote_user/ && \
    chown 600 /home/remote_user/.ssh/authorized_keys

RUN /usr/sbin/sshd-keygen

CMD /usr/sbin/sshd -D