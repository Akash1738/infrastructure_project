resource "aws_instance" "server" {

  ami = var.ami

  instance_type = var.instance_type

  subnet_id = aws_subnet.public_subnet.id

  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  key_name = var.key_name

  tags = {

    Name = "Terraform-Server"

  }

}
