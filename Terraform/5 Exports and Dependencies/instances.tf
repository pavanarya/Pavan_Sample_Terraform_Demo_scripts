provider "aws" {
  region = "us-west-1"
}

resource "aws_vpc" "pavan_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "PavanSampleVPC"
    }
}

resource "aws_subnet" "pavan_subnet" {
  cidr_block = "10.0.0.0/16"
  tags = {
        Name = "PavanSampleSubnet"
    }
  vpc_id = aws_vpc.pavan_vpc.id
}

resource "aws_instance" "PavanSampleInstance" {
  instance_type = "t2.micro"
  ami = "ami-083f68207d3376798"
  tags = {
    "Name" = "PavanSampleInstance"
  }
  subnet_id = aws_subnet.pavan_subnet.id
}