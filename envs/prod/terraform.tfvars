prefix              = "limber"
location            = "Southeast Asia"

tags = {
  env   = "prod"
  owner = "peter"
  app   = "erp"
}

# Network Configuration
subnets = {
  public  = { cidr = "10.10.1.0/24" }  # Public subnet for load balancers, bastion
  private = { cidr = "10.10.2.0/24" }  # Private subnet for app servers, databases
}

#VM Configuration
vm_subnet_name = "public"
enable_public_ip      = true
vm_size               = "Standard_B1ls"
os_disk_type          = "Standard_LRS"
os_disk_size_gb       = 30
admin_username        = "ubuntu"
vm_priority           = "Regular"
