variable "resource_groups" {
  description = "Map of resource groups to create"
  type = map(object({
    rg_name  = string # Required
    location = string # Required
    # tags     = optional(map(string), {}) # Optional (defaults to empty map)
  }))
}
