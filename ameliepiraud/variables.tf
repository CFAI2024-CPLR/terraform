variable password {
  type          = string
  default       = "2^2egale4"
  description   = "Default password for containers"
}

variable ssh_public_keys {
  type          = string
  default       = ""
  description   = "Multiline each line a ssh-key"
}

variable target_node {
  type          = string
  default       = "cfai2024"
  description   = "Target to proxmox deployment"
}

variable pool {
  type          = string
  default       = ""
  description   = "Pool to deploy on"
}

variable containers {
  type          = list(object({
    name        = string
    cpuunits    = number
    rootfs_size = string
    os_templates = string
  }))
  default       =[{
    name = "default"
    cpuunits = 128
    rootfs_size = 2
    os_templates = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
  }]
  description   = "Pool to deploy on"
}
