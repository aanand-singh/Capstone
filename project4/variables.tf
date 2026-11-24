variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "iam_user_name" {
  description = "Name of the IAM user"
  type        = string
  default     = "project4-s3-reader-clouduser"
}

variable "s3_read_policy" {
  description = "S3 read-only IAM policy"
  type        = string

  default = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:ListAllMyBuckets",
        "s3:GetBucketLocation",
        "s3:ListBucket",
        "s3:GetObject"
      ],
      "Resource": [
        "*",
        "arn:aws:s3:::*",
        "arn:aws:s3:::*/*"
      ]
    }
  ]
}
EOF
}
