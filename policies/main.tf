resource "tfe_policy" "instance_check" {
  name         = "ec2-instance-check"
  description  = "Validates that a given EC2 instance is of the right type."
  organization = local.organization_name
  kind         = "sentinel"
  policy       = file("${path.module}/instance-type.sentinel")
  enforce_mode = "hard-mandatory"
}

resource "tfe_policy" "db_check" {
  name         = "db-check"
  description  = "Validates that a given database has enough disk storage capacity."
  organization = local.organization_name
  kind         = "sentinel"
  policy       = file("${path.module}/db-size.sentinel")
}

resource "tfe_policy_set" "cluster_validation" {
  name = "validate-cluster"
  description = "The set of policies that validate an EC2 cluster"
  organization = local.organization_name
  kind = "sentinel"
  policy_ids = [
    tfe_policy.instance_check.id,
    tfe_policy.db_check.id
  ]
  workspace_ids = var.cluster_validate_workspace_ids
}
