
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "= 3.74.2"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "insfrasrsaweb"
    key    = "networking"
    region = "us-east-1"
  }
}

provider "aws" {
  region     = "us-east-1"
  shared_credentials_file = "Users/elethukosana/.aws/credentials"
}

 module "vpc" {
source =  "git::https://github.com/lelethu-web/rsawtest.git?ref=vpc"
region = var.region
instance_type  = var.instance_type
vpc_cidr_block = var.vpc_cidr_block
public_subnet_ips = var.public_subnet_ips

 }
