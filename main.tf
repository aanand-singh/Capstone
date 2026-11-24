terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_iam_user" "project_user" {
  name = var.iam_user_name
}

resource "aws_iam_policy" "s3_read_only" {
  name        = "Project4-S3-ReadOnly-Policy-clouduser"
  description = "Allows read-only access to S3"
  policy      = var.s3_read_policy
}

resource "aws_iam_user_policy_attachment" "attach_policy" {
  user       = aws_iam_user.project_user.name
  policy_arn = aws_iam_policy.s3_read_only.arn
}
