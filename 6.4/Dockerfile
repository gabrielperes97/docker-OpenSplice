FROM airdock/oracle-jdk:jdk-1.8 as builder

# Installing dependences to build
RUN apt-get update && apt-get install -y \
	build-essential \
	gawk \
	bison \
	flex \
	doxygen \
	wget \
	git

# Fixing error on build cppgen
RUN mkdir -p /usr/lib/bfd-plugins && \
	ln -s /usr/lib/gcc/x86_64-linux-gnu/4.9.2/liblto_plugin.so /usr/lib/bfd-plugins/

# Downloading sources
RUN cd /mnt && \
	wget http://dev.opensplice.org/releases/downloads/releases/OpenSpliceDDSV6.4.140407OSS-src.tar.gz && \
	tar -xzvf OpenSpliceDDSV6.4.140407OSS-src.tar.gz

# Building
WORKDIR /mnt/OpenSpliceDDS6.4
RUN ./configure x86_64.linux-release 
RUN chmod +x envs-x86_64.linux-release.sh
RUN echo "\n make \n cd install \n make" >> envs-x86_64.linux-release.sh
RUN ./envs-x86_64.linux-release.sh


FROM airdock/oracle-jdk:jdk-1.8

#Copying OpenSplice from builder
COPY --from=builder /mnt/OpenSpliceDDS6.4/install/HDE /opt/HDE

# Setting environment variables
ENV OSPL_HOME /opt/HDE/x86_64.linux
ENV PATH $OSPL_HOME/bin:$PATH
ENV LD_LIBRARY_PATH $OSPL_HOME/lib${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH
ENV CPATH $OSPL_HOME/include:$OSPL_HOME/include/sys:${CPATH}
ENV OSPL_URI file://$OSPL_HOME/etc/config/ospl.xml