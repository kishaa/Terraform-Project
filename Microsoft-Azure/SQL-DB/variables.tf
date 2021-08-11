variable "Project-Resource-Name" {
  type = string
}

variable "Project-Resource-Location" {
  type    = string
  default = "centralindia"
}

variable "Project-Resource-Environment" {
  type    = string
  default = "development"
}

variable "SQL-Server-Username" {
  type = string
}

variable "SQL-Server-Password" {
  type = string
}

variable "SQL-Database-Collation" {
  type    = string
  default = "SQL_Latin1_General_CP1_CI_AS"
}

variable "SQL-Database-License" {
  type    = string
  default = "LicenseIncluded"
}

variable "SQL-Server-Version" {
  type    = string
  default = "12.0"
}

variable "SQL-Database-SKU" {
  type    = string
  default = "Basic"
}

variable "SQL-Server-Public" {
  type    = bool
  default = true
}
