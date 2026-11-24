# Project 3: EC2 State Monitoring with CloudWatch Alarm

Terraform deploys an EC2 instance, an SNS email topic, and a CloudWatch
alarm that fires when average CPU exceeds 70% for 2 minutes.
The instance generates CPU load on boot to trigger the alarm.

## Usage
terraform init
terraform apply
