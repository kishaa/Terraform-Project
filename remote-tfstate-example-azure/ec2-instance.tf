# Creation of AWS ec2 instance with key pairs which would be generated by terraform
resource "aws_instance" "example" {
  
  ami = lookup(var.AWS-EC2-AMI, var.AWS-Resource-region)
  instance_type = "t2.micro"
  key_name = var.EC2-Key-Name

  # Provisioner to copy script file from local folder to remote machine
provisioner "file" {
  source = var.Source-To-Script
  destination = var.Destination-Of-Script
}

# Provisioner to execute installation script on remote machine
provisioner "remote-exec" {
  inline = [
      "chmod +x /tmp/script.sh",
      "sudo sed -i -e 's/\r$//' /tmp/script.sh",  # Remove the spurious CR characters.
      "sudo /tmp/script.sh",
    ]
}


# Plugin to create ssh connection with the instance.
connection {
  host        = coalesce(self.public_ip, self.private_ip)
  type        = "ssh"
  user = var.EC2-UserName
  private_key = file(var.EC2-Private-Key-Path)
}

provisioner "local-exec" {
  command = "echo ${aws_instance.example.private_ip} >> private.ip"
}
}

# Creation of key pairs for ec2 instance
resource "aws_key_pair" "aws-key-pair" {
  key_name = var.EC2-Key-Name
  public_key = file(var.EC2-Public-Key-Path)
}

# This block outputs the public ip of machine on instance
output "aws-instance-public-ip" {
  value= aws_instance.example.public_ip
}

# Creation of AWS S3 instance with key pairs which would be generated by terraform

# resource "aws_s3_bucket" "example-s3" {
#   bucket = var.AWS-S3-Bucket
#   acl = "public-read-write"
#   versioning {
#     enabled = true
#   }
# }