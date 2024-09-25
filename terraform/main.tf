terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
  region     = var.aws_region
}

resource "aws_instance" "devops-lesson" {
  instance_type = "t3.micro"

  tags = {
    Name = "ServerDevOpsInstance"
  }
}
