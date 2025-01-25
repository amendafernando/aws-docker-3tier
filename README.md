# aws-docker-3tier
A multi-container deployment project using Docker, AWS ECR, and Terraform


# Architecture

![image](https://github.com/user-attachments/assets/fc80ad34-7f15-4524-a398-f928ad3f26ab)


## Terraform folder Structure

```
├── config.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── network/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
└── webapp/
    ├── main.tf
    ├── variables.tf
    └── outputs.tf
`
