FROM airdock/oracle-jdk:jdk-1.7

#Copying OpenSplice to image
ADD OpenSpliceDDS6.4/install/HDE /opt/HDE

# Setting environment variables
ENV OSPL_HOME /opt/HDE/x86_64.linux
ENV PATH $OSPL_HOME/bin:$PATH
ENV LD_LIBRARY_PATH $OSPL_HOME/lib${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH
ENV CPATH $OSPL_HOME/include:$OSPL_HOME/include/sys:${CPATH}
ENV OSPL_URI file://$OSPL_HOME/etc/config/ospl.xml