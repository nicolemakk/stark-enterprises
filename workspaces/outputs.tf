output "config_a_workspace_ids" {
  value = tfe_workspace.config_a[*].id
}

output "config_b_workspace_ids" {
  value = tfe_workspace.config_b[*].id
}

output "accutech_workspace_ids" {
  value = [ for ws in tfe_workspace.accutech : ws.id ]
}
