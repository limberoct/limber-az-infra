# Use existing Resource Group
data "azurerm_resource_group" "rg" {
  name = "erp"
}

# VNet module
module "vnet" {
  source              = "../../modules/vnet"
  name                = "${var.prefix}-vnet"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = var.vnet_address_space
  tags                = var.tags

  subnets = var.subnets
  nsg_rules = var.nsg_rules
}

# VM module (attach to a subnet from VNet module)
module "vm" {
  source              = "../../modules/vm"
  name                = "${var.prefix}-vm01"
  hostname            = "${var.prefix}-vm01"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  subnet_id           = module.vnet.subnet_ids[var.vm_subnet_name]
  tags                = var.tags

  enable_public_ip     = var.enable_public_ip
  size                 = var.vm_size
  os_disk_type         = var.os_disk_type
  os_disk_size_gb      = var.os_disk_size_gb
  admin_username       = var.admin_username
  admin_ssh_public_key = var.admin_ssh_public_key
  image                = var.image
  priority             = var.vm_priority
  custom_data          = var.enable_django_app ? base64encode(file("${path.module}/../../scripts/cloud-init.yml")) : null
}

output "vm_private_ip" { value = module.vm.private_ip }
output "vm_public_ip"  { value = module.vm.public_ip }
