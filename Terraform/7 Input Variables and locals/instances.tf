provider "aws" {
  region = "us-west-1"
}

locals {
  prefix = "pavantest"
}

variable "ami" {
  type = string
  description = "AMI type"
  # default = "ami-083f68207d3376798"
}

resource "aws_instance" "sampleInstance" {
  ami = var.ami
  instance_type = "t2.micro"
  tags = {
    Name = "${local.prefix}_Dev"
  }
}

resource "local_file" "samplefile" {
  content = local.prefix
  filename = "sampletext.txt"
}