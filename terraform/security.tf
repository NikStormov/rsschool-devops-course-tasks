resource "aws_security_group" "sg_https_ssh" {
  name        = "dynamic_security_group"
  description = "Controls access to 443/80/22 ports"
  vpc_id      = aws_vpc.root.id

  dynamic "ingress" {
    for_each = ["0"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}