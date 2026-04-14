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
