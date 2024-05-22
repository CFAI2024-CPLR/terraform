resource "proxmox_lxc" "basic" {

  for_each = { for cont in var.containers : cont.name => cont }


  target_node  = var.target_node
  pool = var.pool
  hostname = each.value.name 
  password = var.password
  ssh_public_keys = var.ssh_public_keys

  cpuunits = each.value.cpuunits
  
  start = "true"
  ostemplate   = each.value.os_templates
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
    ip6    = "auto"
  }
}

