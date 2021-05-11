variable "AWS-Access-key" {
  type = string
}

variable "AWS-Secret-key" {
  type = string
}

variable "AWS-Resource-region" {
  type    = string
  default = "ap-south-1"
}

variable "AWS-EC2-AMI" {
  type = map(any)
  default = {
    ap-south-1 = "ami-0bcf5425cdc1d8a85"
    ap-south-2 = "ami-0bcf5425edc1d8a90"
    eu-west-1  = "ami-0bcf5425edc1d8a78"
  }

}

variable "EC2-Key-Name" {
  type    = string
  default = "mykey"
}

variable "EC2-Public-Key-Path" {
  type    = string
  default = "mykey.pub"
}

variable "EC2-Private-Key-Path" {
  type    = string
  default = "mykey"
}


variable "EC2-UserName" {
  type    = string
  default = "ec2-user"
}

variable "Source-To-Script" {
  type    = string
  default = "jdk-installation-script.sh"
}

variable "Destination-Of-Script" {
  type    = string
  default = "/tmp/script.sh"
}