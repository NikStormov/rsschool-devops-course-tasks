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
    assume_role = {
      session_name = "arn:aws:iam::739275448137:role/GithubActionsRole"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region     = var.aws_region
}