resource "aws_vpc" "our_own_vpc" {
 cidr_block = var.vpc_cidr_block
 tags = {
   Name = "Own VPC"
 }
}

resource "aws_subnet" "public_subnets" {
vpc_id     = aws_vpc.our_own_vpc.id
cidr_block = var.public_subnet_ips
tags = {
 Name = "Public Subnet"
}
}

resource "aws_instance" "ec2" {
  ami           = "ami-053b0d53c279acc90" 
  instance_type = "t2.micro"

  tags = {
    Name = "rsawebvm"
  }
}
