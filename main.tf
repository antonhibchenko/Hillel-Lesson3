//project main file
provider "aws" {
  region  = "us-east-1"
}

locals {
  common_tags = {
    Purpose = "Terraform guru :D"
    Project = "Hillel"
  }
}

data "aws_ami" "hille_arterm_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["*-httpd-hillel"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["650252608304"] # AWS
}

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  tags     = local.common_tags
}

module "ec2" {
  source = "./modules/ec2"
  vpc_id = module.vpc.vpc_id
  instance_type = var.instance_type
  ami_id = var.ami_filter ? data.aws_ami.hille_arterm_ami.id : var.ami_id
  subnet_id = module.vpc.private_networks[1]
  eip_attach = var.eip_attach
  volume_size = var.volume_size
  aws_key_pair = var.aws_key_pair
}