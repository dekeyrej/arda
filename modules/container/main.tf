terraform {
  required_providers {
    proxmox = {
        source = "bpg/proxmox"
        version = ">=0.86.0"
    }
  }
}

resource "proxmox_virtual_environment_container" "container" {
  start_on_boot = true
  unprivileged = true
  node_name = var.node
  protection = var.protection
  # pool_id = var.pool

  vm_id = var.vmid > 100 ? var.vmid : null

  description = <<-EOT
    ### ${var.name} @ ${var.static_ip}
    - Managed by Terraform
    - Running **${var.os}**
    
    | **Resource** | Value |
    | --- | --- |
    | **Cores** | ${var.cores} |
    | **Memory** | ${var.memory} |
    | **Boot Disk** | SCSI0 - ${var.disk}G |
  EOT

  initialization {
    hostname     = var.name
    ip_config {
      ipv4 {
        address = var.static_ip != "dhcp" ? "${var.static_ip}/24" : "dhcp"
        gateway = var.static_ip != "dhcp" ? var.gateway : null
      }
    }

    user_account {
      keys = var.ssh_public_key
    }
  }

  network_interface {
    name = var.network_interface
  }

  cpu {
    cores = var.cores
  }

  memory {
    dedicated = var.memory
    swap = var.swap
  }

  operating_system {
    template_file_id = var.template
    type             = var.os
  }

  disk {
    datastore_id = var.diskpool
    size         = var.disk
  }

  # hook_script_file_id = var.hookscript != "" ? var.hookscript : null
}
