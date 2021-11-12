Till now we saw independent resources. But now lets try to create dependent resources.
For example, I'll create a VPC and use that VPC ID to create a subnet and use that subnetId in the process of EC2 creation

Till previous demos, we are EC2 resource by default uses "Default VPC"

1. https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

2. We can use `aws_vpc` resource and `cidr_block` is required

3. In the "Attributes Reference" section of above url, we can see output properties of a resource and there we can see `id`. Now lets use that `id` in subnet creation

4. To use an output property from one resource in another, follow this syntax
    `resourceType.localname.outputProperty`
    So that translates to 
    `aws_vpc.pavan_vpc.id`

5. Subnet creation:
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet#attributes-reference

6. We can see instance documentation
    https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

    Now finally we will create an instance with this subnet id as `aws_subnet.pavan_subnet.id`

7. Now run `terraform init` , `terraform plan`, `terraform apply`

8. Terraform decides the order of execution based on the dependent arguments
9. When we use `terraform destroy` it will follow reverse order of dependencies