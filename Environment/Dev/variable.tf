variable "sub_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "resource_groups" {
  description = "Map of resource groups to create"
  type = map(object({
    rg_name  = string                    # Required
    location = string                    # Required
    # tags     = optional(map(string), {}) # Optional (defaults to empty map)
  }))
}


variable "vnets" {
  description = "Map of Virtual Networks"
  type = map(object({
    name          = string
    address_space = list(string)
    rg_name       = string
    location      = string
    # tags          = optional(map(string), {})
  }))
}


variable "subnets" {
  description = "Map of subnets to create"
  type = map(object({
    name             = string
    address_prefixes = list(string)
    vnet_name        = string # Kis VNET mein daalna hai?
    rg_name          = string # Kis RG mein hai wo VNET?

  }))
}


variable "public_ips" {
  description = "Map of Public IPs to create"
  type = map(object({
    pip_name          = string
    rg_name           = string
    location          = string
    allocation_method = optional(string, "Static")   # Default Static rakha hai
    sku               = optional(string, "Standard") # Modern Azure usage ke liye Standard best hai
    # tags              = optional(map(string), {})
  }))
}

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


variable "nsgs" {
  description = "Map of NSGs with their rules"
  type = map(object({
    nsg_name = string
    location = string
    rg_name  = string
    # tags     = optional(map(string), {})

    rules = list(object({
      rule_name                  = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}


variable "nic_nsg_associations" {
  description = "Map of NIC keys to NSG keys"
  type = map(object({
    nic_name = string
    nsg_name = string
    rg_name  = string
  }))
}


variable "linux_vms" {
  description = "Map of Linux Virtual Machines"
  type = map(object({
    vm_name        = string
    rg_name        = string
    nic_name       = string
    location       = string
    size           = optional(string, "Standard_B1s") # Sasta aur tikaau default
    admin_username = string
    admin_password = string # Password hamesha complex dena bhai

    os_disk = optional(object({
      caching              = optional(string, "ReadWrite")
      storage_account_type = optional(string, "Standard_LRS")
    }), {})

    source_image_reference = optional(object({
      publisher = optional(string, "Canonical")
      offer     = optional(string, "0001-com-ubuntu-server-jammy")
      sku       = optional(string, "22_04-lts")
      version   = optional(string, "latest")
    }), {})

    # tags = optional(map(string), {})
  }))
}

