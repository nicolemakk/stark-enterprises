output "db_check_policy_id" {
  value = tfe_policy.db_check.id
}

output "instance_check_policy_id" {
  value = tfe_policy.instance_check.id
}

output "version_check_policy_id" {
  value = tfe_policy.version_check.id
}
