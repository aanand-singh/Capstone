# Project 4: IAM User Automation with Terraform

## Project Overview
This project automates the creation of an AWS IAM user and assigns S3 read-only permissions using Terraform.

## Technologies Used
- AWS IAM
- Terraform
- AWS CLI
- Ubuntu

## Project Structure
- `main.tf` – AWS provider and IAM resources
- `variables.tf` – Terraform input variables and S3 policy
- `outputs.tf` – IAM user and policy outputs
- `.gitignore` – Excludes sensitive Terraform files
- `test-evidence/` – Screenshots of project testing

## Resources Created
1. IAM user: project4-s3-reader-clouduser
2. IAM policy: Project4-S3-ReadOnly-Policy-clouduser
3. IAM user policy attachment

## Permissions
The IAM policy allows:
- s3:ListAllMyBuckets
- s3:GetBucketLocation
- s3:ListBucket
- s3:GetObject

## Deployment Commands
```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

## Verification Commands
```bash
terraform state list
aws iam get-user --user-name project4-s3-reader-clouduser
aws iam list-attached-user-policies --user-name project4-s3-reader-clouduser
```

## Test Evidence
Three screenshots demonstrate Terraform validation, deployment, and AWS IAM verification.

## Deployment Result
Successfully created three AWS resources using Terraform.
