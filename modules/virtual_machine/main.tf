terraform {
  required_providers {
    proxmox = {
        source = "bpg/proxmox"
        version = ">=0.86.0"
    }
  }
}

resource "proxmox_virtual_environment_vm" "virtual_machine" {
  on_boot = true
  stop_on_destroy = true
  node_name = var.node
  # pool_id = var.pool
  protection = var.protection

  name      = var.name
  vm_id     = var.vmid > 100 ? var.vmid : null
  description = <<-EOT
    ### ${var.name} @ ${var.static_ip}
    - Managed by Terraform
    - Running **${var.os}**

    | **Resource** | Value |
    | --- | --- |
    | **Cores** | ${var.cores} |
    | **Memory** | ${var.memory} |
    | **Boot Disk** | SCSI0 - ${var.bootdisk}G |
    | **Extra Disk** | SCSI1 - ${var.extradisk}G |
  EOT

  initialization {
    datastore_id = var.diskpool
    ip_config {
      ipv4 {
        address = var.static_ip != "dhcp" ? "${var.static_ip}/24" : "dhcp"
        gateway = var.static_ip != "dhcp" ? var.gateway : null
      }
    }

    user_account {
      username = var.os
      keys = var.ssh_public_key
    }
  }
  
  network_device {
    bridge = var.network_bridge
  }  
  
  cpu {
    cores = var.cores
    sockets = 1
    type = var.cpu_type
  }

  memory {
    dedicated = var.memory
    floating  = var.memory
  }

  operating_system {
    type = var.ostype
  }

  disk {
    datastore_id = var.diskpool
    import_from  = var.template
    interface    = "scsi0"
    ssd          = true
    size         = var.bootdisk
  }

  dynamic "disk" {
    for_each = var.extradisk > 0 ? [1] : []
    content {
      datastore_id = var.diskpool
      interface    = "scsi1"
      ssd          = true
      size         = var.extradisk
    }
  }

  serial_device {}
}
