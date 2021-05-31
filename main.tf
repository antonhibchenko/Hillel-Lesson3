//project main file
provider "aws" {
  region  = "eu-central-1"
}

locals {
  common_tags = {
    Purpose = "Terraform guru :D"
    Project = "Hillel"
  }
}

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  tags     = local.common_tags
}
