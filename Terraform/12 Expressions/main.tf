provider "aws" {
    region = "us-west-1"
}

locals {
    env = "prod"
    version = 20
}

resource "aws_instance" "sampleinstance" {
    ami = "ami-053ac55bdcfe96e85"
    instance_type = "t2.micro"
    tags = {
        Name  = local.env == "prod" ? "Production" : "Dev"
        Version = local.version+1
    }
}