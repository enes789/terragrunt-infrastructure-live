terraform {
  source ="github.com/enes789/terragrunt-infrastructure-modules.git//vpc?ref=v0.0.1"
}

# Indicate what region to deploy the resources into
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "us-east-1"
}
EOF
}

inputs = {
  name      = "vpc"
  stage     = "dev"
  namespace = "retool"
  
  cidr    = "30.0.0.0/16"
  azs = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["30.0.1.0/24", "30.0.2.0/24", "30.0.3.0/24"]
  public_subnets  = ["30.0.101.0/24", "30.0.102.0/24", "30.0.103.0/24"]
}