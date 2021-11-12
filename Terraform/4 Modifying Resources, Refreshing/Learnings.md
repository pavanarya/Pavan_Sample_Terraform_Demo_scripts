In this we will see how to modify a resource

1. Create an instance using `aws_instance` 

2. Run `terraform init` , `terraform plan`, `terraform apply`. We can see Ec2 instance created. But unfortunatelt we are not able to name it.

3. Now lets try to update EC2 instance name. We need to pass tags and name. Syntax looks like this
    ```
     tags = {
         Name = "MySampleInstance"
         RandomTag = "This is RandomTag"
     }
    ```
    Name in tag is used to name a Ec2 instance

4. Run command `terraform plan`, we can see `~ update in-place`, so it is planning to update tags of our EC2 resource. Now run command `terraform apply`

5. Login to AWS and change the tag name of instance from AWS console UI. Now run `terraform plan`, we can observe that terraform will identify the change we made in AWS console and fetches that and now It will try to update back to old value in .tf file

That is because terraform is trying to refresh (get state from AWS based on Resourceid) and it will update the state and then performs update. We can see
 `aws_instance.sampleinstance1: Refreshing state... [id=i-0744782883c79f002]` as 1st line
 This is again happening because of same id in statefile and aws resource in cli

 6. Now lets repeat above process but this time lets run `terraform plan -refresh=false` using refresh false. Now we can see "No changes", this is because terraform is just comparing statefile and .tf file and since nothing is changed here, it is not able to detect any changes. Refresh= false will prevent terraform from fetching details from AWS in realtime

7. Note: If we try to update some properties then it might delete and recreate an instance unlike an update. I am trying to update ami, in this case it will delete and recreate instance