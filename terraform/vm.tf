resource "proxmox_virtual_environment_vm" "talos_cp_01" {
  name        = "talos-cp-0"
  description = "Managed by Terraform, talos"
  tags        = ["talos"]
  node_name   = "pve"
  vm_id       = 1110
  on_boot     = true


  cpu {
    cores = 4
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = 4096
  }

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr0"
  }

  disk {
    datastore_id = "pve-nvme"
    file_id      = proxmox_virtual_environment_download_file.talos_nocloud_image.id
    file_format  = "raw"
    interface    = "virtio0"
    size         = 20
  }

  operating_system {
    type = "l26" # Linux Kernel 2.6 - 5.X.
  }

  initialization {
    datastore_id = "pve-nvme"
    ip_config {
      ipv4 {
        address = "${var.talos_cp_01_ip_addr}/24"
        gateway = var.default_gateway
      }
      ipv6 {
        address = "dhcp"
      }
    }
  }
}

resource "proxmox_virtual_environment_vm" "talos_cp_02" {
  name        = "talos-cp-1"
  description = "Managed by Terraform, talos"
  tags        = ["talos"]
  node_name   = "pve"
  vm_id       = 1111
  on_boot     = true


  cpu {
    cores = 4
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = 4096
  }

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr0"
  }

  disk {
    datastore_id = "pve-nvme"
    file_id      = proxmox_virtual_environment_download_file.talos_nocloud_image_iscsi.id
    file_format  = "raw"
    interface    = "virtio0"
    size         = 20
  }

  operating_system {
    type = "l26" # Linux Kernel 2.6 - 5.X.
  }

  initialization {
    datastore_id = "pve-nvme"
    ip_config {
      ipv4 {
        address = "${var.talos_cp_02_ip_addr}/24"
        gateway = var.default_gateway
      }
      ipv6 {
        address = "dhcp"
      }
    }
  }
}

resource "proxmox_virtual_environment_vm" "talos_cp_03" {
  name        = "talos-cp-2"
  description = "Managed by Terraform, talos"
  tags        = ["talos"]
  node_name   = "pve"
  vm_id       = 1112
  on_boot     = true


  cpu {
    cores = 4
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = 4096
  }

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr0"
  }

  disk {
    datastore_id = "pve-nvme"
    file_id      = proxmox_virtual_environment_download_file.talos_nocloud_image_iscsi.id
    file_format  = "raw"
    interface    = "virtio0"
    size         = 20
  }

  operating_system {
    type = "l26" # Linux Kernel 2.6 - 5.X.
  }

  initialization {
    datastore_id = "pve-nvme"
    ip_config {
      ipv4 {
        address = "${var.talos_cp_03_ip_addr}/24"
        gateway = var.default_gateway
      }
      ipv6 {
        address = "dhcp"
      }
    }
  }
}

resource "proxmox_virtual_environment_vm" "talos_worker_01" {
  depends_on  = [proxmox_virtual_environment_vm.talos_cp_01]
  name        = "talos-worker-0"
  description = "Managed by Terraform"
  tags        = ["talos"]
  node_name   = "pve"
  vm_id       = 1113
  on_boot     = true


  cpu {
    cores = 4
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = 4096
  }

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr0"
  }

  disk {
    datastore_id = "pve-nvme"
    file_id      = proxmox_virtual_environment_download_file.talos_nocloud_image.id
    file_format  = "raw"
    interface    = "virtio0"
    size         = 20
  }

  operating_system {
    type = "l26" # Linux Kernel 2.6 - 5.X.
  }

  initialization {
    datastore_id = "pve-nvme"
    ip_config {
      ipv4 {
        address = "${var.talos_worker_01_ip_addr}/24"
        gateway = var.default_gateway
      }
      ipv6 {
        address = "dhcp"
      }
    }
  }
}