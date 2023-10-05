#!/bin/bash

# Define the expected values
expected_pod_name="kit-pod"
expected_container_name="kit-pod-container"
expected_namespace="default"
expected_image_name="httpd:2.4.57-alpine3.18"
expected_context="k8s-context1"
expected_node_name="kit-node"

# Function to check if a pod meets the requirements
check_pod() {
    local pod_name="$1"
    local container_name="$2"
    local namespace="$3"
    local image_name="$4"
    local context="$5"
    local node_name="$6"

    # Check pod attributes
    if kubectl get pod "$pod_name" -n "$namespace" -o jsonpath="{.spec.containers[0].name}" | grep -q "$container_name" &&
       kubectl get pod "$pod_name" -n "$namespace" -o jsonpath="{.spec.containers[0].image}" | grep -q "$image_name" &&
       kubectl get pod "$pod_name" -n "$namespace" -o jsonpath="{.spec.nodeName}" | grep -q "$node_name" &&
       [[ "$(kubectl config current-context)" == "$context" ]]; then
        echo "Pod meets all requirements."
    else
        echo "Pod does not meet all requirements."
    fi
}

# Run the check_pod function
check_pod "$expected_pod_name" "$expected_container_name" "$expected_namespace" \
          "$expected_image_name" "$expected_context" "$expected_node_name"
