# Question 2

## Initiate
Run the initiation script:
```bash
./start.sh
```

## The Task

1. Set the current Kubernetes context to `k8s-context1`.

2. Create a single pod in a YAML configuration file named `pod.yaml`. This pod should use the image `httpd:2.4.57-alpine3.18` and be placed in the `default` namespace.

3. The pod should have the name `kit-pod`, and the container inside it should be named `kit-pod-container`.

4. Ensure that this pod is scheduled exclusively on the master node. Do not modify the labels of any nodes.

## Validation

To validate that you have successfully completed the question, run the script:
```bash
./test.sh
```