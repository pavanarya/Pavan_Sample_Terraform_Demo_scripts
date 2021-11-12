provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "sampleinstance1" {
  ami = "ami-053ac55bdcfe96e85"
  instance_type = "t2.micro"
#   tags = {
#          Name = "MySampleInstance"
#          RandomTag = "This is RandomTag"
#   }
}