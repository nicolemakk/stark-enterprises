output "config_a_workspace_ids" {
  value = tfe_workspace.config_a[*].id
}

output "config_b_workspace_ids" {
  value = tfe_workspace.config_b[*].id
}

output "config_c_workspace_ids" {
  value = tfe_workspace.config_c[*].id
}
