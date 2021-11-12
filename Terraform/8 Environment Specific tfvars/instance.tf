provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "sampleinstance" {
  instance_type = var.instance_type
  ami = var.ami
  tags = var.tags
}