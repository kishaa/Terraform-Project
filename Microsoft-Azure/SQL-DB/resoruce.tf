# Creating resource group

resource "azurerm_resource_group" "examplerg" {
    name = "${var.Project-Resource-Name}-${var.Project-Resource-Environment}-rg"
    location = var.Project-Resource-Location
    tags = {
        "Environment" = var.Project-Resource-Environment
    }
}

# Creating SQL Server

resource "azurerm_mssql_server" "examplesqlserver" {
    name = "${azurerm_resource_group.examplerg.name}-sql-server"
    location = var.Project-Resource-Location
    resource_group_name = azurerm_resource_group.examplerg.name
    version = var.SQL-Server-Version
    administrator_login = var.SQL-Server-Username
    administrator_login_password = var.SQL-Server-Password
    public_network_access_enabled = var.SQL-Server-Public
    tags = {
        "Environment" = var.Project-Resource-Environment
    }
}

# Creating DB

resource "azurerm_mssql_database" "exampledb"{
    name = "${azurerm_resource_group.examplerg.name}-database"
    server_id = azurerm_mssql_server.examplesqlserver.id
    collation = var.SQL-Database-Collation
    sku_name = var.SQL-Database-SKU
    license_type = var.SQL-Database-License
    zone_redundant = false
    tags = {
        "Environemnt" = var.Project-Resource-Environment
    }
}
