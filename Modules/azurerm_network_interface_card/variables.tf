variable "nics" {
  description = "Map of Network Interfaces"
  type = map(object({
    nic_name                      = string
    location                      = string
    rg_name                       = string
    subnet_name                   = string
    vnet_name                     = string
    private_ip_address_allocation = optional(string, "Dynamic")
    pip_name                      = optional(string, null) # Optional PIP
    # tags                          = optional(map(string), {})


  }))
}
