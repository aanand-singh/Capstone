terraform {
  required_version = ">= 1.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

resource "local_file" "deployment_marker" {
  filename = "${path.module}/deployed.txt"
  content  = "GitOps infra deployed via PR merge\n"
}

output "marker_file" {
  value = local_file.deployment_marker.filename
}
