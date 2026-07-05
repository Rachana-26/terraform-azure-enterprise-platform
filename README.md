# Azure Enterprise Infrastructure Platform using Terraform

## Project Overview

This project demonstrates the design and implementation of a production-style Azure infrastructure using Terraform with reusable modules, remote state management, and Azure DevOps CI/CD.

The infrastructure follows Infrastructure as Code (IaC) principles to automate Azure resource provisioning, improve consistency, reduce manual effort, and provide a scalable foundation for enterprise cloud environments.

---

# Business Problem

Many organizations provision Azure resources manually through the Azure Portal.

This approach leads to:

- Inconsistent deployments
- Human configuration errors
- No version control
- Slow infrastructure provisioning
- Difficult disaster recovery
- Security risks from manual secret handling
- Lack of standardized infrastructure

---

# Solution

A reusable Terraform platform was built to automate Azure infrastructure deployment.

The solution provides:

- Modular Infrastructure as Code
- Remote Terraform State
- Secure Secret Management
- Multiple Virtual Machine Deployment
- Azure Container Registry
- Managed Identity
- Azure Key Vault
- Azure Monitoring
- Backup
- Azure DevOps CI/CD Pipeline

---

# Technologies Used

## Cloud

- Microsoft Azure

## Infrastructure as Code

- Terraform

## CI/CD

- Azure DevOps Pipelines

## Source Control

- Git
- GitHub

## Operating System

- Ubuntu Linux

## Container Platform

- Docker

## Container Registry

- Azure Container Registry (ACR)

## Security

- Azure Key Vault
- Managed Identity

## Monitoring

- Azure Monitor
- Log Analytics Workspace

## Backup

- Azure Recovery Services Vault

---
## Architecture diagram

<img width="1536" height="1024" alt="terraform mult infra" src="https://github.com/user-attachments/assets/d12b89ad-8538-43a3-818d-ecb26d8183fc" />


# Features Implemented

## Infrastructure

- Azure Resource Group
- Virtual Network
- Subnets
- Network Security Groups

## Compute

- Ubuntu Linux Virtual Machine
- Finance Linux Virtual Machine
- Automatic Docker installation

## Storage

- Azure Storage Account

## Security

- Azure Key Vault
- Managed Identity
- Key Vault Secret

## Containers

- Azure Container Registry
- Docker

## Monitoring

- Log Analytics Workspace
- Azure Monitor Alerts

## Backup

- Recovery Services Vault
- VM Backup Policy

## CI/CD

Azure DevOps Pipeline performs:

- Terraform Init
- Terraform Format Validation
- Terraform Validate
- Terraform Plan

Infrastructure deployment is validated before any changes are applied.

---

# Multiple VM Deployment

The project demonstrates reusable Terraform modules.

Instead of duplicating Terraform code, the existing Compute Module was reused to provision an additional Finance Virtual Machine.

This follows enterprise Infrastructure as Code best practices.

---

# Remote Backend

Terraform state is stored remotely using an Azure Storage Account.

Benefits:

- Centralized state management
- Team collaboration
- State locking
- Version consistency

---

# Security

The project implements several Azure security best practices.

- Managed Identity
- Azure Key Vault
- Secrets stored in Key Vault
- Remote Backend
- Infrastructure Version Control

> **Note:** Hardcoded secrets are used only for demonstration purposes during development. In a production environment, secrets should be supplied through Azure DevOps secure pipeline variables or Azure Key Vault rather than committed to source code.

---

# CI/CD Pipeline

Azure DevOps Pipeline executes the following stages:

1. Install Terraform
2. Terraform Init
3. Terraform Format Check
4. Terraform Validate
5. Terraform Plan

This ensures infrastructure quality before deployment.

---
# Validation

Infrastructure was validated using:

```bash
terraform fmt
terraform validate
terraform plan
terraform apply
```

Azure DevOps Pipeline was also used to validate the Terraform configuration.

---

# Screenshots

Add screenshots of:

- Azure Resource Group
<img width="1045" height="780" alt="image" src="https://github.com/user-attachments/assets/15121efa-6cc2-4c83-9ed1-6fc2dee78782" />

- Virtual Machines
- <img width="1431" height="348" alt="image" src="https://github.com/user-attachments/assets/88249117-4cb4-445e-9078-4d4d0e1eecd0" />

- Azure DevOps Pipeline
- 
- GitHub Repository

---

# Future Enhancements

- Azure Kubernetes Service (AKS)
- Private Endpoints
- Application Gateway
- Azure Firewall
- Diagnostic Settings
- Auto Scaling
- Multiple Environments (Dev/Test/Prod)
- Terraform Workspaces
- GitHub Actions Pipeline

---
# Author

**Rachana AB **

Azure Cloud Engineer | Terraform | Azure DevOps | Infrastructure as Code

GitHub: 

LinkedIn:
