output "iam_user_name" {
  value = aws_iam_user.project_user.name
}

output "iam_user_arn" {
  value = aws_iam_user.project_user.arn
}

output "iam_policy_arn" {
  value = aws_iam_policy.s3_read_only.arn
}
