terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      #version = "3.0.1-rc2"
      version = "2.9.14"
    }
  }
}

provider "proxmox" {
  # Configuration options
  pm_api_url = "https://cfai2024.ajformation.fr:8006/api2/json"
}
