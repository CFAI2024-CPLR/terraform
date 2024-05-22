variable password {
  type        = string
  default     = "AzertyAzerty/42"
  description = "Default password for containers"
}

variable ssh_public_keys {
  type        = string
  default     = ""
  description = "multiline each line a ssh-key"
}

variable target_node {
  type        = string
  default     = "cfai2024"
  description = "Target to proxmox deployment"
}

variable pool {
  type        = string
  default     = ""
  description = "Pool to deploy on"
}

variable containers {
  type        = list(object({
                        name        = string
                        cpuunits    = number
                        rootfs_size = string
                        memory      = number
                }))
  default     = [{
                    name = "default"
                    cpuunits = 128
                    rootfs_size = "1G" 
                    memory = 64
                }]
  description = "description"
}
