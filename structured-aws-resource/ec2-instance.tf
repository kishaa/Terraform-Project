resource "aws_instance" "exmaple1" {

  ami           = lookup(var.AWS-EC2-AMI, var.AWS-Resource-region)
  instance_type = "t2.micro"
}