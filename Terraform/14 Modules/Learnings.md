Modules are a way to group repeated code into a separate reusable component.

We can call a module 

```
module <<localname>> {
    source = "path_to_module_folder"
    variable_as_argument = value
}
```

`variable_as_argument` are nothing but Incase if we declare a variable in module we can pass value to that variable insoide module using this  variable_as_argument, variable_as_argument is nothing but name of variable

Returning Data from Module:
===========================

In module declare `output` block and we can access that output block property in this format

module:
```
output `output_value` {
    value = <<some_resource_type>>.<<localname>>.<<output_argument>>
}

```

In some.tf

```
module <<localname>> {
    source = "path_to_module_folder"
    variable_as_argument = value
}

output "print_instance_id_from_module" {
    value = module.<<modulelocalname>>.<<output_exposed_from_module>>
}
```