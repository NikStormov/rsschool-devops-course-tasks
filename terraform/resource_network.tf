
## Task 2: Basic Infrastructure Configuration
resource "aws_vpc" "root" {
 cidr_block = "10.0.0.0/16"
 
 tags = {
   Name = "Project VPC"
 }
}
# SUBNETS
resource "aws_subnet" "public_subnets" {
 count      = length(var.public_subnet_cidrs)
 vpc_id     = aws_vpc.root.id
 cidr_block = element(var.public_subnet_cidrs, count.index)
 availability_zone = element(var.azs, count.index)
 
 tags = {
   Name = "Public Subnet for Task 2: ${count.index + 1}"
 }
}
 
resource "aws_subnet" "private_subnets" {
 count      = length(var.private_subnet_cidrs)
 vpc_id     = aws_vpc.root.id
 cidr_block = element(var.private_subnet_cidrs, count.index)
 availability_zone = element(var.azs, count.index)
 
 tags = {
   Name = "Private Subnet for Task 2: ${count.index + 1}"
 }
}
# GATEWAY
resource "aws_internet_gateway" "gateway" {
 vpc_id = aws_vpc.root.id
 
 tags = {
   Name = "Project VPC IG"
 }
}
# ROUTE
resource "aws_route_table" "public_subnet_route" {
 vpc_id = aws_vpc.root.id
 
 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.gateway.id
 }
 
 tags = {
   Name = "2nd Route Table"
 }
}
# PUBLIC SUBNET ASSOCIATION
resource "aws_route_table_association" "public_subnet_asso" {
 count = length(var.public_subnet_cidrs)
 subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
 route_table_id = aws_route_table.public_subnet_route.id
}