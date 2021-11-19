provider "aws" {
    region = "us-west-1"
}

# data "aws_subnet" "defaultSubnet" {
#    tags = {
#      "Name" = "Default_SubNet1"
#    }
# }

# data "aws_subnet" "defaultSubnet" {
#     filter {
#       name = "vpc-id"
#       values = ["vpc-c17bb5a5"]
#     }
# }

data "aws_subnet" "subnet" {
    filter {
        name = "tag:Name"
        values = ["Default_SubNet1"]
    }
}

output "awssubnet_details" {
    value = data.aws_subnet.subnet
}

resource "aws_instance" "sampleinstance" {
    ami = "ami-053ac55bdcfe96e85"
    instance_type = "t2.micro"
    subnet_id = data.aws_subnet.subnet.id
}
