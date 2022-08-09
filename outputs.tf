
output "vmIP" {
  description = "run this to RDP into server:  mstsc.exe /v:'ip.address.goes.here' /span"
  value       = "mstsc.exe /v:'${azurerm_windows_virtual_machine.example.public_ip_address}' /span"
}
