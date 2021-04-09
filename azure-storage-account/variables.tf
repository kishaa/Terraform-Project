variable "Az-Resource-Group-Name" {
  type = string
  default = "poc-rg"
}

variable "Az-Resource-Location" {
  type = string
  default = "centralindia"
}

variable "Az-Resource-Tag" {
  type = string
  default = "POC"
}

variable "Az-Storage-Account-Name" {
    type = string
    default = "pocstorageaccount" 
}

variable "Az-Storage-Account-Kind" {
  type = string
  default = "StorageV2"
}

variable "Az-Storage-Account-Tier" {
  type = string
  default = "Standard"
}

variable "Az-Storage-Account-Replication" {
  type = string
  default = "LRS"
}

variable "Az-Account-Access-Type" {
 type = bool
 default = true  
}