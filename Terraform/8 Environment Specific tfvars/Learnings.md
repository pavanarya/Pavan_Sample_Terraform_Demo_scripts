In the last example, we saw how to pass terraform variables. But if we declare our variables in either `terraform.tfvars` or `dev.auto.tfvars` and `prod.auto.tfvars` they will both be taken

So now lets see how we can use environment specific tfvars

1. We can create different files like `prod.tfvars` or `dev.tfvars` ..
2. Since these files are not auto recognized, we need to pass them at the time of execution
 by passing -var-file

 `terraform apply -var-file="dev.tfvars"`

 3. To destroy again we need to pass same file 
    `terraform destroy -var-file="dev.tfvars"`

    Or we need to pass same variable values