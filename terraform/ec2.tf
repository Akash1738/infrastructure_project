resource "aws_instance" "server" {

  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.devops_sg.id]
  key_name               = var.key_name

  associate_public_ip_address = true

  tags = {
    Name = "Terraform-Server"
  }
}
