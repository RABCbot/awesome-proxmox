terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.7.4"
    }
  }
}

provider "proxmox" {
  pm_api_url = var.pm_api_url
  pm_api_token_id = var.pm_api_id
  pm_api_token_secret = var.pm_api_token
  pm_tls_insecure = true
}

resource "proxmox_lxc" "container" {
  target_node  = var.pm_node
  vmid         = var.lxc_id
  hostname     = var.lxc_hostname
  ostemplate   = var.lxc_template
  unprivileged = true
  ostype       = "unmanaged"
  start        = true

  rootfs {
    storage = var.lxc_storage
    size    = var.lxc_storagesize
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }

  network {
    name   = "eth1"
    bridge = "vmbr1"
    ip     = "manual"
  }
}
