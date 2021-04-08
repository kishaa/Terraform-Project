variable "Project-Name" {
  type = string
}
variable "Project-Resource-Group" {
  type = string
}

variable "Project-SQL-Server" {
  type = string
}

variable "Project-SQL-Database" {
  type = string
}

variable "Project-Tags" {
  type = list(string)
}

variable "SQL-Server-Admin-Username" {
  type = string
}

variable "SQL-Server-Admin-Password" {
  type = string
}

variable "Project-Resource-Location" {
  type = string
  default = "canadacentral"
}

variable "SQL-Server-Version" {
  type = string
}

variable "SQL-Development-Database-Name" {
  type = string
}

variable "SQL-Server-Collation" {
  type = string
  default = "SQL_Latin1_General_CP1_CI_AS"
}

variable "SQL-Server-License" {
  type = string
  default = "LicenseIncluded"
}

variable "SQL-Database-Size" {
  type = string
  default = "20"
}

variable "SQL-Database-SKU" {
  type = string
  default = "S2"
}

variable "Project-Webapp-ASP" {
  type = string
}


variable "Project-UI-WebApps" {
  type = list(string)
}

variable "Project-API-WebApps" {
  type = list(string)
}

variable "WebApp-ASP-kind" {
  type = string
  default = "Linux"
}

variable "WebApp-ASP-SKU-tier" {
  type = string
  default = "Basic"
  }

  variable "WebApp-ASP-SKU-size" {
  type = string
  default = "B1"
  }

  variable "Project-DNS-Zone" {
    type = string
  }