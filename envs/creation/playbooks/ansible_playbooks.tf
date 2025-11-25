terraform {
  required_providers {
    ansible = {
      source  = "ansible/ansible"
      version = "~> 1.3.0"
    }
  }
}

# manwe enters wind_walker:install — dependent on 1 prior incantations
resource "ansible_playbook" "manwe-wind_walker-1-of-1" {
  # dependency info
  depends_on = [
    module.virtual_machines["manwe"]  
  ]
  # inventory info
  name       = "manwe"
  groups     = ["orchestrator"]
  # playbook info
  playbook   = "${path.module}/../../../ansible_playbooks/wind_walker.yaml"
  tags       = ["wind_walker:install"]
  
  var_files  = [
    "${path.module}/../../../inventory/group_vars/all.yml",
    "${path.module}/../../../inventory/group_vars/creation.yml",
    "${path.module}/../../../inventory/host_vars/manwe.yml"
  ]
  check_mode = false
  diff_mode  = false
  replayable = false
  verbosity  = 1
}

output "ansible_manwe-wind_walker-1-of-1-stdout" {
  depends_on = [ ansible_playbook.manwe-wind_walker-1-of-1 ]
  value = ansible_playbook.manwe-wind_walker-1-of-1.ansible_playbook_stdout
  description = "Standard output from the Ansible playbook execution."
}

output "ansible_manwe-wind_walker-1-of-1-stderr" {
  depends_on = [ ansible_playbook.manwe-wind_walker-1-of-1 ]
  value = ansible_playbook.manwe-wind_walker-1-of-1.ansible_playbook_stderr
  description = "Standard error from the Ansible playbook execution."
}
# manwe exits wind_walker:install — dependent on 1 subsequent incantations