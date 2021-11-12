Main theme of this sample is to learn how to create multiple resources with single or multiple .tf files

1. Lets create 2 resources in same .tf file

2. resource localname should be unique

3. `terraform init`

    -- This will download any providers from terraform registry that are needed for creating resources

    -- We can observe `hashicorp/local v2.1.0` is downloaded and installed

    -- https://registry.terraform.io/providers/hashicorp/local/latest

    -- So Terraform registry is a place where we can find Terraform authorized, 3rd Party modules related to various providers and helps us in creating resources

4. `terraform plan`

    -- This will give us the plan that Terraform is going to use to create our resource

    -- `+` create
       `-` destroy
       `-/+` replace (destroy and then create, or vice-versa if create-before-destroy is used)
       `~` update in-place
       `<=` read

5. Observe various properties in the plan, here we can see plan for 2 files. Since our main.tf has 2 resources

6. `terraform apply`

Playing with this:

1. Add a new resource and run `terraform apply`. Now we can observe that it is adding only 1 resource (most recently added) and not even touching sample and sample2 resources. This is because it is using statefile and since we dont have any changes in sample and sample2 resources, Terraform is ignoring them.

2. Delete all exiting resources that were create by `main.tf` by running `terraform destroy`. Create a new terraform file, may be we can name it as `child.tf` and add logic to create a file resource inside this child.tf
   Now run `terraform apply`. So we can observe that terraform is creating resources from all .tf files in that folder. So ideally it is treating them as a single file.

3. Delete all exiting resources that were create by `main.tf` by running `terraform destroy`. Create a new terraform file, may be we can name it as `child.tf` and add logic to create a file resource inside this child.tf. Just try to add same localname that is present in main.tf in child.tf
   Now run `terraform apply`. So we can observe that terraform is throwing an error stating resource localnames are not unique. 
   So ideally Terraform is clubbing all tf files at runtime and considering it as a single file
