# aws-docker-3tier
A multi-container deployment project using Docker, AWS ECR, and Terraform


# Architecture

![image](https://github.com/user-attachments/assets/fc80ad34-7f15-4524-a398-f928ad3f26ab)


# GitHub Actions

Github actions are set up to create a workflow to checkout code create docker containers and push it to relevent repos when merge it into main branch

## Workflow

1. Update the code in seperate branch
2. create a PR to main branch
3. When approved run the GitHub workflow
4. It will checkout the main branch to cloud9
5. It will create Dockers accordingly
6. It will push the dockers to relevent ECR repos

#### Kubernates intergration will be done in the `containerized-app-on-kubernetes` repository

https://github.com/amendafernando/containerized-app-on-kubernetes.git

@author Amenda Fernando Thommage


