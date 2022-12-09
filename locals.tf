# Environment for infrastructure deployment
locals {
  env      = terraform.workspace
  env_vars = yamldecode(file("${path.module}/env_vars.yaml"))
}