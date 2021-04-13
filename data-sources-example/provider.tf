terraform {
  required_providers {
   azurerm = {
      source = "hashicorp/azurerm"
      version = "=2.46.0"
   }
   aws = {
       source = "hashicorp/aws"
   }
  }
}

provider "azurerm" {
  features {
    
  }
}

provider "aws" {
  access_key = var.AWS-Access-Key
  secret_key = var.AWS-Secret-Key
  region = var.AWS-Resource-Region
}