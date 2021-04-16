resource "azurerm_app_service_plan" "asp" {
  name = "example-asp-1234"
  location = "centralindia"
  resource_group_name = azurerm_resource_group.az-resource-group.name
  kind = "Linux"
  reserved = true
  sku {
    size = "B1"
    tier = "Basic"
  }
}