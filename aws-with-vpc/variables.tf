variable "AWS-Access-Key" {
  type = string
}

variable "AWS-Secret-Key" {
  type = string
}

variable "AWS-Resource-Region" {
  type    = string
  default = "ap-south-1"
}

variable "AWS-VPC-CIDR" {
  type    = string
  default = "10.0.0.0/16"
}

variable "AWS-VPC-Tenancy" {
  type    = string
  default = "default"
}

variable "Development-Key" {
  type    = string
  default = "dev"
}
variable "AWS-Environment" {
  type = map(any)
  default = {
    dev  = "development"
    qa   = "test"
    prod = "production"
  }
}

variable "Project-Name" {
  type    = string
  default = "poc"
}

variable "AWS-Subnet-CIDR" {
  type    = string
  default = "10.0.1.0/24"
}

variable "EC2-Instance-Type" {
  type = string
  default = "t2.micro"
}

variable "EC2-AMI" {
  type = string
  default = "ami-0bcf5425cdc1d8a85"
}
