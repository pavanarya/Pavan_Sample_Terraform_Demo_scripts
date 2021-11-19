variable "env" {
  type=string
}

terraform {
  backend "s3" {
    bucket = "pavanterraformtest"
    key    = "prod/terraform.state"
    region = "us-west-1"
  }
}

provider "aws"{
    region = "us-west-1"
}

resource "aws_instance" "sample_instance" {
  ami = "ami-053ac55bdcfe96e85"
  instance_type = "t2.micro"
  tags = {
    "Name" = "PavaTest"
  }
}