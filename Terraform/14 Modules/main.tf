module "prod_instance" {
    source = "./instances_with_vpc/"
    instance_type = "t2.micro"
    environment = "production"
}

output "print_instance_id_from_module" {
    value = module.prod_instance.aws_instance_id
}