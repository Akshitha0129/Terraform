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

<img width="1440" alt="Screenshot 2024-12-11 at 4 36 08 PM" src="https://github.com/user-attachments/assets/803ab78c-0b17-4696-a4d2-d3f43b880e2d" />

<img width="1440" alt="Screenshot 2024-12-11 at 4 25 36 PM" src="https://github.com/user-attachments/assets/507a3f11-82a6-4d58-9648-0e2fba1762bd" />

<img width="1440" alt="Screenshot 2024-12-11 at 4 29 57 PM" src="https://github.com/user-attachments/assets/3bde44ec-7bdd-44fa-ab64-d3b593dd521d" />

<img width="1440" alt="Screenshot 2024-12-11 at 4 30 30 PM" src="https://github.com/user-attachments/assets/ffa073c3-4cd6-4aad-b502-c02b496eecd8" />

<img width="1440" alt="Screenshot 2024-12-11 at 4 30 39 PM" src="https://github.com/user-attachments/assets/26e03e21-bd0d-47ed-88e8-2abb4e850dab" />


