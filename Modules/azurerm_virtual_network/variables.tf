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
