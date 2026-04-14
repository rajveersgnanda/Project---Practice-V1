variable "subnets" {
  description = "Map of subnets to create"
  type = map(object({
    name             = string
    address_prefixes = list(string)
    vnet_name        = string # Kis VNET mein daalna hai?
    rg_name          = string # Kis RG mein hai wo VNET?

  }))
}
