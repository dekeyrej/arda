terraform {
  required_providers {
    proxmox = {
        source = "bpg/proxmox"
        version = ">=0.86.0"
    }
  }
}

variable "pool" {
  type        = string
  description = "Pool name for the VM"
}

variable "vmid" {
  type        = number
  description = "VM ID for the VM"
  default     = 0
}

resource "proxmox_virtual_environment_pool_membership" "pool_memberships" {
  pool_id = var.pool
  vm_id   = var.vmid
}