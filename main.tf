terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.12.1"
    }
  }
  backend "s3" {
    bucket = "demo-github-action-tf-hari"
    key    = "tfstate"
    region = "us-east-1"
  }
}

# Configure the AWS Provider
provider "aws" {

  region = "us-east-1" # define region as per your account
}

