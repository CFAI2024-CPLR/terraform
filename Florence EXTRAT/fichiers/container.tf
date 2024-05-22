resource "proxmox_lxc" "basic" {

 for_each = { for cont in var.containers : cont.name => cont }

  start           = true
  unprivileged    = true

  target_node     = var.target_node
  pool            = var.pool
  hostname        = each.value.name
  password        = var.password
  cpuunits        = each.value.cpuunits
  ssh_public_keys = var.ssh_public_keys
  memory          = each.value.memory
  ostemplate      = each.value.ostemplate

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }
}