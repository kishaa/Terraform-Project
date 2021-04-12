terraform {
  backend "azurerm" {
  storage_account_name  = "mypocstorageaccount"     
  container_name        = "tfstate"     
  key                   = "terraform.tfstate"   
  access_key = ""
 } 
  }