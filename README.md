# DevOps Fundamentals

A structured collection of hands-on DevOps exercises 
covering Docker, Terraform, and Linux — built while 
learning core DevOps concepts from the ground up.

## Structure
```
devops-fundamentals/
├── docker-multistage/        # Multi-stage Docker build examples
├── linux-troubleshooting/    # Common Linux issues and fixes
├── terraform-aws-ec2/        # Launch EC2 instance with Terraform
├── terraform-aws-vpc/        # Create VPC with Terraform
└── terraform-hello-world/    # First Terraform configuration
```

## What each section covers

### `docker-multistage/`
Multi-stage Dockerfile patterns that produce smaller, 
cleaner images by separating build and runtime stages.

### `linux-troubleshooting/`
Notes and scripts for common Linux server issues — 
permissions, process management, networking, disk space.

### `terraform-aws-ec2/`
Terraform configuration to launch an EC2 instance with 
correct security group, key pair, and IAM settings.

### `terraform-aws-vpc/`
Creates a VPC with public subnet, internet gateway, 
and route table using Terraform.

### `terraform-hello-world/`
First Terraform project — understanding providers, 
resources, state, and plan/apply workflow.

## Why this repo exists
Learning DevOps tools by reading docs only goes so far. 
Every folder here is a concept I worked through hands-on 
until I understood not just how it works but why it's 
designed that way.

## Tech Stack
- Terraform
- Docker
- AWS (EC2, VPC)
- Linux (Ubuntu)
