output "vm_id"         { value = azurerm_linux_virtual_machine.vm.id }
output "nic_id"        { value = azurerm_network_interface.nic.id }
output "public_ip"     { value = try(azurerm_public_ip.pip[0].ip_address, null) }
output "private_ip"    { value = azurerm_network_interface.nic.private_ip_address }
