variable "name"                { type = string }
variable "hostname" { 
  type    = string 
  default = null 
}
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "subnet_id" { type = string }
variable "tags" { 
  type    = map(string) 
  default = {} 
}

variable "enable_public_ip" { 
  type    = bool 
  default = false 
}
variable "size" { 
  type    = string 
  default = "Standard_B1s" 
}
variable "os_disk_type" { 
  type    = string 
  default = "Standard_LRS" 
}
variable "os_disk_size_gb" { 
  type    = number 
  default = 30 
}

variable "admin_username"      { type = string }
variable "admin_ssh_public_key"{ type = string }

variable "image" {
  description = "Image reference"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }
}

variable "priority" {
  description = "Regular or Spot"
  type        = string
  default     = "Regular"
}

variable "custom_data" {
  description = "Base64-encoded cloud-init data for VM provisioning"
  type        = string
  default     = null
}
