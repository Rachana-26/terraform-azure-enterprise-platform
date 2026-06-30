resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "networking" {
  source = "./modules/networking"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  environment         = terraform.workspace
}

module "storage" {
  source = "./modules/storage"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  environment         = terraform.workspace
}


module "compute" {
  source = "./modules/compute"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  environment         = terraform.workspace

  subnet_id = module.networking.web_subnet_id
}
module "security" {
  source = "./modules/security"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  environment         = terraform.workspace

  subnet_id = module.networking.web_subnet_id
}
module "acr" {

  source = "./modules/acr"

  resource_group_name = azurerm_resource_group.rg.name

  location = azurerm_resource_group.rg.location

  environment = terraform.workspace
}