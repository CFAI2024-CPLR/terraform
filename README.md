# terraform

## Initialisation



```
# SUR VOTRE CONTENEUR
root@javond-terraform:~# adduser javond
Adding user `javond' ...
Adding new group `javond' (1000) ...
Adding new user `javond' (1000) with group `javond (1000)' ...
Creating home directory `/home/javond' ...
Copying files from `/etc/skel' ...
New password: 
Retype new password: 
```

Deconnexion

```
# DEPUIS VOTRE MACHINE LOCALE
ssh-copy-id javond@javond-terraform.ct.cfai24.ajformation.fr.
ssh-copy-id -i <chemin vers ma clé ssh> javond@javond-terraform.ct.cfai24.ajformation.fr.
ssh javond@javond-terraform.ct.cfai24.ajformation.fr.
```

### TERRAFORM

https://developer.hashicorp.com/terraform/install?product_intent=terraform#linux

=> Linux / Amd 64
AMD64
Version: 1.8.3
Download

https://releases.hashicorp.com/terraform/1.8.3/terraform_1.8.3_linux_amd64.zip

https://registry.terraform.io/providers/Telmate/proxmox/latest

```
terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.1-rc2"
    }
  }
}

provider "proxmox" {
  # Configuration options
  pm_api_url = https://cfai2024.ajformation.fr:8006/api2/json
}
```


    Terraform

    API Proxmox cfai : https://cfai2024.ajformation.fr:8006/api2/json

    Fichier password.env


```
export PM_USER="terraform-prov@pve"
export PM_PASS="password"
```
```
source password.env
./terraform init

vim container.tf
```
https://registry.terraform.io/providers/Telmate/proxmox/latest/docs/resources/lxc

```
resource "proxmox_lxc" "basic" {
  target_node  = "cfai2024"
  hostname     = "javond-container1"
  ostemplate   = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
  #password     = ""
  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBnoxKR7llvIC/zepZokSb2FyqO69BVCiFAWKTULE4bL jerome@djay
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDWsfbTbSlxcvxUL1286nwhwrDPJq6bctkxPpZ+TyujHrDwyymvqEjMJNxiwDPRoomPgOcg+YYUYXbfRiLp0VNlUqA5oG9nhlgtiryZrWY6zrywnsDOk6wJvWA/YNbWLlFN14OiKXOH5KJpgYQh1pLIw1TPeR56vU5wv1Ggb0Jr1sg14TJgm2M4lSmQs1CAY8hBLDj/qQcwVNtuYqTXOulwCPZAzhP6ncHM7lHbwJua/3bGQ8IeFzjRGjL0s2XVECYPufCbM0cX1VtmaSQdVmwqXGW2c+rPAq8cFHecfaw/0fdSMeNV4qSl+VqpCGn/XXnpWAYi0OfifddH80ffdAp5 /home/jerome/.ssh/id_rsa
  EOT
  unprivileged = true

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
    ip6     = "auto"
  }
}
```

Une fois fini :  

```
./terraform validate
./terraform plan
./terraform apply
./terraform destroy
```

https://developer.hashicorp.com/terraform/language/meta-arguments/for_each

https://developer.hashicorp.com/terraform/language/values/variables



