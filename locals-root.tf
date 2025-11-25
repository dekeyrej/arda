locals {
  node = "iluvatar"
  gateway = "192.168.86.1"
  ssh_keys = [trimspace(data.local_file.ssh_public_key.content)]
  playbooks = {
    kubernetes = {
      name = "kubernetes"
      path = "ansible_playbooks/kubernetes_cluster.yaml"
      playbook_tags = ["fellowship:install", "fellowship:assemble", "fellowship:configure", "fellowship:services", "fellowship:deploy", "fellowship:IOT" ]
    }
    vault = {
      name = "vault"
      path = "ansible_playbooks/hashicorp-vault-install.yaml"
      playbook_tags = [ "vault:install", "vault:kubevault" ]
    }
    bellman = {
      name = "bellman"
      path = "ansible_playbooks/bellman.yaml"
      playbook_tags = [ "bellman:install" ]
    }
    seer = {
      name = "seer"
      path = "ansible_playbooks/seer.yaml"
      playbook_tags = [ "seer:install" ]
    }
    wind_walker = {
      name = "wind_walker"
      path = "ansible_playbooks/wind_walker.yaml"
      playbook_tags = [ "wind_walker:install" ]
    }
  }
  images = {
    kvm = {
      ubuntu = {
        "24" = "local:import/ubuntu-24.04-cloudimg-amd64.qcow2",
        "25" = "local:import/ubuntu-25.10-cloudimg-amd64.qcow2"
      },
      debian = {
        "12" = "local:import/debian-12-generic-amd64.qcow2",
        "13" = "local:import/debian-13-generic-amd64.qcow2"
      },
      centos = {
        "9" = "local:import/centos-9-stream-latest-x86_64.qcow2",
        "10" = "local:import/centos-10-stream-latest-x86_64.qcow2"
      },
      amazon = {
        "2" = "local:import/amzn2-kvm-x86_64.xfs.gpt.qcow2",
        "2023" = "local:import/al2023-kvm-x86_64.xfs.gpt.qcow2"
      }
    },
    lxc = {
      ubuntu = {
        "24" = "local:vztmpl/ubuntu-noble-latest-custom.tar.xz",
        "25" = "local:vztmpl/ubuntu-questing-latest-custom.tar.xz"
      },
      debian = {
        "12" = "local:vztmpl/debian-bookworm-latest-custom.tar.xz",
        "13" = "local:vztmpl/debian-trixie-latest-custom.tar.xz"
      },
      centos = {
        "9" = "local:vztmpl/centos-9-stream-latest-custom.tar.xz",
        "10" = "local:vztmpl/centos-10-stream-latest-custom.tar.xz"
      }
    }
  }
  # pools = {
  #   "Lothlorien" = {
  #     name = "Lothlorien"
  #     description = "The Lothlorien Pool"
  #   }
  #   "MistyMountains" = {
  #     name = "MistyMountains"
  #     description = "The Misty Mountains Pool"
  #   }
  #   "Rohan" = {
  #     name = "Rohan"
  #     description = "The Rohan Pool"
  #   }
  #   "Shire" = {
  #     name = "Shire"
  #     description = "The Shire Pool"
  #   }
  #   "Valinor" = {
  #     name = "Valinor"
  #     description = "The Valinor Pool"
  #   }
  # }
}

output "node" {
  value = local.node
}

output "gateway" {
  value = local.gateway
}

output "ssh_public_key" {
  value = local.ssh_keys
}

output "playbooks" {
  value = local.playbooks
}

output "images" {
  value = local.images
}

# output "pools" {
#   value = local.pools
# }