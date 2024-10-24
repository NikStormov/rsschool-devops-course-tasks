resource "aws_instance" "kube_master" {
  ami                         = lookup(var.ami-ec2-images, var.aws_region)
  instance_type               = var.instance_type
  iam_instance_profile        = aws_iam_instance_profile.session-manager.id
  associate_public_ip_address = false
  security_groups             = [aws_security_group.sg_https_ssh.id]
  key_name                    = aws_key_pair.bastionishe.key_name
  subnet_id                   = aws_subnet.private_subnets[0].id

  tags = {
    Name = "kuber_master/Task3"
  }
}

resource "aws_instance" "kube_worker" {
  ami                         = lookup(var.ami-ec2-images, var.aws_region)
  instance_type               = var.instance_type
  iam_instance_profile        = aws_iam_instance_profile.session-manager.id
  associate_public_ip_address = false
  security_groups             = [aws_security_group.sg_https_ssh.id]
  key_name                    = aws_key_pair.bastionishe.key_name
  subnet_id                   = aws_subnet.private_subnets[0].id

  tags = {
    Name = "kuber_slave/Task3"
  }
}