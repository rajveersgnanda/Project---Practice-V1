
resource "azurerm_subnet" "example" {
  for_each = var.subnets

  name                 = each.value.name
  address_prefixes     = each.value.address_prefixes
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}