terraform {
  required_version = "~> 1.10"
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = ">=0.87.0"
    }
    ansible = {
      source  = "ansible/ansible"
      version = "~> 1.3.0"
    }
  }
}