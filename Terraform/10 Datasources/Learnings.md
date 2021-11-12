Datasources provide an ability to fetch data from 3rd party / external sources

Data sources allow Terraform use information defined outside of Terraform, defined by another separate Terraform configuration, or modified by functions.

Just like resourceTypes, datasources are defined in terraform and there are many filtering techniques 

For example, If I want to use an existing subnet which was created and create an EC2 instances, I can use datasource to fetch subnet and use it is Ec2 creation

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet

```
To fetch using subnetid

data "aws_subnet" "selected" {
  id = var.subnet_id
}

To fetch using a tag name or other custom fields, we need to use filters
data "aws_subnet" "selected" {
  filter  {
    name   = "tag:Name"
    values = ["Default_SubNet1"]
  }
}


```

Note: Lets say If multiple items match this criteria then it throws an exception
`Error: multiple subnets matched; use additional constraints to reduce matches to a single subnet`

Various attributes in filters, we can get them from AWS
https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeSubnets.html