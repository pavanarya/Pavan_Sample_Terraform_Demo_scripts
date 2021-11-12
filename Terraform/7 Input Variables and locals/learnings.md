In the sample lets try to create a variable and use it in resource creation

Variable creation syntax

```
variable "variable_name" {
    type = <<type of variable and it supports string,number,bool,list,map>>  -- This is optional
    description = "Some description"  -- This is optional
    default = "default value" -- This is optional
}
```

************  Providing Input from console  *******************

Now run `terraform init` , `terraform plan` and we can see terraform prompting for `variable_name`, if we dont provide default value. Or else it will take default value


************  Providing Input from terraform.tfvars  *******************
So If we dont want to pass inputs from console, we can use the option of `terraform.tfvars`
Declare value for variable as follows:
    <<variable_name>> = "value"

Note: It works with only files in this format
    1. `terraform.tfvars`
    2. `<<random_name>>.auto.tfvars`
    3. `<<random_name>>.tfvars` this doesnt work

Note: It is always a best practice to add `variables` to a seperate tf file instead of declaring them in actual tf file where we have all infrastructure creation logic


************ Locals *****************
Locals are also like variables but they are specific to module. We will see difference between Locals and Variables once we see modules

    ```
    locals {
        prefix = "pavantest"
    }
    ```

    We can access local variable values as `local.<variable_name>`
    In case if we want to do string interpolation then "${local.prefix}_Dev"