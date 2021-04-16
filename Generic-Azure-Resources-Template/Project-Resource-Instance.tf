resource "azurerm_resource_group" "azure-rg" {
  name     = var.Project-Resource-Group
  location = var.Project-Resource-Location
  tags = {
    ProjectName = var.Project-Name
  }
}


resource "azurerm_sql_server" "azure-sql-server" {
  name                         = var.Project-SQL-Server
  location                     = var.Project-Resource-Location
  resource_group_name          = var.Project-Resource-Group
  administrator_login          = var.SQL-Server-Admin-Username
  administrator_login_password = var.SQL-Server-Admin-Password
  version                      = var.SQL-Server-Version
  tags = {
    ProjectName = var.Project-Name
    Environment = var.Project-Tags[0]
  }
}

resource "azurerm_mssql_database" "azure-sql-db" {

  name           = var.SQL-Development-Database-Name
  server_id      = azurerm_sql_server.azure-sql-server.id
  collation      = var.SQL-Server-Collation
  license_type   = var.SQL-Server-License
  max_size_gb    = var.SQL-Database-Size
  read_scale     = false
  sku_name       = var.SQL-Database-SKU
  zone_redundant = false
  tags = {
    ProjectName = var.Project-Name
    Environment = var.Project-Tags[0]
  }
}
resource "azurerm_app_service_plan" "webappASP" {
  name                = var.Project-Webapp-ASP
  location            = var.Project-Resource-Location
  resource_group_name = var.Project-Resource-Group
  kind                = var.WebApp-ASP-kind
  reserved            = true
  sku {
    tier = var.WebApp-ASP-SKU-tier
    size = var.WebApp-ASP-SKU-size
  }
  tags = {
    ProjectName = var.Project-Name
    Environment = var.Project-Tags[0]
  }

}

resource "azurerm_app_service" "azurewebapp1" {
  name                = var.Project-UI-WebApps[0]
  location            = var.Project-Resource-Location
  resource_group_name = var.Project-Resource-Group
  app_service_plan_id = azurerm_app_service_plan.webappASP.id


  site_config {
    linux_fx_version = "NODE|12.0"
  }
  tags = {
    ProjectName = var.Project-Name
    Environment = var.Project-Tags[0]
  }
}

resource "azurerm_app_service" "azurewebapp2" {
  name                = var.Project-API-WebApps[0]
  location            = var.Project-Resource-Location
  resource_group_name = var.Project-Resource-Group
  app_service_plan_id = azurerm_app_service_plan.webappASP.id


  site_config {
    linux_fx_version = "DOTNETCORE|3.0"
  }

  tags = {
    ProjectName = var.Project-Name
    Environment = var.Project-Tags[0]
  }
}

resource "azurerm_dns_zone" "azure-dns" {
  name                = var.Project-DNS-Zone
  location            = var.Project-Resource-Location
  resource_group_name = var.Project-Resource-Group

}



