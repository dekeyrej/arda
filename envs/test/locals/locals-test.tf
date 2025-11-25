locals {
  tranche = "test"
  protection = false  # for testing, otherwise true
  vis = {
    theoden = {
        name = "theoden"
        fqdn = "theoden.local"
        type = "kvm"
        vmid = 410
        os = "ubuntu"
        release = "24"
        static_ip = "192.168.86.100"
        cores = 4
        memory = 8192
        diskpool = "nvme_pool"
        bootdisk =  20
        extradisk = 0
        pool = "Rohan"
        groups = ["kubernetes","main"]
        playbook = "kubernetes"
        host_tags = [ "fellowship:install", "fellowship:configure", "fellowship:services", "fellowship:deploy" ]
    }
    eomer = {
        name = "eomer"
        fqdn = "eomer.local"
        type = "kvm"
        vmid = 411
        os = "ubuntu"
        release = "24"
        static_ip = "192.168.86.101"
        cores = 4
        memory = 8192
        bootdisk =  20
        extradisk = 0
        diskpool = "nvme_pool"
        pool = "Rohan"
        groups = ["kubernetes","nodes"]
        playbook = "kubernetes"
        host_tags = [ "fellowship:install", "fellowship:assemble", "fellowship:configure" ]
    }
    eowyn = {
        name = "eowyn"
        fqdn = "eowyn.local"
        type = "kvm"
        vmid = 412
        os = "ubuntu"
        release = "24"
        static_ip = "192.168.86.102"
        cores = 4
        memory = 8192
        bootdisk =  20
        extradisk = 0
        diskpool = "nvme_pool"
        pool = "Rohan"
        groups = ["kubernetes","nodes"]
        playbook = "kubernetes"
        host_tags = [ "fellowship:install", "fellowship:assemble", "fellowship:configure" ]
    }
    faramir = {
        name = "faramir"
        fqdn = "faramir.local"
        type = "lxc"
        vmid = 210
        os = "ubuntu"
        release = "24"
        static_ip = "192.168.86.97"
        cores = 2
        memory = 2048
        disk = 10
        diskpool = "nvme_pool"
        pool = "Rohan"
        groups = ["vaults"]
        playbook = "vault"
        host_tags = [ "vault:install", "vault:kubevault" ]
    }
  }
  dependencies = {
    theoden = {
      "fellowship:configure" = [ "ansible_playbook.eowyn-kubernetes-2-of-6" ],
      "fellowship:services" = [ "ansible_playbook.theoden-kubernetes-3-of-6", "ansible_playbook.eomer-kubernetes-3-of-6", "ansible_playbook.eowyn-kubernetes-3-of-6" ],
      "fellowship:deploy" = [ "ansible_playbook.faramir-vault-2-of-2" ]
    },
    eomer = {
      "fellowship:assemble" = [ "ansible_playbook.eomer-kubernetes-1-of-6", "ansible_playbook.theoden-kubernetes-1-of-6" ],
      "fellowship:configure" = [ "ansible_playbook.eowyn-kubernetes-2-of-6" ]
    },
    eowyn = {
      "fellowship:assemble" = [ "ansible_playbook.eowyn-kubernetes-1-of-6", "ansible_playbook.eomer-kubernetes-2-of-6" ],
      "fellowship:configure" = [ "ansible_playbook.eowyn-kubernetes-2-of-6" ]
    },
    faramir = {
      "vault:kubevault" = [ "ansible_playbook.faramir-vault-1-of-2", "ansible_playbook.theoden-kubernetes-4-of-6" ]
    }
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
