terraform {
  required_providers {
    proxmox = {
        source = "bpg/proxmox"
        version = ">=0.86.0"
    }
  }
}

resource "proxmox_virtual_environment_pool" "pools" {
  pool_id = var.pool
}

variable "pool" {
  type        = string
  description = "Pool name for the container"
}