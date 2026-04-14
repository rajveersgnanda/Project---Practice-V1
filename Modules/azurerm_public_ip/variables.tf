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
