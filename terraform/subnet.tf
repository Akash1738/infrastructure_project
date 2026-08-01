resource "aws_subnet" "public_subnet" {

  vpc_id                  = vpc-02f7a4c516baee7d2
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet"
  }
}
