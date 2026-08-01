output "instance_public_ip" {

  value = aws_instance.devops_server.public_ip

}

output "instance_id" {

  value = aws_instance.devops_server.id

}

output "vpc_id" {

  value = aws_vpc.devops_vpc.id

}

output "subnet_id" {

  value = aws_subnet.public_subnet.id

}
