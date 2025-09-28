# Mission 5: Building a Custom AWS Network (VPC) with Terraform

## Objective

This project demonstrates how to provision a foundational AWS network infrastructure using Terraform, the industry-standard tool for Infrastructure as Code (IaC).

The primary goal was to define and create a custom Virtual Private Cloud (VPC), moving beyond local machine resources and into a real-world cloud environment. The entire lifecycle of the infrastructure—creation, verification, and destruction—was managed through code.

## Infrastructure Created

The `main.tf` file defines a simple but secure network foundation consisting of the following AWS resources:
* **VPC:** The main isolated network container with a `10.0.0.0/16` CIDR block.
* **Public Subnet:** A subnet within the VPC with a `10.0.1.0/24` CIDR block, designated for public-facing resources.
* **Internet Gateway:** The component that allows communication between the VPC and the internet.
* **Route Table:** The "road map" that directs traffic from the public subnet to the Internet Gateway.
* **Route Table Association:** The rule that links our public subnet to the route table.

## Core Workflow and Verification

The standard Terraform three-step workflow was used to manage the infrastructure:

1.  **`terraform init`**: Prepared the workspace by downloading the AWS provider.
2.  **`terraform plan`**: Generated a safe "dry run" to show the 5 resources that would be created.
3.  **`terraform apply`**: Executed the plan, building the network components in the AWS account.

The successful creation of these resources was verified both via the Terraform CLI (`terraform state list`) and by visually inspecting the new VPC and its components in the AWS Management Console.

Finally, `terraform destroy` was used to cleanly tear down all created resources, demonstrating the complete lifecycle management and ensuring no costs were incurred.
