#!/bin/bash

 kubectl patch svc app-service -n default -p '{"spec": {"type": "LoadBalancer", "externalIPs":["192.168.65.205"]}}'