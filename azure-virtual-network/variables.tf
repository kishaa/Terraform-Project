variable "Az-Resource-Group-Name" {
  type    = string
  default = "POC-RG"
}

variable "Az-Resource-Location" {
  type    = string
  default = "centralindia"
}

variable "Project-Name" {
  type    = string
  default = "POC"
}

variable "Az-Development" {
  type    = string
  default = "dev"
}
variable "Az-Environment-Prefix" {
  type = map(any)
  default = {
    prod = "Production"
    dev  = "Development"
    qa   = "Test"
  }
}

variable "Az-VNet-Address-Space" {
  type    = string
  default = "10.30.0.0/16"

}