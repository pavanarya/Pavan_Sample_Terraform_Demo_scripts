Main theme of this sample is to learn what a resource, statefile and other basics

1. Install terrafom

2. Terraform files usually end with .tf , .tfvars, .tfstate extensions

3. Syntax of a basic resource

    recource resource_type localname {
        property_name = property_value
    }

    Note: resourcetype = provider_resourceType
    Example:  aws_instance (this will create an instance in aws and AWS is provider here)

3. So here I am trying to create a local file... SO provider is "local" and file is my resource

4. local resource name is "samplefile" , this is useful in current file

5. `terraform init`

    -- This will download any providers from terraform registry that are needed for creating resources

    -- We can observe `hashicorp/local v2.1.0` is downloaded and installed

    -- https://registry.terraform.io/providers/hashicorp/local/latest

    -- So Terraform registry is a place where we can find Terraform authorized, 3rd Party modules related to various providers and helps us in creating resources

6. `terraform plan`

    -- This will give us the plan that Terraform is going to use to create our resource

    -- `+` create
       `-` destroy
       `-/+` replace (destroy and then create, or vice-versa if create-before-destroy is used)
       `~` update in-place
       `<=` read

7. Observe various properties in the plan

8. `terraform apply`
    -- This will actually create a resource. In this case it is a local file
    -- Observe the output

9. `terraform.tfstate`
    -- Whenever a resource is created, terraform stores the state of the resource created in this statefile.

    -- How is this useful? So it helps in maintaining state of all resources that were created.

       - So If we make a change to the created resource outside of terraform, then terraform will use this state file to identify the change and act accordingly

10. `terraform destroy` This will destroy resources that were created. We can observe destroy operation in plan. Also observe the statefile, text file resource is deleted

Playing with this:

1. re-run `terraform apply`  and we can observe no changes are made. This is because, it is using statefile and it is matching here

2. Modify resource in tf file and run `terraform apply`. So in this case, it is destroying the existing file and recreating a new one with updated text content ("This is a sample file changed")

3. Change the content of resource and content in statefile to match (But already created resource has a different value).. Old file on disk,statefile has text content "This is a sample file changed". But I am changing statefile content and .tf content to a new value ("This is a sample file")

So here we are cheating :) Terraform to think like content on file(disk) and content in .tf resource is same using statefile, though text in file(disk) is different. So It doesnt physically check for file content but it is depending on statefile as a proof for truth. And hence there is no change when we did apply

4. Delete the statefile and run `terraform apply`. We observe a new resource is created. Since in this case, it is a physical file. It is overwritten but we can see plan and observe it is add operation. In case, if it is a AWS resource, It might create a duplicate resource
