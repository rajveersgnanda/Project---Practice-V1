variable "nic_nsg_associations" {
  description = "Map of NIC keys to NSG keys"
  type = map(object({
    nic_name = string
    nsg_name = string
    rg_name  = string
  }))
}
