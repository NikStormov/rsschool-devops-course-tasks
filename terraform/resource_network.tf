
## Task 2: Basic Infrastructure Configuration
resource "aws_vpc" "root" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Project VPC"
  }
}
# SUBNETS
resource "aws_subnet" "public_subnets" {
  map_public_ip_on_launch = true
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.root.id
  cidr_block              = element(var.public_subnet_cidrs, count.index)
  availability_zone       = element(var.azs, count.index)

  tags = {
    Name = "Public Subnet for Task 2: ${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnets" {
  map_public_ip_on_launch = false
  count                   = length(var.private_subnet_cidrs)
  vpc_id                  = aws_vpc.root.id
  cidr_block              = element(var.private_subnet_cidrs, count.index)
  availability_zone       = element(var.azs, count.index)

  tags = {
    Name = "Private Subnet for Task 2: ${count.index + 1}"
  }
}

## NAT 

resource "aws_eip" "nat" {
  vpc = true
}
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnets[0].id
}