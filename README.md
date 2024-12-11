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

Initialize with terraform init, preview changes with terraform plan, and apply configurations with terraform apply to provision resources.



<img width="1440" alt="Screenshot 2024-12-11 at 4 36 08 PM" src="https://github.com/user-attachments/assets/1071f768-0c0a-4115-a0fb-1c24e72eb492" />



![Screenshot 2024-12-11 at 4 29 57 PM](https://github.com/user-attachments/assets/c649baf7-0015-4efe-9541-77d826137b2a)



<img width="1440" alt="Screenshot 2024-12-11 at 4 30 39 PM" src="https://github.com/user-attachments/assets/903c8560-34c9-4764-b977-ff47838dccfa" />



<img width="1440" alt="Screenshot 2024-12-11 at 4 30 30 PM" src="https://github.com/user-attachments/assets/da841f7b-3291-4a2a-8940-d64651a1b60d" />
