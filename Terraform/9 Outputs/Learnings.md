Outputs is used to display output of results to console

```
output "instance_ip_addr" {
  value = aws_instance.server.private_ip
}
```