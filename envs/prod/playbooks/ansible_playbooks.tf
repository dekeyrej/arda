terraform {
  required_providers {
    ansible = {
      source  = "ansible/ansible"
      version = "~> 1.3.0"
    }
  }
}

# aragorn enters fellowship:install — dependent on 0 prior incantations
resource "ansible_playbook" "aragorn-kubernetes-1-of-6" {
  # dependency info
  depends_on = [  
  ]
  # inventory info
  name       = "aragorn"
  groups     = ["kubernetes", "main"]
  # playbook info
  playbook   = "${path.module}/../../../ansible_playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:install"]
  
  var_files  = [
    "${path.module}/../../../inventory/group_vars/all.yml",
    "${path.module}/../../../inventory/group_vars/prod.yml",
    "${path.module}/../../../inventory/host_vars/aragorn.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_aragorn-kubernetes-1-of-6-stdout" {
  depends_on = [ ansible_playbook.aragorn-kubernetes-1-of-6 ]
  value = ansible_playbook.aragorn-kubernetes-1-of-6.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_aragorn-kubernetes-1-of-6-stderr" {
  depends_on = [ ansible_playbook.aragorn-kubernetes-1-of-6 ]
  value = ansible_playbook.aragorn-kubernetes-1-of-6.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# aragorn exits fellowship:install — dependent on 0 subsequent incantations
# aragorn enters fellowship:configure — dependent on 1 prior incantations
resource "ansible_playbook" "aragorn-kubernetes-3-of-6" {
  # dependency info
  depends_on = [
    ansible_playbook.gimli-kubernetes-2-of-6  
  ]
  # inventory info
  name       = "aragorn"
  groups     = ["kubernetes", "main"]
  # playbook info
  playbook   = "${path.module}/../../../ansible_playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:configure"]
  
  var_files  = [
    "${path.module}/../../../inventory/group_vars/all.yml",
    "${path.module}/../../../inventory/group_vars/prod.yml",
    "${path.module}/../../../inventory/host_vars/aragorn.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_aragorn-kubernetes-3-of-6-stdout" {
  depends_on = [ ansible_playbook.aragorn-kubernetes-3-of-6 ]
  value = ansible_playbook.aragorn-kubernetes-3-of-6.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_aragorn-kubernetes-3-of-6-stderr" {
  depends_on = [ ansible_playbook.aragorn-kubernetes-3-of-6 ]
  value = ansible_playbook.aragorn-kubernetes-3-of-6.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# aragorn exits fellowship:configure — dependent on 1 subsequent incantations
# aragorn enters fellowship:services — dependent on 3 prior incantations
resource "ansible_playbook" "aragorn-kubernetes-4-of-6" {
  # dependency info
  depends_on = [
    ansible_playbook.aragorn-kubernetes-3-of-6,
    ansible_playbook.legolas-kubernetes-3-of-6,
    ansible_playbook.gimli-kubernetes-3-of-6  
  ]
  # inventory info
  name       = "aragorn"
  groups     = ["kubernetes", "main"]
  # playbook info
  playbook   = "${path.module}/../../../ansible_playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:services"]
  
  var_files  = [
    "${path.module}/../../../inventory/group_vars/all.yml",
    "${path.module}/../../../inventory/group_vars/prod.yml",
    "${path.module}/../../../inventory/host_vars/aragorn.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_aragorn-kubernetes-4-of-6-stdout" {
  depends_on = [ ansible_playbook.aragorn-kubernetes-4-of-6 ]
  value = ansible_playbook.aragorn-kubernetes-4-of-6.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_aragorn-kubernetes-4-of-6-stderr" {
  depends_on = [ ansible_playbook.aragorn-kubernetes-4-of-6 ]
  value = ansible_playbook.aragorn-kubernetes-4-of-6.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# aragorn exits fellowship:services — dependent on 3 subsequent incantations
# aragorn enters fellowship:deploy — dependent on 1 prior incantations
resource "ansible_playbook" "aragorn-kubernetes-5-of-6" {
  # dependency info
  depends_on = [
    ansible_playbook.moria-vault-2-of-2  
  ]
  # inventory info
  name       = "aragorn"
  groups     = ["kubernetes", "main"]
  # playbook info
  playbook   = "${path.module}/../../../ansible_playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:deploy"]
  
  var_files  = [
    "${path.module}/../../../inventory/group_vars/all.yml",
    "${path.module}/../../../inventory/group_vars/prod.yml",
    "${path.module}/../../../inventory/host_vars/aragorn.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_aragorn-kubernetes-5-of-6-stdout" {
  depends_on = [ ansible_playbook.aragorn-kubernetes-5-of-6 ]
  value = ansible_playbook.aragorn-kubernetes-5-of-6.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_aragorn-kubernetes-5-of-6-stderr" {
  depends_on = [ ansible_playbook.aragorn-kubernetes-5-of-6 ]
  value = ansible_playbook.aragorn-kubernetes-5-of-6.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# aragorn exits fellowship:deploy — dependent on 1 subsequent incantations
# aragorn enters fellowship:IOT — dependent on 1 prior incantations
resource "ansible_playbook" "aragorn-kubernetes-6-of-6" {
  # dependency info
  depends_on = [
    ansible_playbook.aragorn-kubernetes-5-of-6  
  ]
  # inventory info
  name       = "aragorn"
  groups     = ["kubernetes", "main"]
  # playbook info
  playbook   = "${path.module}/../../../ansible_playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:IOT"]
  
  var_files  = [
    "${path.module}/../../../inventory/group_vars/all.yml",
    "${path.module}/../../../inventory/group_vars/prod.yml",
    "${path.module}/../../../inventory/host_vars/aragorn.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_aragorn-kubernetes-6-of-6-stdout" {
  depends_on = [ ansible_playbook.aragorn-kubernetes-6-of-6 ]
  value = ansible_playbook.aragorn-kubernetes-6-of-6.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_aragorn-kubernetes-6-of-6-stderr" {
  depends_on = [ ansible_playbook.aragorn-kubernetes-6-of-6 ]
  value = ansible_playbook.aragorn-kubernetes-6-of-6.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# aragorn exits fellowship:IOT — dependent on 1 subsequent incantations
# legolas enters fellowship:install — dependent on 0 prior incantations
resource "ansible_playbook" "legolas-kubernetes-1-of-6" {
  # dependency info
  depends_on = [  
  ]
  # inventory info
  name       = "legolas"
  groups     = ["kubernetes", "nodes"]
  # playbook info
  playbook   = "${path.module}/../../../ansible_playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:install"]
  
  var_files  = [
    "${path.module}/../../../inventory/group_vars/all.yml",
    "${path.module}/../../../inventory/group_vars/prod.yml",
    "${path.module}/../../../inventory/host_vars/legolas.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_legolas-kubernetes-1-of-6-stdout" {
  depends_on = [ ansible_playbook.legolas-kubernetes-1-of-6 ]
  value = ansible_playbook.legolas-kubernetes-1-of-6.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_legolas-kubernetes-1-of-6-stderr" {
  depends_on = [ ansible_playbook.legolas-kubernetes-1-of-6 ]
  value = ansible_playbook.legolas-kubernetes-1-of-6.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# legolas exits fellowship:install — dependent on 0 subsequent incantations
# legolas enters fellowship:assemble — dependent on 2 prior incantations
resource "ansible_playbook" "legolas-kubernetes-2-of-6" {
  # dependency info
  depends_on = [
    ansible_playbook.legolas-kubernetes-1-of-6,
    ansible_playbook.aragorn-kubernetes-1-of-6  
  ]
  # inventory info
  name       = "legolas"
  groups     = ["kubernetes", "nodes"]
  # playbook info
  playbook   = "${path.module}/../../../ansible_playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:assemble"]
  
  var_files  = [
    "${path.module}/../../../inventory/group_vars/all.yml",
    "${path.module}/../../../inventory/group_vars/prod.yml",
    "${path.module}/../../../inventory/host_vars/legolas.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_legolas-kubernetes-2-of-6-stdout" {
  depends_on = [ ansible_playbook.legolas-kubernetes-2-of-6 ]
  value = ansible_playbook.legolas-kubernetes-2-of-6.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_legolas-kubernetes-2-of-6-stderr" {
  depends_on = [ ansible_playbook.legolas-kubernetes-2-of-6 ]
  value = ansible_playbook.legolas-kubernetes-2-of-6.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# legolas exits fellowship:assemble — dependent on 2 subsequent incantations
# legolas enters fellowship:configure — dependent on 1 prior incantations
resource "ansible_playbook" "legolas-kubernetes-3-of-6" {
  # dependency info
  depends_on = [
    ansible_playbook.gimli-kubernetes-2-of-6  
  ]
  # inventory info
  name       = "legolas"
  groups     = ["kubernetes", "nodes"]
  # playbook info
  playbook   = "${path.module}/../../../ansible_playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:configure"]
  
  var_files  = [
    "${path.module}/../../../inventory/group_vars/all.yml",
    "${path.module}/../../../inventory/group_vars/prod.yml",
    "${path.module}/../../../inventory/host_vars/legolas.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_legolas-kubernetes-3-of-6-stdout" {
  depends_on = [ ansible_playbook.legolas-kubernetes-3-of-6 ]
  value = ansible_playbook.legolas-kubernetes-3-of-6.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_legolas-kubernetes-3-of-6-stderr" {
  depends_on = [ ansible_playbook.legolas-kubernetes-3-of-6 ]
  value = ansible_playbook.legolas-kubernetes-3-of-6.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# legolas exits fellowship:configure — dependent on 1 subsequent incantations
# gimli enters fellowship:install — dependent on 0 prior incantations
resource "ansible_playbook" "gimli-kubernetes-1-of-6" {
  # dependency info
  depends_on = [  
  ]
  # inventory info
  name       = "gimli"
  groups     = ["kubernetes", "nodes"]
  # playbook info
  playbook   = "${path.module}/../../../ansible_playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:install"]
  
  var_files  = [
    "${path.module}/../../../inventory/group_vars/all.yml",
    "${path.module}/../../../inventory/group_vars/prod.yml",
    "${path.module}/../../../inventory/host_vars/gimli.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_gimli-kubernetes-1-of-6-stdout" {
  depends_on = [ ansible_playbook.gimli-kubernetes-1-of-6 ]
  value = ansible_playbook.gimli-kubernetes-1-of-6.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_gimli-kubernetes-1-of-6-stderr" {
  depends_on = [ ansible_playbook.gimli-kubernetes-1-of-6 ]
  value = ansible_playbook.gimli-kubernetes-1-of-6.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# gimli exits fellowship:install — dependent on 0 subsequent incantations
# gimli enters fellowship:assemble — dependent on 2 prior incantations
resource "ansible_playbook" "gimli-kubernetes-2-of-6" {
  # dependency info
  depends_on = [
    ansible_playbook.gimli-kubernetes-1-of-6,
    ansible_playbook.legolas-kubernetes-2-of-6  
  ]
  # inventory info
  name       = "gimli"
  groups     = ["kubernetes", "nodes"]
  # playbook info
  playbook   = "${path.module}/../../../ansible_playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:assemble"]
  
  var_files  = [
    "${path.module}/../../../inventory/group_vars/all.yml",
    "${path.module}/../../../inventory/group_vars/prod.yml",
    "${path.module}/../../../inventory/host_vars/gimli.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_gimli-kubernetes-2-of-6-stdout" {
  depends_on = [ ansible_playbook.gimli-kubernetes-2-of-6 ]
  value = ansible_playbook.gimli-kubernetes-2-of-6.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_gimli-kubernetes-2-of-6-stderr" {
  depends_on = [ ansible_playbook.gimli-kubernetes-2-of-6 ]
  value = ansible_playbook.gimli-kubernetes-2-of-6.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# gimli exits fellowship:assemble — dependent on 2 subsequent incantations
# gimli enters fellowship:configure — dependent on 1 prior incantations
resource "ansible_playbook" "gimli-kubernetes-3-of-6" {
  # dependency info
  depends_on = [
    ansible_playbook.gimli-kubernetes-2-of-6  
  ]
  # inventory info
  name       = "gimli"
  groups     = ["kubernetes", "nodes"]
  # playbook info
  playbook   = "${path.module}/../../../ansible_playbooks/kubernetes_cluster.yaml"
  tags       = ["fellowship:configure"]
  
  var_files  = [
    "${path.module}/../../../inventory/group_vars/all.yml",
    "${path.module}/../../../inventory/group_vars/prod.yml",
    "${path.module}/../../../inventory/host_vars/gimli.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_gimli-kubernetes-3-of-6-stdout" {
  depends_on = [ ansible_playbook.gimli-kubernetes-3-of-6 ]
  value = ansible_playbook.gimli-kubernetes-3-of-6.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_gimli-kubernetes-3-of-6-stderr" {
  depends_on = [ ansible_playbook.gimli-kubernetes-3-of-6 ]
  value = ansible_playbook.gimli-kubernetes-3-of-6.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# gimli exits fellowship:configure — dependent on 1 subsequent incantations
# moria enters vault:install — dependent on 0 prior incantations
resource "ansible_playbook" "moria-vault-1-of-2" {
  # dependency info
  depends_on = [  
  ]
  # inventory info
  name       = "moria"
  groups     = ["vaults"]
  # playbook info
  playbook   = "${path.module}/../../../ansible_playbooks/hashicorp-vault-install.yaml"
  tags       = ["vault:install"]
  
  var_files  = [
    "${path.module}/../../../inventory/group_vars/all.yml",
    "${path.module}/../../../inventory/group_vars/prod.yml",
    "${path.module}/../../../inventory/host_vars/moria.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_moria-vault-1-of-2-stdout" {
  depends_on = [ ansible_playbook.moria-vault-1-of-2 ]
  value = ansible_playbook.moria-vault-1-of-2.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_moria-vault-1-of-2-stderr" {
  depends_on = [ ansible_playbook.moria-vault-1-of-2 ]
  value = ansible_playbook.moria-vault-1-of-2.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# moria exits vault:install — dependent on 0 subsequent incantations
# moria enters vault:kubevault — dependent on 2 prior incantations
resource "ansible_playbook" "moria-vault-2-of-2" {
  # dependency info
  depends_on = [
    ansible_playbook.moria-vault-1-of-2,
    ansible_playbook.aragorn-kubernetes-4-of-6  
  ]
  # inventory info
  name       = "moria"
  groups     = ["vaults"]
  # playbook info
  playbook   = "${path.module}/../../../ansible_playbooks/hashicorp-vault-install.yaml"
  tags       = ["vault:kubevault"]
  
  var_files  = [
    "${path.module}/../../../inventory/group_vars/all.yml",
    "${path.module}/../../../inventory/group_vars/prod.yml",
    "${path.module}/../../../inventory/host_vars/moria.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_moria-vault-2-of-2-stdout" {
  depends_on = [ ansible_playbook.moria-vault-2-of-2 ]
  value = ansible_playbook.moria-vault-2-of-2.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_moria-vault-2-of-2-stderr" {
  depends_on = [ ansible_playbook.moria-vault-2-of-2 ]
  value = ansible_playbook.moria-vault-2-of-2.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# moria exits vault:kubevault — dependent on 2 subsequent incantations
# gandalf enters bellman:install — dependent on 0 prior incantations
resource "ansible_playbook" "gandalf-bellman-1-of-1" {
  # dependency info
  depends_on = [  
  ]
  # inventory info
  name       = "gandalf"
  groups     = ["bellman"]
  # playbook info
  playbook   = "${path.module}/../../../ansible_playbooks/bellman.yaml"
  tags       = ["bellman:install"]
  
  var_files  = [
    "${path.module}/../../../inventory/group_vars/all.yml",
    "${path.module}/../../../inventory/group_vars/prod.yml",
    "${path.module}/../../../inventory/host_vars/gandalf.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_gandalf-bellman-1-of-1-stdout" {
  depends_on = [ ansible_playbook.gandalf-bellman-1-of-1 ]
  value = ansible_playbook.gandalf-bellman-1-of-1.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_gandalf-bellman-1-of-1-stderr" {
  depends_on = [ ansible_playbook.gandalf-bellman-1-of-1 ]
  value = ansible_playbook.gandalf-bellman-1-of-1.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# gandalf exits bellman:install — dependent on 0 subsequent incantations
# galadriel enters seer:install — dependent on 0 prior incantations
resource "ansible_playbook" "galadriel-seer-1-of-1" {
  # dependency info
  depends_on = [  
  ]
  # inventory info
  name       = "galadriel"
  groups     = ["seer"]
  # playbook info
  playbook   = "${path.module}/../../../ansible_playbooks/seer.yaml"
  tags       = ["seer:install"]
  
  var_files  = [
    "${path.module}/../../../inventory/group_vars/all.yml",
    "${path.module}/../../../inventory/group_vars/prod.yml",
    "${path.module}/../../../inventory/host_vars/galadriel.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_galadriel-seer-1-of-1-stdout" {
  depends_on = [ ansible_playbook.galadriel-seer-1-of-1 ]
  value = ansible_playbook.galadriel-seer-1-of-1.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_galadriel-seer-1-of-1-stderr" {
  depends_on = [ ansible_playbook.galadriel-seer-1-of-1 ]
  value = ansible_playbook.galadriel-seer-1-of-1.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# galadriel exits seer:install — dependent on 0 subsequent incantations