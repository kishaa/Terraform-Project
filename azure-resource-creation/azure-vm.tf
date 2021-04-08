provider "azurerm" {
    features {
      
    }
}

variable "terraform-azure-location" {
  type = string
  default = "eastus"
  description = "Location of azure resource"
}

# Creates a resource group
resource "azurerm_resource_group" "poc-terraform-group" {
  name ="terraform-poc-rg"
  location = var.terraform-azure-location
  tags = {
    "Project" = "poc-terraform"
  }
}

# Creates VNet for the machine
resource "azurerm_virtual_network" "poc-terraform-vnet" {
    name ="terraform-poc-vnet"
    resource_group_name = azurerm_resource_group.poc-terraform-group.name
    location = var.terraform-azure-location
    address_space = [ "10.2.0.0/16" ]
}

# Creates Subnet
resource "azurerm_subnet" "poc-terraform-subnet" {
    name ="terraform-poc-subnet"
    resource_group_name = azurerm_resource_group.poc-terraform-group.name
    virtual_network_name = azurerm_virtual_network.poc-terraform-vnet.name
    address_prefixes = [ "10.2.1.0/24" ]
}

# Creates a public IP
resource "azurerm_public_ip" "poc-terraform-ip" {
    name = "terraform-poc-pubIP"
    location = var.terraform-azure-location
    resource_group_name = azurerm_resource_group.poc-terraform-group.name
    allocation_method = "Dynamic"
}

# Creates Network Security group for VM
resource "azurerm_network_security_group" "poc-terraform-nsg" {
    name = "terraform-poc-nsg"
    resource_group_name = azurerm_resource_group.poc-terraform-group.name
    location = var.terraform-azure-location
    
    }

# Creates Network Interface Card
resource "azurerm_network_interface" "poc-terraform-nic" {
    name = "terraform-poc-nic"
    location = var.terraform-azure-location
    resource_group_name = azurerm_resource_group.poc-terraform-group.name

    ip_configuration {
      name = "terraform-poc-ip-conifg"
      subnet_id                     = azurerm_subnet.poc-terraform-subnet.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id          = azurerm_public_ip.poc-terraform-ip.id
    }
  
}

# Association of NIC and NSG
resource "azurerm_network_interface_security_group_association" "terrform-poc-nsg-nic" {

    network_security_group_id = azurerm_network_security_group.poc-terraform-nsg.id
    network_interface_id = azurerm_network_interface.poc-terraform-nic.id
  
}

# Create (and display) an SSH key
resource "tls_private_key" "example_ssh" {
  algorithm = "RSA"
  rsa_bits = 4096
}
output "tls_private_key" { value = tls_private_key.example_ssh.private_key_pem }


# Create virtual machine
resource "azurerm_linux_virtual_machine" "poc-terraform-vm" {
    name                  = "terraform-poc-vm"
    location              = var.terraform-azure-location
    resource_group_name = azurerm_resource_group.poc-terraform-group.name
    network_interface_ids = [azurerm_network_interface.poc-terraform-nic.id]
    size                  = "Standard_DS1_v2"

    os_disk {
        name              = "terraform-poc-osdisk"
        caching           = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    computer_name  = "terraform-poc-vm"
    admin_username = "kishaa"
    disable_password_authentication = false
    admin_password = "Welcome@1234"

    # admin_ssh_key {
    #     username       = "azureuser"
    #     public_key     = tls_private_key.example_ssh.public_key_openssh
    # }

    tags = {
        environment = "Terraform Demo"
    }
}