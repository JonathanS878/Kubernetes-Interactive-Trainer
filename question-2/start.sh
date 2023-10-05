#!/bin/bash


../.clean_up.sh delete-dont-start kit-node


kubectl config --kubeconfig=config-demo set-context k8s-context1 --cluster=kit-node --namespace=default --user=kit-user &> /dev/null
kubectl config --kubeconfig=config-demo set-context k8s-context2 --cluster=kit-node --namespace=default --user=kit-user &> /dev/null


echo "Ready to go."