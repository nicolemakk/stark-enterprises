output "module_ids" {
  value = [
    tfe_registry_module.ec2_cluster_module.id,
    tfe_registry_module.pets_can_code.id,
    tfe_no_code_module.pets_nocode_module.id
  ]
}
