locals {
  tranche = "prod"
  protection = true  # for testing, otherwise true
  vis = {
    aragorn = {
        name = "aragorn"
        fqdn = "aragorn.local"
        type = "kvm"
        vmid = 304
        os = "ubuntu"
        release = "24"
        static_ip = "192.168.86.3"
        cores = 4
        memory = 8192
        diskpool = "nvme_pool"
        bootdisk =  20
        extradisk = 0
        pool = "Lothlorien"
        groups = ["kubernetes","main"]
        playbook = "kubernetes"
        host_tags = [ "fellowship:install", "fellowship:configure", "fellowship:services", "fellowship:deploy", "fellowship:IOT" ]
    }
    legolas = {
        name = "legolas"
        fqdn = "legolas.local"
        type = "kvm"
        vmid = 302
        os = "ubuntu"
        release = "24"
        static_ip = "192.168.86.4"
        cores = 4
        memory = 8192
        bootdisk =  20
        extradisk = 0
        diskpool = "nvme_pool"
        pool = "Lothlorien"
        groups = ["kubernetes","nodes"]
        playbook = "kubernetes"
        host_tags = [ "fellowship:install", "fellowship:assemble", "fellowship:configure" ]
    }
    gimli = {
        name = "gimli"
        fqdn = "gimli.local"
        type = "kvm"
        vmid = 303
        os = "ubuntu"
        release = "24"
        static_ip = "192.168.86.5"
        cores = 4
        memory = 8192
        bootdisk =  20
        extradisk = 0
        diskpool = "nvme_pool"
        pool = "Lothlorien"
        groups = ["kubernetes","nodes"]
        playbook = "kubernetes"
        host_tags = [ "fellowship:install", "fellowship:assemble", "fellowship:configure" ]
    }
    moria = {
        name = "moria"
        fqdn = "moria.local"
        type = "lxc"
        vmid = 102
        os = "ubuntu"
        release = "24"
        static_ip = "192.168.86.9"
        cores = 2
        memory = 2048
        disk = 10
        diskpool = "nvme_pool"
        pool = "MistyMountains"
        groups = ["vaults"]
        playbook = "vault"
        host_tags = [ "vault:install", "vault:kubevault" ]
    }
    gandalf = {
        name = "gandalf"
        fqdn = "gandalf.local"
        type = "lxc"
        vmid = 101
        os = "ubuntu"
        release = "24"
        static_ip = "192.168.86.8"
        cores = 2
        memory = 2048
        disk = 10
        diskpool = "nvme_pool"
        pool = "Lothlorien"
        groups = ["bellman"]
        playbook = "bellman"
        host_tags = [ "bellman:install" ]
    }
    galadriel = {
        name = "galadriel"
        fqdn = "galadriel.local"
        type = "lxc"
        vmid = 103
        os = "ubuntu"
        release = "24"
        static_ip = "192.168.86.11"
        cores = 8
        memory = 16384
        disk = 100
        diskpool = "nvme_pool"
        pool = "Lothlorien"
        groups = ["seer"]
        playbook = "seer"
        host_tags = [ "seer:install" ]
    }
  }
  dependencies = {
    aragorn = {
      "fellowship:configure" = [ "ansible_playbook.gimli-kubernetes-2-of-6" ],
      "fellowship:services" = [ "ansible_playbook.aragorn-kubernetes-3-of-6", "ansible_playbook.legolas-kubernetes-3-of-6", "ansible_playbook.gimli-kubernetes-3-of-6" ],
      "fellowship:deploy" = [ "ansible_playbook.moria-vault-2-of-2" ],
      "fellowship:IOT" = [ "ansible_playbook.aragorn-kubernetes-5-of-6" ]
    },
    legolas = {
      "fellowship:assemble" = [ "ansible_playbook.legolas-kubernetes-1-of-6", "ansible_playbook.aragorn-kubernetes-1-of-6" ],
      "fellowship:configure" = [ "ansible_playbook.gimli-kubernetes-2-of-6" ]
    },
    gimli = {
      "fellowship:assemble" = [ "ansible_playbook.gimli-kubernetes-1-of-6", "ansible_playbook.legolas-kubernetes-2-of-6" ],
      "fellowship:assemble" = [ "ansible_playbook.gimli-kubernetes-1-of-6", "ansible_playbook.legolas-kubernetes-2-of-6" ],
      "fellowship:configure" = [ "ansible_playbook.gimli-kubernetes-2-of-6" ]
    },
    moria = {
      "vault:kubevault" = [ "ansible_playbook.moria-vault-1-of-2", "ansible_playbook.aragorn-kubernetes-4-of-6" ]
    },
    gandalf = {"bellman:install" = []},
    galadriel = {"seer:install" = []}  
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
