FROM airdock/oracle-jdk:jdk-1.8

#Copying OpenSplice to image
WORKDIR /opt/
RUN apt-get update && apt-get install -y wget
RUN wget https://github.com/ADLINK-IST/opensplice/releases/download/OSPL_V6_7_171127OSS_RELEASE/PXXX-VortexOpenSplice-6.7.171127OSS-HDE-x86_64.linux-gcc5.4.0-glibc2.23-installer.tar.gz \
	&& tar -xzvf PXXX-VortexOpenSplice-6.7.171127OSS-HDE-x86_64.linux-gcc5.4.0-glibc2.23-installer.tar.gz \
	&& rm PXXX-VortexOpenSplice-6.7.171127OSS-HDE-x86_64.linux-gcc5.4.0-glibc2.23-installer.tar.gz

WORKDIR /root/

# Setting environment variables
ENV OSPL_HOME /opt/HDE/x86_64.linux
ENV PATH $OSPL_HOME/bin:$PATH
ENV LD_LIBRARY_PATH $OSPL_HOME/lib${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH
ENV CPATH $OSPL_HOME/include:$OSPL_HOME/include/sys:${CPATH}
ENV OSPL_URI file://$OSPL_HOME/etc/config/ospl.xml