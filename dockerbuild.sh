#!/bin/bash
sudo -E docker login ;cd  /home/jenkins/ ; ./dockerbuild.sh ; docker push  pva2008/k8sphp:latest ;
