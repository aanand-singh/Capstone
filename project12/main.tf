terraform {
  required_version = ">= 1.5.0"
}

resource "terraform_data" "demo" {
  input = "hello-ci"
}

output "demo_value" {
  value = terraform_data.demo.input
}
