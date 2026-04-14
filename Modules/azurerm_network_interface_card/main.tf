resource "azurerm_network_interface" "example" {
  for_each = var.nics

  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
 
  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation

    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  
  }

  # tags = each.value.tags
}