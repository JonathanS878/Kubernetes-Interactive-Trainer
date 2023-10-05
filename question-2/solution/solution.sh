#!/bin/bash


kubectl config use-context k8s-context1

echo "$(kubectl run -n default kit-pod --image=httpd:2.4.57-alpine3.18 --dry-run=client -o yaml)" > ../pod.yaml
#add nodeName: kit-node, and fix the other fields:
# apiVersion: v1
# kind: Pod
# metadata:
#   creationTimestamp: null
#   labels:
#     run: kit-pod
#   name: kit-pod
#   namespace: default
# spec:
#   nodeName: kit-node
#   containers:
#   - image: httpd:2.4.57-alpine3.18
#     name: kit-pod-container
#     resources: {}
#   dnsPolicy: ClusterFirst
#   restartPolicy: Always
# status: {}