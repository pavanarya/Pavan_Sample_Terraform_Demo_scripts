In this part, we will see how to create a basic aws resource like an instance 

Requirements:
** AWS cli is supposed to be configured with AWS Accesskey and secret key. Make sure your secret keys have appropriate permissions to create various items **

Note: We can also hardcode AWS credentials in .tf file (like below) but it is not recommended
```
provider "aws" {
  region     = "us-west-2"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}
```


1. TO know the type of resource, let go to terraform documentation, we can search like "Aws terraform instance"

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#argument-reference

2. Lets not worry about all the details. But our focus should be on Arguments and name of resource type
    -- Name of the resource type for Aws instance. So it is `aws_instance`
    -- In the arguments we should pass all mandatory items and can use optional arguments based on need

3. So required arguments are `ami`,`instance_type` (since we are not having any launch template, it is mandatory)
4. We can get AMI details from AWS UI (https://us-west-1.console.aws.amazon.com/ec2/v2/home?region=us-west-1#LaunchInstanceWizard:)

5. Note: localname is just specific to terraform, this will not name your instance or resource on AWS


Playing with this:

1. Create just resource without provider initially and run `terraform apply`. We can observe that terraform throws an exception stating "Could not load plugin"
So thats the reason why we need to run `terraform init` which will download required providers/plugins

2. Did you notice when we ran `terraform init`, it downloaded aws plugin, thats because it identifies resource provider from resourceType in resource syntax (in this case `aws_instance`)

3. Run `terraform plan`, It asks for region. But if we want to pass it by default, we can configure provider using `provider` element

```
provider "aws" {
  region = "us-west-2"
}
```
4. Run `terraform apply` and we can see instance created in AWS

5. Observe the statefile and we can see different details related to instance

6. Run `terraform apply` and we can see there are no changes since it is using statefile

7. `terraform destroy` this will destroy the instance on aws

8. Run `terraform apply` and we can see instance created in AWS. 
    Now run `terraform apply` again and we can see no change in result.Now delete statefile and run again `terraform apply`. Now we can see that a new instance is created all together. 
    So this show significance of statefile. So if a statefile is missing, we loose imp data. So thats the reason why we need to persist statefiles
