variable "prefix" { type = string }
variable "location" { 
  type    = string 
  default = "Southeast Asia" 
}

variable "tags" { 
  type    = map(string) 
  default = {} 
}

# Network
variable "vnet_address_space" { 
  type    = list(string) 
  default = ["10.10.0.0/16"] 
}

variable "subnets" {
  type = map(object({ cidr = string }))
  default = {
    public  = { cidr = "10.10.1.0/24" }
    private = { cidr = "10.10.2.0/24" }
  }
}

variable "nsg_rules" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default = [
    {
      name                       = "allow-ssh-from-myip"
      priority                   = 1000
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "103.224.52.1/32"
      destination_address_prefix = "*"
    }
  ]
}

variable "vm_subnet_name" { 
  type    = string 
  default = "private" 
}
variable "enable_public_ip" { 
  type    = bool 
  default = false 
}
variable "vm_size" { 
  type    = string 
  default = "Standard_B1ls" 
}
variable "os_disk_type" { 
  type    = string 
  default = "Standard_LRS" 
}
variable "os_disk_size_gb" { 
  type    = number 
  default = 30 
}
variable "admin_username" { 
  type    = string
}
variable "admin_ssh_public_key" { type = string }

variable "image" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server-gen2" 
    version   = "latest"
  }
}

variable "vm_priority" { 
  type    = string 
  default = "Regular" 
} # or "Spot"