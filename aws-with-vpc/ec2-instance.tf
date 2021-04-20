resource "aws_instance" "ec2-instance" {
instance_type = var.EC2-Instance-Type
ami = var.EC2-AMI
availability_zone = var.AWS-Resource-Region
network_interface {
  network_interface_id = aws_network_interface.aws-nic.id
  device_index = 0
}
tags = {
    "Name"        = "${lookup(var.AWS-Environment, var.Development-Key)}-${var.Project-Name}-ec2"
    "Environment" = lookup(var.AWS-Environment, var.Development-Key)
  }
}