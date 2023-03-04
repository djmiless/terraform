#Define provider used
provider "azurerm" {
  features {} #This is required for V2 of the provider even if empty or plan will fail
}

#create a resource group 
resource "azurerm_resource_group" "example" {
  name     = "myResourceGroup"
  location = "eastus"
}

#create a storage account 
resource "azurerm_storage_account" "example" {
  name                     = "cloudninestorexxacc"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "ZRS"
}

#create a container
resource "azurerm_storage_container" "example" {
  name                  = "mycontainer"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"

}