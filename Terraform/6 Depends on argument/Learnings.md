In the first sample cyclic_problamatic_instances.tf lets try to create a cyclic dependencies by using 
`depends_on` argument

Now run `terraform init` , `terraform plan` and we can see `Error: Cycle: aws_subnet.pavan_subnet, aws_instance.PavanSampleInstance, aws_vpc.pavan_vpc`

 lets play with correct example (correct.tf)

 1. We can use `depends_on` and pass array of items

    ```
    depends_on = [
        resourcetype.localname1,
        resourcetype.localname2,
    ]
  ```
  2. Now lets declare a local_file resource (sample1) and then another local_file resource (sample2) respectively in same order
  Now lets add `depends_on` for 1st resource(sample1) to depend on sample2

  Now `terraform init` then `terraform plan` then `terraform apply`. We can observe that sample2 is created first and then sample1. Since sample1 is dependent on sample2

  Note: Plan doesnt show right order of execution but apply will.

  Output of apply:
  ```
    local_file.sample2: Creating...
    local_file.sample2: Creation complete after 0s [id=25751fd70b4b28b119078b0a9e8da302431118e7]
    local_file.sample1: Creating...
    local_file.sample1: Creation complete after 0s [id=d7c16e3266327d8997b8ea55967b4721e6370ab5]
```