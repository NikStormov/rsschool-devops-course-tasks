# resource "aws_instance" "bastion" {
#   ami                         = lookup(var.ami-ec2-images, var.aws_region)
#   instance_type               = var.instance_type
#   iam_instance_profile        = aws_iam_instance_profile.session-manager.id
#   associate_public_ip_address = true
#   security_groups             = [aws_security_group.sg_https_ssh.id]
#   subnet_id                   = aws_subnet.public_subnets[0].id
#   key_name                    = aws_key_pair.bastionishe.key_name
#   tags = {
#     Name = "BastionHost/Task3"
#   }
# }