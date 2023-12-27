#!/bin/bash
sudo -E  cd  /home/jenkins/ ; ./dockerbuild.sh ; docker push  pva2008/k8sphp:latest ;
