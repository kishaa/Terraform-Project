provider "aws" {
  access_key = "Access key"
  secret_key = "Secret key"
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami = "ami-0bcf5425cdc1d8a85"
  instance_type = "t2.micro"
}

output "ec2-public-ip" {
  value = aws_instance.example.public_ip
}