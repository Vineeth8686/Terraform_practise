resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "${var.vpc_name}-Public-RT"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.vpc_name}-Private-RT"
  }
}

resource "aws_route_table_association" "public" {
  count = length(var.public_subnets_cidr)  
  subnet_id      = element(aws_subnet.public.*.id,count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count = length(var.private_subnets_cidr)  
  subnet_id      = element(aws_subnet.private.*.id,count.index)
  route_table_id = aws_route_table.private.id
}


