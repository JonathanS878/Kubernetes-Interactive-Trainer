#!/bin/bash

counter=0

if [ -e contexts.txt ]; then
    if diff -q <(echo -e "hello\nminikube\nworld") contexts.txt &> /dev/null; then
        counter=$((counter + 1))
    else
        echo "one or more of the contexts is missing in contexts.txt"
    fi
else
    echo "file contexts.txt not found"
fi


if [ -e current_context_kubectl.sh ]; then
    chmod +x current_context_kubectl.sh
    echo "$(./current_context_kubectl.sh)" > temp.txt
    if grep -q "kubectl" current_context_kubectl.sh && diff -q <(echo -e "minikube") temp.txt &> /dev/null; then
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
    line_not_starts_with_k=0
    while IFS= read -r line; do
        first_char="${line:0:1}"
        if [ "$first_char" = "k" ]; then
            line_not_starts_with_k=1
        fi
    done < "current_context_no_kubectl.sh"
    if diff -q <(echo -e "minikube") temp.txt &> /dev/null && [ $line_not_starts_with_k -eq 0 ] && ! grep -q "kubectl" current_context_no_kubectl.sh; then
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