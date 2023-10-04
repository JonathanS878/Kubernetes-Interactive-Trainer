# Question 1

## Initiate
Run the initiation script:
```bash
./start.sh
```

## The Task

In this question, you have access to multiple clusters from your main terminal through the `kubectl` context. Follow these steps to complete the task:

1. Write the names of all those contexts into a file named `contexts.txt`.

2. Write a command to display the current context into a file named `current_context_kubectl.sh`. The command should use `kubectl`.

3. Write a second command doing the same thing into a file named `current_context_no_kubectl.sh`, but without the use of `kubectl`.

## Validation

To validate that you have successfully completed the question, run the script:
```bash
./test.sh
```