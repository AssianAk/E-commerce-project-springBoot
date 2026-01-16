terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr          = var.vpc_cidr
  vpc_name          = var.vpc_name
  environment       = var.environment
  public_subnet_1   = var.public_subnet_1
  availability_zone = var.availability_zone
}

module "ec2" {
  source = "../../modules/ec2"

  ami_id          = var.ami_id          # ✅ FIXED
  subnet_id       = module.vpc.public_subnet_id
  key_name        = var.key_name
  instance_type   = var.instance_type
  environment     = var.environment     # ✅ FIXED
  instance_name   = "dev-ec2"
}
