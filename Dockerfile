FROM quay.io/fenicsproject/stable:2017.2.0
MAINTAINER U. Villa

USER root
RUN pip3 install jupyterlab
RUN rm /etc/my_init.d/set-home-permissions.sh

EXPOSE 8888
EXPOSE 8000

USER fenics

# Install hIPPYlib
RUN cd /home/fenics/ && \
    git clone https://github.com/hippylib/hippylib.git && \
    cd hippylib && git checkout tags/2.3.0 -b release-2.3.0 && cd .. &&\
    chmod -R o+rx hippylib

COPY WELCOME $FENICS_HOME/WELCOME

USER root 

WORKDIR /home/fenics/hippylib
