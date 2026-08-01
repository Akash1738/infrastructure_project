resource "aws_instance" "devops_server" {

  ami = var.ami

  instance_type = var.instance_type

  subnet_id = aws_subnet.public_subnet.id

  key_name = var.key_name

  associate_public_ip_address = true

  vpc_security_group_ids = [

    aws_security_group.devops_sg.id

  ]

  tags = {

    Name = "DevOps-Server"

  }

}
