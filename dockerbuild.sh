#!/bin/bash


echo "======================================================";

#//sudo -E printenv;
echo "======================================================";
#sudo -E docker info;
echo "======================================================";

sudo  docker build -t pva2008/k8sphp:latest . ;
sudo  docker push  pva2008/k8sphp:latest;
