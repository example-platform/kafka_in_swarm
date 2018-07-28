#!/bin/bash

# Ref: https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-using-the-convenience-script

echo "Setup Repository"
apt-get update
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

echo "Install docker"
apt-get update
apt-get install docker-ce -y
docker --version

dockerComposeVersion="1.22.0"
echo "Install docker-compose ${dockerComposeVersion}"
curl --silent --show-error\
    -L "https://github.com/docker/compose/releases/download/${dockerComposeVersion}/docker-compose-$(uname -s)-$(uname -m)" -o "/usr/local/bin/docker-compose"
chmod +x /usr/local/bin/docker-compose
docker-compose --version

echo "Run test"
docker run hello-world

exit 0;
