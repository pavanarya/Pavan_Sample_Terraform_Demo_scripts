# provider "aws" {
#   region = "us-west-2"
# }

resource "aws_instance" "instance1" {
  ami = "ami-083f68207d3376798"
  instance_type = "t2.micro"
}