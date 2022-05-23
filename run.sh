#!/bin/bash
docker build -t baresip_builder ./
docker run -v $(pwd)/src:/root/src baresip_builder
g729=$(apt-cache search libbcg729)
if ( g729 ) then
	apt-get install -y libbcg729
else
	apt-get install -y wget 
	wget http://launchpadlibrarian.net/510443271/libbcg729-0_1.1.1-2_amd64.deb
	dpkg -i libbcg729-0_1.1.1-2_amd64.deb
	rm -f libbcg729-0_1.1.1-2_amd64.deb
fi
dpkg -i src/out/libre_*.deb
dpkg -i src/out/librem_*.deb
dpkg -i src/out/baresip_*.deb

