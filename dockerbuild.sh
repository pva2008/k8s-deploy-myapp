#!/bin/bash
sudo -E docker build \
--build-arg http_proxy=http://172.16.10.29:8080/ \
--build-arg https_proxy=http://172.16.10.29:8080/ \
--build-arg no_proxy=localhost,127.0.0.1,0.0.0.0,10.0.0.0/8,172.16.10.0/24,192.168.155.0/24,192.168.65.0/24 \
--build-arg HTTP_PROXY=http://172.16.10.29:8080/ \
--build-arg HTTPS_PROXY=http://172.16.10.29:8080/ \
--build-arg NO_PROXY=localhost,127.0.0.1,0.0.0.0,10.0.0.0/8,172.16.10.0/24,192.168.155.0/24,192.168.65.0/24 \
-t pva2008/k8sphp:latest . ;
sudo  docker push  pva2008/k8sphp:latest ;
