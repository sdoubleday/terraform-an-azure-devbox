# terraform-an-azure-devbox
Creates all the Azure resources you need to stand up a VM in the cloud for development or demo purposes.

## What gets created
- Resource Group
- Virtual Network
- Subnet
- Public IP
- Network Interface
- Virtual Machine
Per: https://docs.microsoft.com/en-us/azure/virtual-machines/windows/overview

## WARNING
This creates a VM in your azure subscription with a public IP. No guarantees are made about the security of any of this. Also there will likely be Azure charges associated with the resources this creates. Use at your own financial and security risk.

## Usage
- FIRST, UPDATE THE PASSWORD in the virtualmachine.tf file.
- Deploy the Azure VM like this:
```powershell
az login; #will prompt you to log into Azure Portal. Resources will be created in that account's selected subscription.
terraform init;
terraform plan;
terraform apply;
```
- Then connect to portal.azure.com, find the newly created resource group and its VM, and on the VM overview there should be a spot to connect to the VM via RDP to its public IP. Supply the username and password from the virtualmachine.tf file.
- When you are done, and you have transferred any files you need AWAY from the virtual machine, clean up! Dropping resources should halt further Azure charges.
```powershell
terraform destroy;
```

## Prerequisites
```powershell
choco install terraform -y;
choco install azure-cli -y;
```

## Links
Inspired in part by:
https://adamtheautomator.com/terraform-azure-vm/
