provider "aws" {
    region = "us-west-1"
}

resource "aws_instance" "sampleinstance" {
    ami = "ami-083f68207d3376798"
    instance_type = "t2.micro"
    #count=2
}

output "complete_output" {
    value = aws_instance.sampleinstance
}

output "instance_arn" {
    value = aws_instance.sampleinstance.arn
}