#!/bin/bash

counter=0

if [ -e contexts.txt ]; then
    if diff -q <(echo -e "hello\nminikube\nworld") contexts.txt; then
        counter=$((counter + 1))
    else
        echo "one of the contexts is missing in contexts.txt"
    fi
else
    echo "file contexts.txt not found"
fi

if [ -e current_context_kubectl.sh ]; then
    chmod +x current_context_kubectl.sh
    echo "$(./current_context_kubectl.sh)" > temp.txt
    if grep -q "kubectl" current_context_kubectl.sh && diff -q <(echo -e "minikube") temp.txt; then
        counter=$((counter + 1))
    else
        echo "the command in current_context_kubectl.sh is not valid"
    fi
    rm temp.txt &> /dev/null
else
    echo "file current_context_kubectl.sh not found"
fi

if [ -e current_context_no_kubectl.sh ]; then
    chmod +x current_context_no_kubectl.sh
    ./current_context_no_kubectl.sh > temp.txt
    if diff -q <(echo -e "minikube") temp.txt && ! grep -q "kubectl" current_context_no_kubectl.sh; then
        counter=$((counter + 1))
    else
        echo "the command in current_context_no_kubectl.sh is not valid"
    fi
    rm temp.txt &> /dev/null
else
    echo "file current_context_no_kubectl.sh not found"
fi

if [ "$counter" -eq 3 ]; then
    echo "Success! You may move on to the next question."
fi