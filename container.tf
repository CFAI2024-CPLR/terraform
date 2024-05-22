resource "proxmox_lxc" "basic" {

  for_each = { for cont in var.containers : cont.name => cont }

  target_node  = var.target_node
  pool	       = var.pool  
  hostname     = each.value.name
  password     = var.password
  ssh_public_keys = var.ssh_public_keys
  cpuunits        = each.value.cpuunits
  memory          = each.value.memory

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = each.value.rootfs_size
    
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
    ip6     = "auto"
  }

  start = true
  ostemplate   = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
  unprivileged = true
  #<<-EOT
	#EOT

}
