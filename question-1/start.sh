#!/bin/bash


../.clean_up.sh


kubectl config set-context hello &> /dev/null
kubectl config set-context world &> /dev/null


echo "Ready to go."