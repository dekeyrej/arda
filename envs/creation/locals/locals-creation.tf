locals {
  tranche = "all"
  protection = true  # for testing, otherwise true
  vis = {
    manwe = {
        name = "manwe"
        fqdn = "manwe.local"
        type = "kvm"
        vmid = 100
        os = "ubuntu"
        release = "24"
        static_ip = "192.168.86.10"
        cores = 4
        memory = 16384
        diskpool = "local-lvm"
        bootdisk =  50
        // extradisk = 0
        pool = "Valinor"
        groups = ["orchestrator"]
        playbook = "wind_walker"
        host_tags = [ "wind_walker:install" ]
    }
  }
  dependencies = {
    manwe = {
      "wind_walker:install" = [ "module.virtual_machines[\"manwe\"]" ]}
  }
}

# envs/0-creation/outputs.tf
output "tranche" {
  value = local.tranche
}

output "protection" {
  value = local.protection
}

output "vis" {
  value = local.vis
}

output "dependencies" {
  value = local.dependencies
}