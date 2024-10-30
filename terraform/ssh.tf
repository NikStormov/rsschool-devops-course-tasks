# resource "tls_private_key" "ssh" {
#   algorithm = "RSA"
#   rsa_bits  = "4096"
# }

# resource "local_file" "private_key" {
#   content         = tls_private_key.ssh.private_key_pem
#   filename        = "linode.pem"
#   file_permission = "0600"
# }

# resource "aws_key_pair" "bastionishe" {
#   key_name   = "task3-key"
#   public_key = tls_private_key.ssh.public_key_openssh
# }

variable "ssh_public_key" {
  description = "Public SSH key for EC2 access"
  type        = string
}