variable "name" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "address_space" { type = list(string) }
variable "tags" { 
  type    = map(string) 
  default = {} 
}

variable "subnets" {
  description = <<EOT
Map of subnets:
subnets = {
  "default" = { cidr = "10.10.1.0/24" }
  "data"    = { cidr = "10.10.2.0/24" }
}
EOT
  type = map(object({
    cidr = string
  }))
}

variable "nsg_rules" {
  description = "List of NSG rules (inbound/outbound)."
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string # Inbound/Outbound
    access                     = string # Allow/Deny
    protocol                   = string # Tcp/Udp/Asterisk
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default = []
}
