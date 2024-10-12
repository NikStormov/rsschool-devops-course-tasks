resource "aws_security_group" "http" {
  name        = "http_security_group"
  description = "Controls access to http/80"
  vpc_id      = aws_vpc.root.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "ec2" {
  name        = "ec2_security_group"
  description = "Allows inbound access SSH"
  vpc_id      = aws_vpc.root.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

## ACL

resource "aws_network_acl" "network_80" {
  vpc_id     = aws_vpc.root.id
  count      = length(var.public_subnet_cidrs)
  subnet_ids = [element(aws_subnet.public_subnets[*].id, count.index)]

  egress {
    protocol  = "tcp"
    rule_no   = 200
    action    = "allow"
    cidr_block = "10.0.0.0/22"
    from_port = 80
    to_port   = 80
  }

  ingress {
    protocol  = "tcp"
    rule_no   = 100
    action    = "allow"
    cidr_block = "10.0.0.0/22"
    from_port = 80
    to_port   = 80
  }

  tags = {
    Name = "80port"
  }
}

resource "aws_network_acl" "network_443" {
  vpc_id     = aws_vpc.root.id
  count      = length(var.public_subnet_cidrs)
  subnet_ids = [element(aws_subnet.public_subnets[*].id, count.index)]
  egress {
    protocol  = "tcp"
    rule_no   = 200
    action    = "allow"
    cidr_block = "10.0.0.0/22"
    from_port = 443
    to_port   = 443
  }

  ingress {
    protocol  = "tcp"
    rule_no   = 100
    action    = "allow"
    cidr_block = "10.0.0.0/22"
    from_port = 443
    to_port   = 443
  }

  tags = {
    Name = "443port"
  }
}