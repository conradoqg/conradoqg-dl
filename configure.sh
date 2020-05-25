#!/bin/bash

if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi

snap install microk8s --classic --channel=1.18/stable

microk8s status --wait-ready

microk8s enable dns storage ingress metrics-server

microk8s kubectl apply -f ./configure/kubernetes-dashboard-all.yml