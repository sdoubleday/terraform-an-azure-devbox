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

1. Install package manager Chocolatey.
1. Install HashiCorp's Terraform, Microsoft's Azure CLI, and Git from Chocolatey.
1. Clone this repository with the necessary terraform files and initialize it.

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force;
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'));
choco install terraform -y;
choco install azure-cli -y;
choco install git -y;
. 'C:\Program Files\Git\bin\git.exe' clone https://github.com/sdoubleday/terraform-an-azure-devbox.git;
Set-Location terraform-an-azure-devbox;
terraform init;
```

---

# Usage

Read the Fine Manual:

[https://github.com/sdoubleday/terraform-an-azure-devbox/blob/main/README.md](https://github.com/sdoubleday/terraform-an-azure-devbox/blob/main/README.md)
