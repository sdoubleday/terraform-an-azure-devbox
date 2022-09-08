---
marp: true
---

# Create And Destroy Azure VMs
- The script is free.
- The servers are cheap*.
- And that's how I like to learn.
# SQL Server Free Community Tools Awareness Month
- September 2022 Edition

*<$1.00/hour. Unless you pick the fancy ones.

---

# SQL Server Free Community Tools Awareness Month
[https://www.brentozar.com/archive/2022/08/lets-make-september-our-free-community-tools-awareness-month/](https://www.brentozar.com/archive/2022/08/lets-make-september-our-free-community-tools-awareness-month/)

# Free Script
[https://github.com/sdoubleday/terraform-an-azure-devbox](https://github.com/sdoubleday/terraform-an-azure-devbox)

---

# One-Time Setup

```powershell
#Create an empty powershell profile if none already exists
if(-not $(test-path $profile)) {new-item -ItemType File -Path $profile};
#Install Chocolatey Package Manager for Windows
Set-ExecutionPolicy Bypass -Scope Process -Force;
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'));
#Install HashiCorp's Terraform, Microsoft's Azure CLI, and Git
choco install terraform -y;
choco install azure-cli -y;
choco install git -y;
#refresh the environment after package installation
. $profile;
refreshenv;
#Clone this repo
git clone https://github.com/sdoubleday/terraform-an-azure-devbox.git;
Set-Location terraform-an-azure-devbox;
#Initialize terraform
terraform init;
```

---

# WARNING

This script creates a VM in your azure subscription with a public IP.

No guarantees are made about the security of any of this.

Also, there will likely be Azure charges associated with the resources this creates.

Use at your own financial and security risk.

---

# RUN IT

In a powershell window inside the directory for this repository (you cloned the repo in the setup steps):
```powershell
#Connect this powershell session to your Azure Subscription with your azure credentials
az login;
#Make up an admin username and password for the VM you are creating
$cred = get-credential;
#CREATE A VM! (It will prompt you to review the proposed setup and type "yes")
terraform apply -var-file="terraform.tfvars"  -var "vm_username=$($cred.UserName)" -var "vm_password=$($cred.GetNetworkCredential().Password)";
#RDP connect to the new VM. Click "More Choices > Use a Different Account" and supply the username and password you specified for the VM above.
mstsc.exe /v:$($(gc .\terraform.tfstate | ConvertFrom-Json).outputs.vmIP.value) /span;
```

---

# What gets created

Per: https://docs.microsoft.com/en-us/azure/virtual-machines/windows/overview

- Resource Group
- Virtual Network
- Subnet
- Public IP
- Network Interface
- Virtual Machine

---

# Clean Up

Do this to make the charges stop:

```powershell
terraform apply -var-file="terraform.tfvars"  -var "vm_username=$($cred.UserName)" -var "vm_password=$($cred.GetNetworkCredential().Password)" --destroy --auto-approve;
```

But first, make sure you save out whatever you want to keep, because nothing in that VM is coming back.

---

# portal.azure.com

Hit ```F5``` to see your new resource group.

Charges will show up in Cost Management in 24-48 hours.
