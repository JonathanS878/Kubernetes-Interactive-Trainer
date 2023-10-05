#!/bin/bash


echo "cleaning and setting things up for you."


for namespace in $(kubectl get namespaces -o name 2> /dev/null | grep -vE 'default|kube-system|kube-node-lease|kube-public' | awk -F '/' '{print $2}'); do
    kubectl delete namespace "$namespace" &> /dev/null
    echo "namespace $namespace deleted."
done


for node in $(kubectl get nodes -o name 2> /dev/null | grep -vE 'minikube' | awk -F '/' '{print $2}'); do
    kubectl drain "$node" --ignore-daemonsets --delete-local-data --force &> /dev/null
    kubectl delete node "$node" &> /dev/null
    echo "node $node deleted."
done


for context in $(kubectl config get-contexts -o name 2> /dev/null | grep -vE 'minikube' | awk '{print $1}'); do
    kubectl config delete-context "$context" &> /dev/null
    echo "context $context deleted."
done


if [ "$1" == "delete-dont-start" ]; then 
    minikube delete &> /dev/null
    minikube delete -p kit-node &> /dev/null
else
    is_minikube_node=$(kubectl get nodes -o name 2> /dev/null | awk -F '/' '{print $2}')
    is_minikube_context=$(kubectl config get-contexts -o name 2> /dev/null | grep 'minikube')


    if [ "$is_minikube_node" == "minikube" ] && [ "$is_minikube_context" == "minikube" ]; then 
        echo "minikube is up and running."
    else
        echo "minikube context or node not found. starting minikube."
        minikube delete &> /dev/null
        minikube delete -p kit-node &> /dev/null
        minikube start
    fi
fi


if [ "$1" == "kit-node" ] || [ "$2" == "kit-node" ]; then
    echo "creating kit-node nodes."
    minikube start --nodes 2 -p kit-node 
fi