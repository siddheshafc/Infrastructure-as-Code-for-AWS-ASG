# Infrastructure as Code using Terraform - AWS
Automating Auto Scaling Group in AWS Using Terraform

This project demonstrates how to deploy an AWS Auto Scaling Group (ASG) behind an Application Load Balancer (ALB) using Terraform. It provisions web servers using an EC2 Launch Template with an Ubuntu 22.04 image, managed by an Auto Scaling Group. The web servers are accessible through an ALB, and they serve a basic webpage using apache httpd.

## Architecture

-   **Auto Scaling Group** with a minimum of 1 instance, maximum of 3 instances.
-   **Launch Template** for EC2 instances running Ubuntu 22.04.
-   **Application Load Balancer** to distribute traffic across EC2 instances.
-   **Security Groups** to allow traffic from the internet on port 80 (HTTP).
-   **Health Checks** for monitoring instance health within the Auto Scaling Group.

![image](https://github.com/user-attachments/assets/e84886a1-61de-40d6-8842-639986fe0506)

### Components Deployed:

-   EC2 instances with Apache web server.
-   Auto Scaling Group with scaling policies.
-   Application Load Balancer.
-   Target Group for load balancing traffic.
-   Security Group to allow HTTP access.
____________________________________________________________
- Plan the Infrastructure
- Initialize Terraform with your cloud provider
- Write provisioning in terraform
- Apply the configuration

![image](https://github.com/user-attachments/assets/1f237d4f-a09e-43e5-a860-8ce432731299)

Succesfully Setup 
![image](https://github.com/user-attachments/assets/b03dcbf8-3b5a-4141-af98-f58a683f2fc3)

## EC2 Instances with the Terraform configured AMI ID
![image](https://github.com/user-attachments/assets/564483c2-fbff-42fc-9ba6-4701fadaa409)

## Public IP and IP shown in browser for the webpage 
![image](https://github.com/user-attachments/assets/c17e48b6-83f6-46a5-b22c-b37e116450ca)
![image](https://github.com/user-attachments/assets/501a645c-bea9-4066-9599-c92436c33df9)

## Auto-Scaling Group
![image](https://github.com/user-attachments/assets/93574770-40a5-4c19-a8d5-aa2f47e15fb7)

## Load Balancer with configured VPC and subnets
![image](https://github.com/user-attachments/assets/897adda1-bbf7-4c00-8736-47dedb0386e9)

## Launch Template
![image](https://github.com/user-attachments/assets/827925ba-5bdc-45c9-ad87-03c23e58d625)

## Target Group
![image](https://github.com/user-attachments/assets/a2310c53-3d6e-4cb4-91f3-92b4362a4122)

## To save AWS costs - Destroy the Infra by terraform destory
![image](https://github.com/user-attachments/assets/2ce76d23-230f-4ae3-9044-ed89591faf55)



