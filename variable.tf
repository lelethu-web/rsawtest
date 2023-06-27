variable "instance_type" {
  description = "ec2 instance for the assesement"
  default     = "t2.micro"
}

variable "region" {
  description = "AWS regions"
  default     = "us-east-1"
}

variable "ami" {
  description = "ami id"
  default     = "ami-0c94855ba95c71c99"
}



#variable "access_key"{
#    description = "AWS KEY"
#}

#variable "secret_key" {
  
 # description = "AWS SECRET"
#}