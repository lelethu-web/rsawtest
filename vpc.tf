#resource "aws_vpc" "our_own_vpc" {
 #cidr_block = var.vpc_cidr_block
 #tags = {
 #  Name = "Own VPC"
 #}
#}

#resource "aws_subnet" "public_subnets" {
#vpc_id     = aws_vpc.our_own_vpc.id
#cidr_block = var.public_subnet_ips
#tags = {
# Name = "Public Subnet"
#}
#}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
 # subnet_id  =  aws_subnet.public_subnets.id

  tags = {
    Name = "rsawebvm"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y epel-release",
      "sudo yum install -y ansible",
    ]
  }
}
