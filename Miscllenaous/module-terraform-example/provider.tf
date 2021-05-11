terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  access_key = var.AWS-Access-Key
  secret_key = var.AWS-Secret-Key
  region     = var.AWS-Resource-Region
}