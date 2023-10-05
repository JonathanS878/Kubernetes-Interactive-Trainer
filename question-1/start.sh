#!/bin/bash


echo "Cleaning and setting things up for you."
minikube delete &> /dev/null
echo "Just one more moment please, I feel you I can't wait to start too!"
minikube start &> /dev/null


kubectl config set-context hello &> /dev/null
kubectl config set-context world &> /dev/null


echo "Ready to go."