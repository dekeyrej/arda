variable "node" {
  type        = string
  description = "Proxmox node to deploy on"
}

variable "protection" {
  type        = bool
  description = "Enable protection for the container"
  default     = false
}

variable "vmid" {
  type        = number
  description = "Unique VMID for the container"
  default     = 0
}

variable "name" {
  type        = string
  description = "Hostname of the VM"
}

variable "static_ip" {
  type        = string
  description = "Static IP address for the VM"
  default     = "dhcp"
}

variable "gateway" {
  type        = string
  description = "Gateway for the VM"
  default     = "192.168.86.1"
}

variable "network_bridge" {
  type        = string
  description = "Network bridge to use"
  default     = "vmbr0"
}

variable "cores" {
  type        = number
  default     = 2
}

variable "cpu_type" {
  type        = string
  description = "CPU type for the VM"
  default     = "host"
}

variable "memory" {
  type        = number
  default     = 2048
}

variable "swap" {
  type        = number
  default     = 0
}

variable "template" {
  type        = string
  description = "VM Diskimage to use"
  default     = "local:import/noble-server-cloudimg-amd64.qcow2"
}

variable "ostype" {
  type        = string
  description = "Operating system type"
  default     = "l26"
}

variable "os" {
  type        = string
  description = "Operating system name"
  default     = "ubuntu"
} 

variable "diskpool" {
  type        = string
  description = "Storage pool for the VM disk"
  default     = "local-lvm"
}

variable "bootdisk" {
  type        = number
  default     = 10
  description = "Disk size in GB"  
}

variable "extradisk" {
  type        = number
  default     = 0
  description = "Disk size in GB"  
}

variable "ssh_public_key" {
  type        = list(string)
  description = "SSH public key for user access"
}
