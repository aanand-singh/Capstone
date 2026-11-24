provider "aws" { region = "ap-south-1" }

data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.al2023.id
  instance_type = "t3.micro"
  monitoring    = true
  tags          = { Name = "cpu-monitor-demo" }

  user_data = <<-EOF
    #!/bin/bash
    sleep 120
    for i in 1 2; do timeout 900 yes > /dev/null & done
    sleep 900
  EOF
}

resource "aws_sns_topic" "alerts" { name = "cpu-alerts" }

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = "anand.al.singh@accenture.com"
}

resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "ec2-cpu-high"
  namespace           = "AWS/EC2"
  metric_name         = "CPUUtilization"
  statistic           = "Average"
  period              = 60
  evaluation_periods  = 2
  threshold           = 70
  comparison_operator = "GreaterThanThreshold"
  dimensions          = { InstanceId = aws_instance.web.id }
  alarm_actions       = [aws_sns_topic.alerts.arn]
}
