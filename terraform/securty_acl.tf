## ACL

resource "aws_network_acl" "network_common_public" {
  vpc_id     = aws_vpc.root.id
  subnet_ids = [aws_subnet.public_subnets[0].id, aws_subnet.public_subnets[1].id]

  dynamic "ingress" {
    for_each = ["0"]
    content {
      protocol   = "-1"
      rule_no    = ingress.key + 1
      action     = "allow"
      cidr_block = "0.0.0.0/0"
      from_port  = ingress.value
      to_port    = ingress.value
    }

  }

  dynamic "egress" {
    for_each = ["0"]
    content {
      protocol   = "-1"
      rule_no    = egress.key + 1
      action     = "allow"
      cidr_block = "0.0.0.0/0"
      from_port  = egress.value
      to_port    = egress.value
    }
  }

  tags = {
    Name = "network_public_22_80_443"
  }
}


resource "aws_network_acl" "network_common_private" {
  vpc_id     = aws_vpc.root.id
  subnet_ids = [aws_subnet.private_subnets[0].id, aws_subnet.private_subnets[1].id]

  dynamic "ingress" {
    for_each = ["0"]
    content {
      protocol   = "-1"
      rule_no    = ingress.key + 1
      action     = "allow"
      cidr_block = "0.0.0.0/0"
      from_port  = ingress.value
      to_port    = ingress.value
    }
  }

  dynamic "egress" {
    for_each = ["0"]
    content {
      protocol   = "-1"
      rule_no    = egress.key + 1
      action     = "allow"
      cidr_block = "0.0.0.0/0"
      from_port  = egress.value
      to_port    = egress.value
    }
  }

  tags = {
    Name = "network_private_22_80_443"
  }
}