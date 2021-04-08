variable "AWS-Access-key" {
  type = string
}

variable "AWS-Secret-key" {
  type = string
}

variable "AWS-Resource-region" {
  type = string
  default = "ap-south-1"
}

variable "AWS-EC2-AMI" {
    type = map
    default = {
        ap-south-1 = "ami-0bcf5425cdc1d8a85"
        ap-south-2 = "ami-0bcf5425edc1d8a90"
        eu-west-1 = "ami-0bcf5425edc1d8a78"
    }
  
}