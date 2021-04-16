data "azurerm_resources" "az-resources" {
  resource_group_name = var.Az-Resource-Group-Name
}
data "aws_ami" "aws-ami" {

  owners      = ["amazon"]
  most_recent = true
}