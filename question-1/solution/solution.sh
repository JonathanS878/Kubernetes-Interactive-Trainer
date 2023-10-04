#!/bin/bash

#1.
echo "$(kubectl config get-contexts -o name)" > ./contexts.txt

#2.
echo "kubectl config current-context" > ./current_context_kubectl.sh

#3.
echo "cat ~/.kube/config | grep current-context | sed 's/current-context: //'" > ./current_context_no_kubectl.sh