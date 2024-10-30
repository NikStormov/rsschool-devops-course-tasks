resource "aws_instance" "kube_master" {
  ami                         = lookup(var.ami-ec2-images, var.aws_region)
  instance_type               = var.instans_t2.medium
  iam_instance_profile        = aws_iam_instance_profile.session-manager.id
  associate_public_ip_address = false
  security_groups             = [aws_security_group.sg_https_ssh.id]
  key_name      = "emap"

  subnet_id                   = aws_subnet.public_subnets[0].id

  user_data = <<-EOF
    #!/bin/bash
    echo "${ssh_public_key}" >> /home/ubuntu/.ssh/authorized_keys
    apt-get update -y
    apt-get install -y curl
    curl -sfL https://get.k3s.io
  EOF

  root_block_device {
    volume_size = 30
  }

  tags = {
    Name = "kuber_master/Task3"
  }
}