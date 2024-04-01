
output "vpc_id" {
 value       = aws_default_vpc.maruti.id
 description = "vpc id prit here"
}

output "security_group" {
 value       = aws_security_group.my_sg.id
 description = "security_group name print here"
}
