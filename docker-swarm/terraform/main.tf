resource "proxmox_vm_qemu" "control" {
  vmid              = 210
  name              = "swarm-manager"
  target_node       = var.pm_node
  clone             = "ubuntu-focal-cloudinit-template"
  os_type           = "cloud-init"
  full_clone        = true
  cores             = 2
  memory            = 2048
  scsihw            = "virtio-scsi-pci"
  sshkeys           = file(var.ssh_file)

  network {
    model           = "virtio"
    bridge          = "vmbr2"
  }

  disk {
    type            = "scsi"
    storage         = var.pm_storage
    size            = "14G"
    ssd             = 1
  }

  agent              = 0
  guest_agent_ready_timeout = 90
}

resource "proxmox_vm_qemu" "worker" {
  vmid              = 211
  name              = "swarm-worker"
  target_node       = var.pm_node
  clone             = "ubuntu-focal-cloudinit-template"
  os_type           = "cloud-init"
  full_clone        = true
  cores             = 2
  memory            = 2048
  scsihw            = "virtio-scsi-pci"
  sshkeys           = file(var.ssh_file)

  network {
    model           = "virtio"
    bridge          = "vmbr2"
  }

  disk {
    type            = "scsi"
    storage         = var.pm_storage
    size            = "14G"
    ssd             = 1
  }

  agent              = 0
  guest_agent_ready_timeout = 90
}
