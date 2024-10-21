
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

# PUBLIC SUBNET ASSOCIATION
resource "aws_route_table_association" "public_subnet_asso" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.public_subnet_route.id
}

resource "aws_route_table_association" "private_subnet_asso" {
  count          = length(var.private_subnet_cidrs)
  subnet_id      = element(aws_subnet.private_subnets[*].id, count.index)
  route_table_id = aws_route_table.private_subnet_route.id
}

## NAT 

resource "aws_eip" "nat" {
  vpc = true
}
resource "aws_nat_gateway" "nat_gateway" {
  # count         = length(aws_subnet.private_subnets)
  allocation_id = aws_eip.nat.id
  subnet_id = aws_subnet.private_subnets[0].id
  # subnet_id     = element(aws_subnet.private_subnets[*].id, count.index)
}