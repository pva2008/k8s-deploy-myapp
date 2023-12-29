#!/bin/bash
sudo export http_proxy="http://172.16.10.29:8080/";
sudo export https_proxy="http://172.16.10.29:8080/";
sudo export ftp_proxy="http://172.16.10.29:8080/";
sudo export no_proxy="localhost,127.0.0.1,0.0.0.0,10.0.0.0/8,172.16.10.0/24,192.168.155.0/24,192.168.65.0/24";

echo "======================================================";
sudo printenv;
echo "======================================================";
sudo docker info;
echo "======================================================";

sudo  docker build -t pva2008/k8sphp:latest . ;
sudo  docker push  pva2008/k8sphp:latest;
