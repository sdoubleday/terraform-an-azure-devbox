---
marp: true
---

# Infracost - Free Pricing for Terraform Scripts

```powershell
#install Chocolatey
if(-not $(test-path $profile)) {new-item -ItemType File -Path $profile -Force};
Set-ExecutionPolicy Bypass -Scope Process -Force;
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'));
. $profile;

#install infracost and git, get a terraform script
choco install infracost -y;
choco install git -y;
refreshenv;
git clone https://github.com/sdoubleday/terraform-an-azure-devbox.git;
Set-Location terraform-an-azure-devbox;

#Sign up for infracost the first time

#login to infracost and check pricing of this terraform script
infracost auth login;
infracost breakdown --path .;
```

---

# Signing up
* Go to [https://dashboard.infracost.io](https://dashboard.infracost.io)
* Click Sign Up
* Enter an email, a password, and username.
* Hit enter - no credit card, no address, no phone number.
* Find the confirmation email in your inbox, click the confirm link.
* Deliver that delicious cloud pricing data!

