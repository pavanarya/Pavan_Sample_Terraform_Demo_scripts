provider "aws" {
  region = "us-west-1"
}

variable "environment" {
    type = string
}

variable "instance_type" {
    type = string
}

resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "${var.environment}_VPC"
    }
}

resource "aws_subnet" "subnet" {
  cidr_block = "10.0.0.0/16"
  tags = {
        Name = "${var.environment}_Subnet"
    }
  vpc_id = aws_vpc.vpc.id
}

resource "aws_instance" "instance" {
  instance_type = var.instance_type
  ami = "ami-083f68207d3376798"
  tags = {
    "Name" = "${var.environment}_Instance"
  }
  subnet_id = aws_subnet.subnet.id
}

output "aws_instance_id" {
    value = aws_instance.instance.id
}