terraform {
  required_providers {
    ansible = {
      source  = "ansible/ansible"
      version = "~> 1.3.0"
    }
  }
}

# samwise enters fellowship:install — dependent on 0 prior incantations
resource "ansible_playbook" "samwise-kubernetes-1-of-6" {
  # dependency info
  depends_on = [  
  ]
  # inventory info
  name       = "samwise"
  groups     = ["kubernetes", "main"]
  # playbook info
  playbook   = "${path.module}/../../../ansible_playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:install"]
  
  var_files  = [
    "${path.module}/../../../inventory/group_vars/all.yml",
    "${path.module}/../../../inventory/group_vars/dev.yml",
    "${path.module}/../../../inventory/host_vars/samwise.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_samwise-kubernetes-1-of-6-stdout" {
  depends_on = [ ansible_playbook.samwise-kubernetes-1-of-6 ]
  value = ansible_playbook.samwise-kubernetes-1-of-6.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_samwise-kubernetes-1-of-6-stderr" {
  depends_on = [ ansible_playbook.samwise-kubernetes-1-of-6 ]
  value = ansible_playbook.samwise-kubernetes-1-of-6.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# samwise exits fellowship:install — dependent on 0 subsequent incantations
# samwise enters fellowship:configure — dependent on 1 prior incantations
resource "ansible_playbook" "samwise-kubernetes-3-of-6" {
  # dependency info
  depends_on = [
    ansible_playbook.merry-kubernetes-2-of-6  
  ]
  # inventory info
  name       = "samwise"
  groups     = ["kubernetes", "main"]
  # playbook info
  playbook   = "${path.module}/../../../ansible_playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:configure"]
  
  var_files  = [
    "${path.module}/../../../inventory/group_vars/all.yml",
    "${path.module}/../../../inventory/group_vars/dev.yml",
    "${path.module}/../../../inventory/host_vars/samwise.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_samwise-kubernetes-3-of-6-stdout" {
  depends_on = [ ansible_playbook.samwise-kubernetes-3-of-6 ]
  value = ansible_playbook.samwise-kubernetes-3-of-6.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_samwise-kubernetes-3-of-6-stderr" {
  depends_on = [ ansible_playbook.samwise-kubernetes-3-of-6 ]
  value = ansible_playbook.samwise-kubernetes-3-of-6.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# samwise exits fellowship:configure — dependent on 1 subsequent incantations
# samwise enters fellowship:services — dependent on 3 prior incantations
resource "ansible_playbook" "samwise-kubernetes-4-of-6" {
  # dependency info
  depends_on = [
    ansible_playbook.samwise-kubernetes-3-of-6,
    ansible_playbook.pippin-kubernetes-3-of-6,
    ansible_playbook.merry-kubernetes-3-of-6  
  ]
  # inventory info
  name       = "samwise"
  groups     = ["kubernetes", "main"]
  # playbook info
  playbook   = "${path.module}/../../../ansible_playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:services"]
  
  var_files  = [
    "${path.module}/../../../inventory/group_vars/all.yml",
    "${path.module}/../../../inventory/group_vars/dev.yml",
    "${path.module}/../../../inventory/host_vars/samwise.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_samwise-kubernetes-4-of-6-stdout" {
  depends_on = [ ansible_playbook.samwise-kubernetes-4-of-6 ]
  value = ansible_playbook.samwise-kubernetes-4-of-6.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_samwise-kubernetes-4-of-6-stderr" {
  depends_on = [ ansible_playbook.samwise-kubernetes-4-of-6 ]
  value = ansible_playbook.samwise-kubernetes-4-of-6.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# samwise exits fellowship:services — dependent on 3 subsequent incantations
# samwise enters fellowship:deploy — dependent on 1 prior incantations
resource "ansible_playbook" "samwise-kubernetes-5-of-6" {
  # dependency info
  depends_on = [
    ansible_playbook.rose-vault-2-of-2  
  ]
  # inventory info
  name       = "samwise"
  groups     = ["kubernetes", "main"]
  # playbook info
  playbook   = "${path.module}/../../../ansible_playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:deploy"]
  
  var_files  = [
    "${path.module}/../../../inventory/group_vars/all.yml",
    "${path.module}/../../../inventory/group_vars/dev.yml",
    "${path.module}/../../../inventory/host_vars/samwise.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_samwise-kubernetes-5-of-6-stdout" {
  depends_on = [ ansible_playbook.samwise-kubernetes-5-of-6 ]
  value = ansible_playbook.samwise-kubernetes-5-of-6.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_samwise-kubernetes-5-of-6-stderr" {
  depends_on = [ ansible_playbook.samwise-kubernetes-5-of-6 ]
  value = ansible_playbook.samwise-kubernetes-5-of-6.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# samwise exits fellowship:deploy — dependent on 1 subsequent incantations
# pippin enters fellowship:install — dependent on 0 prior incantations
resource "ansible_playbook" "pippin-kubernetes-1-of-6" {
  # dependency info
  depends_on = [  
  ]
  # inventory info
  name       = "pippin"
  groups     = ["kubernetes", "nodes"]
  # playbook info
  playbook   = "${path.module}/../../../ansible_playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:install"]
  
  var_files  = [
    "${path.module}/../../../inventory/group_vars/all.yml",
    "${path.module}/../../../inventory/group_vars/dev.yml",
    "${path.module}/../../../inventory/host_vars/pippin.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_pippin-kubernetes-1-of-6-stdout" {
  depends_on = [ ansible_playbook.pippin-kubernetes-1-of-6 ]
  value = ansible_playbook.pippin-kubernetes-1-of-6.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_pippin-kubernetes-1-of-6-stderr" {
  depends_on = [ ansible_playbook.pippin-kubernetes-1-of-6 ]
  value = ansible_playbook.pippin-kubernetes-1-of-6.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# pippin exits fellowship:install — dependent on 0 subsequent incantations
# pippin enters fellowship:assemble — dependent on 2 prior incantations
resource "ansible_playbook" "pippin-kubernetes-2-of-6" {
  # dependency info
  depends_on = [
    ansible_playbook.pippin-kubernetes-1-of-6,
    ansible_playbook.samwise-kubernetes-1-of-6  
  ]
  # inventory info
  name       = "pippin"
  groups     = ["kubernetes", "nodes"]
  # playbook info
  playbook   = "${path.module}/../../../ansible_playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:assemble"]
  
  var_files  = [
    "${path.module}/../../../inventory/group_vars/all.yml",
    "${path.module}/../../../inventory/group_vars/dev.yml",
    "${path.module}/../../../inventory/host_vars/pippin.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_pippin-kubernetes-2-of-6-stdout" {
  depends_on = [ ansible_playbook.pippin-kubernetes-2-of-6 ]
  value = ansible_playbook.pippin-kubernetes-2-of-6.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_pippin-kubernetes-2-of-6-stderr" {
  depends_on = [ ansible_playbook.pippin-kubernetes-2-of-6 ]
  value = ansible_playbook.pippin-kubernetes-2-of-6.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# pippin exits fellowship:assemble — dependent on 2 subsequent incantations
# pippin enters fellowship:configure — dependent on 1 prior incantations
resource "ansible_playbook" "pippin-kubernetes-3-of-6" {
  # dependency info
  depends_on = [
    ansible_playbook.merry-kubernetes-2-of-6  
  ]
  # inventory info
  name       = "pippin"
  groups     = ["kubernetes", "nodes"]
  # playbook info
  playbook   = "${path.module}/../../../ansible_playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:configure"]
  
  var_files  = [
    "${path.module}/../../../inventory/group_vars/all.yml",
    "${path.module}/../../../inventory/group_vars/dev.yml",
    "${path.module}/../../../inventory/host_vars/pippin.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_pippin-kubernetes-3-of-6-stdout" {
  depends_on = [ ansible_playbook.pippin-kubernetes-3-of-6 ]
  value = ansible_playbook.pippin-kubernetes-3-of-6.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_pippin-kubernetes-3-of-6-stderr" {
  depends_on = [ ansible_playbook.pippin-kubernetes-3-of-6 ]
  value = ansible_playbook.pippin-kubernetes-3-of-6.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# pippin exits fellowship:configure — dependent on 1 subsequent incantations
# merry enters fellowship:install — dependent on 0 prior incantations
resource "ansible_playbook" "merry-kubernetes-1-of-6" {
  # dependency info
  depends_on = [  
  ]
  # inventory info
  name       = "merry"
  groups     = ["kubernetes", "nodes"]
  # playbook info
  playbook   = "${path.module}/../../../ansible_playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:install"]
  
  var_files  = [
    "${path.module}/../../../inventory/group_vars/all.yml",
    "${path.module}/../../../inventory/group_vars/dev.yml",
    "${path.module}/../../../inventory/host_vars/merry.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_merry-kubernetes-1-of-6-stdout" {
  depends_on = [ ansible_playbook.merry-kubernetes-1-of-6 ]
  value = ansible_playbook.merry-kubernetes-1-of-6.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_merry-kubernetes-1-of-6-stderr" {
  depends_on = [ ansible_playbook.merry-kubernetes-1-of-6 ]
  value = ansible_playbook.merry-kubernetes-1-of-6.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# merry exits fellowship:install — dependent on 0 subsequent incantations
# merry enters fellowship:assemble — dependent on 2 prior incantations
resource "ansible_playbook" "merry-kubernetes-2-of-6" {
  # dependency info
  depends_on = [
    ansible_playbook.merry-kubernetes-1-of-6,
    ansible_playbook.pippin-kubernetes-2-of-6  
  ]
  # inventory info
  name       = "merry"
  groups     = ["kubernetes", "nodes"]
  # playbook info
  playbook   = "${path.module}/../../../ansible_playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:assemble"]
  
  var_files  = [
    "${path.module}/../../../inventory/group_vars/all.yml",
    "${path.module}/../../../inventory/group_vars/dev.yml",
    "${path.module}/../../../inventory/host_vars/merry.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_merry-kubernetes-2-of-6-stdout" {
  depends_on = [ ansible_playbook.merry-kubernetes-2-of-6 ]
  value = ansible_playbook.merry-kubernetes-2-of-6.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_merry-kubernetes-2-of-6-stderr" {
  depends_on = [ ansible_playbook.merry-kubernetes-2-of-6 ]
  value = ansible_playbook.merry-kubernetes-2-of-6.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# merry exits fellowship:assemble — dependent on 2 subsequent incantations
# merry enters fellowship:configure — dependent on 1 prior incantations
resource "ansible_playbook" "merry-kubernetes-3-of-6" {
  # dependency info
  depends_on = [
    ansible_playbook.merry-kubernetes-2-of-6  
  ]
  # inventory info
  name       = "merry"
  groups     = ["kubernetes", "nodes"]
  # playbook info
  playbook   = "${path.module}/../../../ansible_playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:configure"]
  
  var_files  = [
    "${path.module}/../../../inventory/group_vars/all.yml",
    "${path.module}/../../../inventory/group_vars/dev.yml",
    "${path.module}/../../../inventory/host_vars/merry.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_merry-kubernetes-3-of-6-stdout" {
  depends_on = [ ansible_playbook.merry-kubernetes-3-of-6 ]
  value = ansible_playbook.merry-kubernetes-3-of-6.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_merry-kubernetes-3-of-6-stderr" {
  depends_on = [ ansible_playbook.merry-kubernetes-3-of-6 ]
  value = ansible_playbook.merry-kubernetes-3-of-6.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# merry exits fellowship:configure — dependent on 1 subsequent incantations
# rose enters vault:install — dependent on 0 prior incantations
resource "ansible_playbook" "rose-vault-1-of-2" {
  # dependency info
  depends_on = [  
  ]
  # inventory info
  name       = "rose"
  groups     = ["vaults"]
  # playbook info
  playbook   = "${path.module}/../../../ansible_playbooks/hashicorp-vault-install.yaml"
  tags       = ["vault:install"]
  
  var_files  = [
    "${path.module}/../../../inventory/group_vars/all.yml",
    "${path.module}/../../../inventory/group_vars/dev.yml",
    "${path.module}/../../../inventory/host_vars/rose.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_rose-vault-1-of-2-stdout" {
  depends_on = [ ansible_playbook.rose-vault-1-of-2 ]
  value = ansible_playbook.rose-vault-1-of-2.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_rose-vault-1-of-2-stderr" {
  depends_on = [ ansible_playbook.rose-vault-1-of-2 ]
  value = ansible_playbook.rose-vault-1-of-2.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# rose exits vault:install — dependent on 0 subsequent incantations
# rose enters vault:kubevault — dependent on 2 prior incantations
resource "ansible_playbook" "rose-vault-2-of-2" {
  # dependency info
  depends_on = [
    ansible_playbook.rose-vault-1-of-2,
    ansible_playbook.samwise-kubernetes-4-of-6  
  ]
  # inventory info
  name       = "rose"
  groups     = ["vaults"]
  # playbook info
  playbook   = "${path.module}/../../../ansible_playbooks/hashicorp-vault-install.yaml"
  tags       = ["vault:kubevault"]
  
  var_files  = [
    "${path.module}/../../../inventory/group_vars/all.yml",
    "${path.module}/../../../inventory/group_vars/dev.yml",
    "${path.module}/../../../inventory/host_vars/rose.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_rose-vault-2-of-2-stdout" {
  depends_on = [ ansible_playbook.rose-vault-2-of-2 ]
  value = ansible_playbook.rose-vault-2-of-2.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_rose-vault-2-of-2-stderr" {
  depends_on = [ ansible_playbook.rose-vault-2-of-2 ]
  value = ansible_playbook.rose-vault-2-of-2.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# rose exits vault:kubevault — dependent on 2 subsequent incantations