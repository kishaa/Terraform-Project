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


resource "azurerm_network_security_rule" "az-nsg-rule" {
  name                        = "${azurerm_virtual_network.az-vnet.name}-nsg-ssh-rule"
  resource_group_name         = azurerm_resource_group.az-rg.name
  direction                   = "inbound"
  protocol                    = "TCP"
  priority                    = 101
  source_address_prefix       = "0.0.0.0/0"
  destination_address_prefix  = "10.30.1.10"
  access                      = "allow"
  destination_port_range      = "22"
  source_port_range           = "0-65535"
  network_security_group_name = azurerm_network_security_group.az-nsg.name
}

resource "azurerm_public_ip" "az-pub-ip" {
  name                = "${azurerm_virtual_network.az-vnet.name}-pub-ip"
  resource_group_name = azurerm_resource_group.az-rg.name
  location            = var.Az-Resource-Location
  allocation_method   = var.Az-IP-Allocation
  ip_version          = var.Az-Public-IP-Version
  sku                 = var.Az-Public-IP-SKU
  tags = {
    "Project"     = var.Project-Name
    "Environment" = lookup(var.Az-Environment-Prefix, var.Az-Development)
  }
}

resource "azurerm_network_interface" "az-nic" {
  name                = "${azurerm_virtual_network.az-vnet.name}-nic"
  resource_group_name = azurerm_resource_group.az-rg.name
  location            = var.Az-Resource-Location
  ip_configuration {
    name                          = "${azurerm_virtual_network.az-vnet.name}-nic-ip"
    private_ip_address_version    = var.Az-Public-IP-Version
    public_ip_address_id          = azurerm_public_ip.az-pub-ip.id
    subnet_id                     = azurerm_subnet.az-vnet-subnet-0.id
    private_ip_address            = "10.30.0.21"
    private_ip_address_allocation = var.Az-IP-Allocation
  }
  tags = {
    "Project"     = var.Project-Name
    "Environment" = lookup(var.Az-Environment-Prefix, var.Az-Development)
  }
}
