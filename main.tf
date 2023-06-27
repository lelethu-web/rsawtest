
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
  //access_key = "var.access_key"
  //secret_key = "var.secret_key"
  region     = "us-east-1"
  //shared_credentials_file = ["~/.aws/config"]
  shared_credentials_file = "Users/elethukosana/.aws/credentials"

//"/Users/elethukosana/.aws/credentials"  
}

resource "aws_instance" "ec2" {
  ami           = "ami-053b0d53c279acc90" 
  instance_type = "t2.micro"

  tags = {
    Name = "rsawebvm"
  }
}