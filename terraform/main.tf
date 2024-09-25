terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  backend "s3" {
    bucket         = "epam-lesson1"
    region         = "eu-central-1"
    key            = "env:/task1/terraform.tfstate"
    encrypt        = true
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  access_key = var.AWS_SECRET_ACCESS_KEY
  secret_key = var.AWS_ACCESS_KEY_ID
  region     = var.aws_region
}

resource "aws_instance" "devops-lesson" {
  ami = "ami-0e04bcbe83a83792e"
  instance_type = "t3.micro"

  tags = {
    Name = "ServerDevOpsInstance"
  }
}
