resource "aws_instance" "kube_master" {
  ami                         = lookup(var.ami-ec2-images, var.aws_region)
  instance_type               = var.instans_t2_medium
  iam_instance_profile        = aws_iam_instance_profile.session-manager.id
  associate_public_ip_address = true
  security_groups             = [aws_security_group.sg_https_ssh.id]

  subnet_id = aws_subnet.public_subnets[0].id

  user_data = <<-EOF
    #!/bin/bash
    echo "${var.ssh_public_key}" >> /home/ubuntu/.ssh/authorized_keys
    apt-get update -y > /dev/null 2>&1
    apt-get install -y curl > /dev/null 2>&1
    curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--tls-san $(curl -s 2ip.io)" sh -
  EOF

  root_block_device {
    volume_size = 30
  }

  tags = {
    Name = "kuber_master_Task4"
  }
}