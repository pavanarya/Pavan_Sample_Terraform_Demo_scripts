provider "aws" {
    region = "us-west-1"
}

resource "aws_instance" "sampleinstance" {
    for_each  = {
        prod = "t2.medium"
        dev = "t2.micro"
    }

    ami = "ami-053ac55bdcfe96e85"
    instance_type =  each.value

    tags = {
        Name = "PavanTest_${each.key}"
    }
}