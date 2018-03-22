#!/bin/bash

# Dependencies build-essential gawk bison flex doxygen git java 

if [ ! -f OpenSpliceDDSV6.4.140407OSS-src.tar.gz ]
then 
	wget http://dev.opensplice.org/releases/downloads/releases/OpenSpliceDDSV6.4.140407OSS-src.tar.gz
	if  [ $? -ne 0 ] 
	then
		echo "Download Failed"
		exit 1
	fi
fi
if [ ! -d OpenSpliceDDS6.4 ]
then
	tar -xzvf OpenSpliceDDSV6.4.140407OSS-src.tar.gz
	if  [ $? -ne 0 ] 
	then
		echo "Uncompression Failed"
		exit 2
	fi
fi
cd OpenSpliceDDS6.4
if  [ $? -ne 0 ] 
then
	echo "Error while entering directory OpenSpliceDDS6.4"
	exit 5
fi
source configure x86_64.linux-release 
if  [ $? -ne 0 ] 
then
	echo "Configure Failed"
	exit 3
fi
make
if  [ $? -ne 0 ] 
then
	echo "First make Failed"
	exit 4
fi
cd install
if  [ $? -ne 0 ] 
then
	echo "Error while entering directory OpenSpliceDDS6.4/install"
	exit 5
fi
make
if  [ $? -ne 0 ] 
then
	echo "Second make Failed"
	exit 6
fi
exit 0