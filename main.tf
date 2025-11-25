variable "env" {
  description = "The environment to deploy (e.g., creation, dev, test, prod)"
  type        = string
}

locals {
  # node           = local.node
  # gateway        = local.gateway
  # ssh_public_key = local.ssh_keys
  # images         = local.images
  # protection     = module.env_locals.protection
  # vis            = module.env_locals.vis
  # diskpool       = module.env_locals.diskpool
  # playbooks      = local.playbooks

  tranche        = module.env_locals.tranche
  dependencies   = module.env_locals.dependencies
}

# common/main.tf
module "env_locals" {
  source = "./envs/${var.env}/locals"
}

module "ansible_playbooks" {
  source = "./envs/${var.env}/playbooks"

  depends_on = [ module.containers, module.virtual_machines ]
}

module "containers" {
  for_each = {
    for name, type in module.env_locals.vis : name => type if type.type == "lxc"
  }
  source   = "./modules/container"

  node           = local.node
  gateway        = local.gateway
  ssh_public_key = local.ssh_keys
  protection     = module.env_locals.protection
  name           = each.key
  vmid           = each.value.vmid
  static_ip      = each.value.static_ip
  cores          = each.value.cores
  memory         = each.value.memory
  template       = local.images["lxc"][each.value.os][each.value.release]
  os             = each.value.os
  diskpool       = each.value.diskpool
  disk           = each.value.disk
}

module "virtual_machines" {
  for_each = {
    for name, type in module.env_locals.vis : name => type if type.type == "kvm"
  }
  source   = "./modules/virtual_machine"

  node           = local.node
  gateway        = local.gateway
  ssh_public_key = local.ssh_keys
  protection     = module.env_locals.protection
  name           = each.key
  vmid           = each.value.vmid
  static_ip      = each.value.static_ip
  cores          = each.value.cores
  memory         = each.value.memory
  template       = local.images["kvm"][each.value.os][each.value.release]
  os             = each.value.os
  diskpool       = each.value.diskpool
  bootdisk       = each.value.bootdisk
  extradisk      = each.value.extradisk
}

data "local_file" "ssh_public_key" {
  filename = "/home/ubuntu/.ssh/id_rsa.pub"
  # filename = "/home/ubuntu/.ssh/authorized_keys"  # 'recently' Proxmox broke the ability to use authorized_keys file directly (multiple keys issue)
}

# module "pools" {
#   for_each = {
#     for key, pool in local.pools : key => pool
#   }
#   source   = "./modules/pools"

#   pool = each.value.name
# }

module "pool_memberships" {
  for_each = {
    for name, type in module.env_locals.vis : name => type
  }
  source   = "./modules/pool_memberships"

  # depends_on = [ module.pools ]

  pool = each.value.pool
  vmid = each.value.vmid
}

output "all_nodes_info" {
  value = merge(
    {
      for name, module in module.containers :
      name => {
        vm_id      = module.vm_id
        hostname   = module.hostname
        ip_address = module.ip_address
        os         = module.os
        type       = module.type
      }
    },
    {
      for name, module in module.virtual_machines :
      name => {
        vm_id      = module.vm_id
        hostname   = module.hostname
        ip_address = module.ip_address
        os         = module.os
        type       = module.type
      }
    }
  )
}

## tofu output -json all_nodes_info | jq -r 'to_entries[] | "\(.key) \(.value.ip_address)"' > inventory
## tofu output -json all_nodes_info | jq -r 'to_entries[] | "\(.key) static_ip=\(.value.ip_address | split("/")[0]) vmid=\(.value.vm_id) type=\(.value.type) os=\(.value.os)"' > inventory
