#!/bin/bash

git clone https://github.com/baresip/re.git
cd /root/re/
git checkout v2.3.0
./debian/rules binary && dpkg -i /root/libre_*.deb

cd /root/ && git clone https://github.com/baresip/rem.git
cd /root/rem/
git checkout v2.3.0
./debian/rules binary && dpkg -i /root/librem_*.deb

cd /root/ && git clone https://github.com/baresip/baresip.git
cd /root/baresip
git checkout v2.3.0
cp -r /root/src/g729 modules/
git apply /root/src/g729.patch
git apply /root/src/next_ua.patch
./debian/rules binary

cd /root/ && mkdir src/out && cp *.deb src/out/
