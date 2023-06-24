FROM jenkins/jenkins 

USER root

# RUN curl -O https://bootstrap.pypa.io/pip/2.7/get-pip.py && \ 
#     python get-pip.py && \
#     pip install ansible --upgrade
RUN apt update 
RUN apt-get -y install python3 python3-pip
RUN curl -O https://bootstrap.pypa.io/pip/3.6/get-pip.py && \ 
    python3 get-pip.py && \
    pip3 install ansible --upgrade


USER jenkins 