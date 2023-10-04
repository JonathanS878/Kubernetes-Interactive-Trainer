#!/bin/bash

echo "Cleaning and setting things up, please wait."
minikube delete &> /dev/null
minikube start &> /dev/null
echo "Just one more moment."

kubectl config set-context hello &> /dev/null
kubectl config set-context world &> /dev/null