resource "aws_vpc" "aws-vpc" {
  cidr_block       = var.AWS-VPC-CIDR
  instance_tenancy = var.AWS-VPC-Tenancy
  tags = {
    "Name"        = "${lookup(var.AWS-Environment, var.Development-Key)}-${var.Project-Name}-vpc"
    "Environment" = lookup(var.AWS-Environment, var.Development-Key)
  }
}

resource "aws_subnet" "aws-subnet" {
  vpc_id            = aws_vpc.aws-vpc.id
  cidr_block        = var.AWS-Subnet-CIDR
  availability_zone = var.AWS-Resource-Region
  tags = {
    "Name"        = "${lookup(var.AWS-Environment, var.Development-Key)}-${var.Project-Name}-vpc-subnet"
    "Environment" = lookup(var.AWS-Environment, var.Development-Key)
  }
}

resource "aws_network_interface" "aws-nic" {
    subnet_id = aws_subnet.aws-subnet.id 
    private_ip = "10.0.1.10"
    tags = {
    "Name"        = "${lookup(var.AWS-Environment, var.Development-Key)}-${var.Project-Name}-vpc-nic"
    "Environment" = lookup(var.AWS-Environment, var.Development-Key)
  }
}
