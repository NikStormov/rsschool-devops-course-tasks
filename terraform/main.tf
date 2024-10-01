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