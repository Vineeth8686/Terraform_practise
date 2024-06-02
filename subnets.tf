resource "aws_subnet" "public" {
  count = length(var.public_subnets_cidr)  
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.public_subnets_cidr,count.index)
  availability_zone = element(var.availability_zone,count.index)  
  tags = {
    Name = "${var.vpc_name}-Public Subnet-${count.index+1}"
  }
}

resource "aws_subnet" "private" {
  count = length(var.private_subnets_cidr)  
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.private_subnets_cidr,count.index)
  availability_zone = element(var.availability_zone,count.index)  
  tags = {
    Name = "${var.vpc_name}-Private Subnet-${count.index+1}"
  }
}