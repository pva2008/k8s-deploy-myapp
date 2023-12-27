#!/bin/bash
sudo -E docker login;
sudo -E cd  /home/jenkins/;
sudo -E ./dockerbuild.sh;
sudo -E docker push  pva2008/k8sphp:latest ;
