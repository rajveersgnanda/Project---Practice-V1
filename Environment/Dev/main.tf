module "rgs" {
  source          = "../../modules/azurerm_resource_group"
  resource_groups = var.resource_groups
}

module "vnets" {
  depends_on = [module.rgs]
  source     = "../../modules/azurerm_virtual_network"
  vnets      = var.vnets
}

# module "subnets" {
#   depends_on = [module.rgs, module.vnets]
#   source     = "../../modules/azurerm_subnet"
#   subnets    = var.subnets
# }

# module "pips" {
#   depends_on = [module.rgs]
#   source     = "../../modules/azurerm_public_ip"
#   public_ips = var.public_ips
# }

# module "nics" {
#   depends_on = [module.rgs, module.subnets, module.pips]
#   source     = "../../modules/azurerm_network_interface_card"
#   nics       = var.nics
# }

# module "nsgs" {
#   depends_on = [module.rgs]
#   source     = "../../modules/azurerm_network_security_group"
#   nsgs       = var.nsgs
# }


# module "nsg_nic_association" {
#   depends_on           = [module.rgs, module.nics, module.nsgs]
#   source               = "../../modules/azurerm_nsg_assoc_nic"
#   nic_nsg_associations = var.nic_nsg_associations
# }


# module "lvm" {
#   depends_on = [module.rgs, module.vnets, module.subnets, module.pips, module.nics, module.nsgs, module.nsg_nic_association]
#   source     = "../../modules/azurerm_linux_virtual_machine"
#   linux_vms  = var.linux_vms

# }
