#!/bin/bash

sudo -E docker build -t pva2008/k8sphp:latest . ;
sudo -E docker push  pva2008/k8sphp:latest;
