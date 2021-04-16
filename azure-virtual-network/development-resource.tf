resource "azurerm_resource_group" "az-rg" {
  name     = "${lookup(var.Az-Environment-Prefix, var.Az-Development)}-${var.Az-Resource-Group-Name}"
  location = var.Az-Resource-Location
  tags = {
    "Project"     = var.Project-Name
    "Environment" = lookup(var.Az-Environment-Prefix, var.Az-Development)
  }
}

resource "azurerm_virtual_network" "az-vnet" {
  name                = "poc-${lookup(var.Az-Environment-Prefix, var.Az-Development)}-vnet"
  location            = var.Az-Resource-Location
  resource_group_name = azurerm_resource_group.az-rg.name
  address_space       = [var.Az-VNet-Address-Space]
  tags = {
    "Project"     = var.Project-Name
    "Environment" = lookup(var.Az-Environment-Prefix, var.Az-Development)
  }

}
resource "azurerm_subnet" "az-vnet-subnet-0" {
  name                 = "${azurerm_virtual_network.az-vnet.name}-subnet-0"
  resource_group_name  = azurerm_resource_group.az-rg.name
  virtual_network_name = azurerm_virtual_network.az-vnet.name
  address_prefixes     = ["10.30.0.0/24"]
}


resource "azurerm_subnet" "az-vnet-subnet-1" {
  name                 = "${azurerm_virtual_network.az-vnet.name}-subnet-1"
  resource_group_name  = azurerm_resource_group.az-rg.name
  virtual_network_name = azurerm_virtual_network.az-vnet.name
  address_prefixes     = ["10.30.1.0/24"]
}

resource "azurerm_subnet" "az-vnet-subnet-2" {
  name                 = "${azurerm_virtual_network.az-vnet.name}-subnet-2"
  resource_group_name  = azurerm_resource_group.az-rg.name
  virtual_network_name = azurerm_virtual_network.az-vnet.name
  address_prefixes     = ["10.30.2.0/24"]
}

resource "azurerm_subnet" "az-vnet-subnet-3" {
  name                 = "${azurerm_virtual_network.az-vnet.name}-subnet-3"
  resource_group_name  = azurerm_resource_group.az-rg.name
  virtual_network_name = azurerm_virtual_network.az-vnet.name
  address_prefixes     = ["10.30.3.0/24"]

}

resource "azurerm_network_security_group" "az-nsg" {
  name                = "${azurerm_virtual_network.az-vnet.name}-nsg"
  location            = var.Az-Resource-Location
  resource_group_name = azurerm_resource_group.az-rg.name
  tags = {
    "Project"     = var.Project-Name
    "Environment" = lookup(var.Az-Environment-Prefix, var.Az-Development)
  }
}

resource "azurerm_subnet_network_security_group_association" "az-nsg-asso" {
  subnet_id                 = azurerm_subnet.az-vnet-subnet-0.id
  network_security_group_id = azurerm_network_security_group.az-nsg.id
}

