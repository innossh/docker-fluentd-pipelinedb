#!/bin/bash
# ref. https://github.com/pipelinedb/pipelinedb/blob/0.8.1/pkg/docker/scripts/install_pipeline.sh

apt-get update
apt-get -f install

# install some basics
apt-get install -y wget nano

# install dependencies
apt-get install -y libxml2 libxml2-dev

wget -q http://www.pipelinedb.com/download/0.8.0/ubuntu14

dpkg --install ubuntu14

useradd -m pipeline -s "/bin/bash"
