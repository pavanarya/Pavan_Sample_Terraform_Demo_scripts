Resource Meta arguments are arguments which we pass to resource. These are not specific to provider like AWS related. But they provide some extra capabilities like 

https://www.terraform.io/docs/language/meta-arguments/depends_on.html

Terraform Meta Arguments:

1. depends_on ( we saw this in 6th example folder(Depends on argument))
2. `count` : If we want to create multiple resources with same configuration. Fo example If we want to create a pool of servers in a load balanced env, we can use this
3. `for_each` : we can loop on key value pairs and use them using `each` keyword


If we create multiple instances using count or foreach, we can access them using index like
 ` resourcetype.<<localname>>[index].output_argument`
  ` resourcetype.<<localname>>[*].output_argument` --  This will output array
  
  
  Also If we want to delete a specific instance...Lets say using count , I created 3 instances. But I want to delete one among them then i can use
`terraform destroy -target="resourcetype.<<localname>>[index]"`
