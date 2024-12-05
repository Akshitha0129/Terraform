# Infrastructure Automation with Terraform

## Description
This project automates the provisioning of cloud infrastructure using Terraform. It includes resources such as Virtual Private Cloud (VPC), subnets, internet gateways, route tables, and other networking and compute services. The infrastructure is defined as code to ensure consistency and version control.

## Project Structure
.

├── main.tf         
├── variables.tf    
├── outputs.tf      
├── provider.tf      
├── userdata.sh      

## Prerequisites
1. Terraform: Install Terraform.
2. AWS CLI: Install the AWS CLI and configure your credentials (aws configure).
3. An AWS account with IAM permissions for managing VPC, subnets, and EC2 instances.

## Outputs

1. VPC ID: The ID of the created VPC.
2. Public Subnet IDs: IDs of public subnets.
3. Internet Gateway ID: ID of the internet gateway.
