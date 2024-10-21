## GATEWAY
resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.root.id

  tags = {
    Name = "Project VPC IG"
  }
}