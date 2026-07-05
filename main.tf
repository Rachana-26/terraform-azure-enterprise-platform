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

  resource_group_name        = azurerm_resource_group.rg.name
  location                   = azurerm_resource_group.rg.location
  environment                = terraform.workspace
  vm_name                    = "prod-vm"
  log_analytics_workspace_id = module.monitor.workspace_id
  subnet_id                  = module.networking.web_subnet_id
  identity_id                = module.identity.identity_id
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
module "identity" {
  source = "./modules/identity"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  environment         = terraform.workspace
}

module "finance_compute" {
  source = "./modules/compute"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  environment                = "finance"
  log_analytics_workspace_id = module.monitor.workspace_id
  subnet_id                  = module.networking.web_subnet_id
  identity_id                = module.identity.identity_id

  vm_name = "finance-vm"
}
module "monitor" {

  source = "./modules/monitor"

  resource_group_name = azurerm_resource_group.rg.name

  location = azurerm_resource_group.rg.location

  environment = terraform.workspace
}

module "alerts" {

  source = "./modules/alerts"

  resource_group_name = azurerm_resource_group.rg.name

  location = azurerm_resource_group.rg.location

  environment = terraform.workspace

  vm_id = module.compute.vm_id

}
module "backup" {
  source = "./modules/backup"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  environment         = terraform.workspace

  vm_id = module.compute.vm_id
}