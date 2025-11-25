locals {
  tranche = "dev"
  protection = false  # for testing, otherwise true
  vis = {
    samwise = {
        name = "samwise"
        fqdn = "samwise.local"
        type = "kvm"
        vmid = 411
        os = "ubuntu"
        release = "24"
        static_ip = "192.168.86.91"
        cores = 4
        memory = 8192
        bootdisk =  20
        extradisk = 0
        diskpool = "nvme_pool"
        pool = "Shire"
        groups = ["kubernetes","main"]
        playbook = "kubernetes"
        host_tags = [ "fellowship:install", "fellowship:configure", "fellowship:services", "fellowship:deploy" ]
    }
    pippin = {
        name = "pippin"
        fqdn = "pippin.local"
        type = "kvm"
        vmid = 412
        os = "ubuntu"
        release = "24"
        static_ip = "192.168.86.92"
        cores = 4
        memory = 8192
        bootdisk =  20
        extradisk = 0
        diskpool = "nvme_pool"
        pool = "Shire"
        groups = ["kubernetes","nodes"]
        playbook = "kubernetes"
        host_tags = [ "fellowship:install", "fellowship:assemble", "fellowship:configure" ]
    }
    merry = {
        name = "merry"
        fqdn = "merry.local"
        type = "kvm"
        vmid = 413
        os = "ubuntu"
        release = "24"
        static_ip = "192.168.86.93"
        cores = 4
        memory = 8192
        bootdisk =  20
        extradisk = 0
        diskpool = "nvme_pool"
        pool = "Shire"
        groups = ["kubernetes","nodes"]
        playbook = "kubernetes"
        host_tags = [ "fellowship:install", "fellowship:assemble", "fellowship:configure" ]
    }
    rose = {
        name = "rose"
        fqdn = "rose.local"
        type = "lxc"
        vmid = 214
        os = "ubuntu"
        release = "24"
        static_ip = "192.168.86.94"
        cores = 2
        memory = 2048
        disk = 10
        diskpool = "nvme_pool"
        pool = "Shire"
        groups = ["vaults"]
        playbook = "vault"
        host_tags = [ "vault:install", "vault:kubevault" ]
    }
  }
  dependencies = {
    samwise = {
      "fellowship:install" = [],
      "fellowship:configure" = [ "ansible_playbook.merry-kubernetes-2-of-6" ],
      "fellowship:services" = [ "ansible_playbook.samwise-kubernetes-3-of-6", "ansible_playbook.pippin-kubernetes-3-of-6", "ansible_playbook.merry-kubernetes-3-of-6" ],
      "fellowship:deploy" = [ "ansible_playbook.rose-vault-2-of-2" ]
    },
    pippin = {
      "fellowship:install" = [],
      "fellowship:assemble" = [ "ansible_playbook.pippin-kubernetes-1-of-6", "ansible_playbook.samwise-kubernetes-1-of-6" ],
      "fellowship:configure" = [ "ansible_playbook.merry-kubernetes-2-of-6" ]
    },
    merry = {
      "fellowship:install" = [],
      "fellowship:assemble" = [ "ansible_playbook.merry-kubernetes-1-of-6", "ansible_playbook.pippin-kubernetes-2-of-6" ],
      "fellowship:configure" = [ "ansible_playbook.merry-kubernetes-2-of-6" ]
    },
    rose = {
      "vault:install" = [],
      "vault:kubevault" = [ "ansible_playbook.rose-vault-1-of-2", "ansible_playbook.samwise-kubernetes-4-of-6" ]
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