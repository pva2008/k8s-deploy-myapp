#!/bin/bash

#export DOCKER_BUILDKIT=0;
#export COMPOSE_DOCKER_CLI_BUILD=0;
echo "======================================================";

#//sudo -E printenv;
echo "======================================================";
#sudo -E docker info;
echo "======================================================";

sudo  docker build -t pva2008/k8sphp:latest . ;
sudo  docker push  pva2008/k8sphp:latest;
