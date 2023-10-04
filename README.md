# Kubernetes Interactive Trainer

Welcome to the Kubernetes Interactive Trainer!
This repository is designed to help you learn, manage, deploy, and use Kubernetes more effectively.

## Before Getting Started

### Requirements
Before you begin, make sure you have the following requirements installed:
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
- [minikube](https://minikube.sigs.k8s.io/docs/start/)

### Cheat Sheet
To make your Kubernetes experience smoother, you can use the following shortcuts and environment variables:

- Use `k` as an alias for `kubectl`:
  ```bash
  alias k=kubectl
  complete -o default -F __start_kubectl k
  ```

- Export the `$dr` environment variable for dry-run operations:
  ```bash
  export dr='--dry-run=client -o yaml'
  ```

- To force commands to execute immediately, use `$now`:
  ```bash
  export now='--grace-period=0 --force'
  ```

## How to Navigate in This Repository

Each question in this repository follows this directory structure:

```
question-*
|
├── README.md
├── solution
│   └── solution.sh
├── start.sh
└── test.sh
```

To start answering a question, follow these steps:
1. Run the initializer script:
   ```bash
   ./start.sh
   ```
   This script configures the workspace for the specific question you want to solve.

2. Read the question's README.md file and begin answering it.

If you've completed the question and want to test your answer, execute the script:
```bash
./test.sh
```

If you encounter difficulties and need to view the solution, you can find it at:
```bash
cat ./solution/solution.sh
```

**Note**: 
Make sure your working directory is the question directory. 
When running `start.sh`, any changes made in minikube will be deleted.

## Credits

This project has been developed to help you and others improve their Kubernetes skills. Please attribute the credit to the creator:
- Jonathan Shtadler
  - GitHub: [JonathanS878](https://github.com/JonathanS878)
  - LinkedIn: [Jonathan Shtadler](www.linkedin.com/in/jonathan-shtadler)

If this repository has been helpful to you and you've enjoyed using it, please consider giving it a star on GitHub. Thank you for your support!
