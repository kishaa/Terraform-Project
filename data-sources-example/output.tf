output "az-resources-output" {
  value = data.azurerm_resources.az-resources
}

output "aws-ami-output" {
  value = data.aws_ami.aws-ami
}