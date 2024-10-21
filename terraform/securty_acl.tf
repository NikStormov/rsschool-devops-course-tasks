## ACL

resource "aws_network_acl" "network_common_public" {
  vpc_id     = aws_vpc.root.id
  count      = length(var.public_subnet_cidrs)
  subnet_ids = [element(aws_subnet.public_subnets[*].id, count.index)]

  dynamic "ingress" {
    for_each = ["22", "80", "443"]
    content {
      protocol   = "tcp"
      rule_no    = ingress.key + 1
      action     = "allow"
      cidr_block = "0.0.0.0/0"
      from_port  = ingress.value
      to_port    = ingress.value
    }

  }

  dynamic "egress" {
    for_each = ["22", "80", "443"]
    content {
      protocol   = "tcp"
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
  count      = length(var.private_subnet_cidrs)
  subnet_ids = [element(aws_subnet.private_subnets[*].id, count.index)]

  dynamic "ingress" {
    for_each = ["22", "80", "443"]
    content {
      protocol   = "tcp"
      rule_no    = ingress.key + 1
      action     = "allow"
      cidr_block = "0.0.0.0/0"
      from_port  = ingress.value
      to_port    = ingress.value
    }

  }

  dynamic "egress" {
    for_each = ["22", "80", "443"]
    content {
      protocol   = "tcp"
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