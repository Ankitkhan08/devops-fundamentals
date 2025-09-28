# Mission 6: Launching an AWS EC2 Instance with Terraform

## Objective

This project demonstrates a complete Infrastructure as Code (IaC) workflow for deploying a virtual web server on Amazon Web Services (AWS).

Starting with the custom network (VPC) foundation from the previous mission, this Terraform configuration was expanded to automatically provision a new EC2 instance, configure its network security, and bootstrap it with a simple web page. The entire process, from defining the infrastructure to launching the server, is managed through code.

## Architecture Diagram

The following infrastructure was created in the `us-east-1` region:

 +---------------------------------+
 |      AWS Cloud (us-east-1)      |
 |                                 |
 |  +---------------------------+  |
<------>|      VPC (10.0.0.0/16)    |  |
Internet|                           |  |
|  | +-----------------------+ |  |
|  | |  Public Subnet        | |  |
|  | |  (10.0.1.0/24)        | |  |
|  | |                       | |  |
|  | |   +---------------+   | |  |
|  | |   | EC2 Instance  |   | |  |
|  | |   | (Web Server)  |<--+ |  |--- Security Group (Firewall)
|  | |   +---------------+   | |  |    (Allows Port 80 & 22)
|  | |                       | |  |
|  | +-----------------------+ |  |
|  +-------------^-------------+  |
|                |                |
+----------------|-----------------+
|
Internet Gateway & Route Table


## Key Resources Created
* **VPC, Subnet, Internet Gateway, Route Table:** The foundational networking components.
* **Security Group:** A virtual firewall to control traffic to the server.
* **EC2 Instance:** The `t2.micro` virtual server running Ubuntu 22.04.
* **Terraform Output:** A defined output to display the server's public IP address upon creation.

## New Terraform Concepts Learned

This project introduced several key Terraform and AWS concepts:

#### 1. Security Groups (`aws_security_group`)
A Security Group acts as a stateful virtual firewall for an EC2 instance. It controls all incoming (`ingress`) and outgoing (`egress`) traffic. In this project, we configured ingress rules to allow HTTP (port 80) and SSH (port 22) traffic from any IP address (`0.0.0.0/0`), enabling public access to our web server.

#### 2. EC2 Instance with `user_data`
The `aws_instance` resource is used to define and launch a virtual server. A powerful feature used here is the `user_data` argument. This allows for passing a shell script that runs automatically on the instance's first boot. We used this to update the server's packages and install/start an Apache web server, automating the entire setup process.

#### 3. Data Sources (`data "aws_ami"`)
Instead of hardcoding a specific AMI ID (which can become outdated), a `data` source was used to dynamically search for the most recent Ubuntu 22.04 AMI at runtime. This makes the code more robust and future-proof.

#### 4. Outputs (`output`)
The `output` block was used to instruct Terraform to print a specific piece of information after a successful `apply`. In this case, we configured it to display the `public_ip` of the newly created `aws_instance`, making it easy to access and verify.

