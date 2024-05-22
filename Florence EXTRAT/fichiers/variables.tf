variable password {
  type         = string
  default      = "Chaton666"
  description  = "description"
}

variable ssh_public_keys {
  type         = string
  default      = ""
  description  = "multiline each line a ssh key"
}

variable target_node {
  type         = string
  default      = "cfai2024"
  description  = "target to proxmox deployment"
}

variable pool {
  type         = string
  default      = "fextrat"
  description  = "pool to deploy on"
}

variable containers {
  type            = list(object({
   name           = string
   cpuunits       = number
   rootfs_size    = string
   memory         = number
   ostemplate     = string
  }))
  default         = [{
   name           = "default"
   cpuunits       = 128
   rootfs_size    = "1G"
   memory         = 64
   ostemplate     = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
  }]
  description  = "description"
}