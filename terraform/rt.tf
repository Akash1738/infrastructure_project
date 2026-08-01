resource "aws_route_table" "public_rt" {

  vpc_id = vpc-02f7a4c516baee7d2

  route {

    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public-RT"
  }
}

resource "aws_route_table_association" "public_assoc" {

  subnet_id      = subnet-096e5fffa72b98f19

  route_table_id = aws_route_table.public_rt.id
}
