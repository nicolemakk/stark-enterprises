locals {
  db_values = [64, 128, 256, 512, 1024]
  instance_types = ["t3.medium", "t3.large", "t4g.small", "t4g.medium", "t4g.large"]
  cidr_blocks = ["192.168.0.0/16", "10.0.0.0/8", "172.16.0.0/12", "192.0.2.0/24", "198.51.100.0/24"]
}

resource "tfe_variable" "organization_name_1" {
  count = 2

  key = "organization_name"
  value = local.organization_name
  category = "terraform"
  workspace_id = tfe_workspace.config_a[count.index].id
}

resource "tfe_variable" "token_1" {
  count = 2

  key = "token"
  value = var.token
  category = "terraform"
  sensitive = true
  workspace_id = tfe_workspace.config_a[count.index].id
}

resource "tfe_variable" "organization_name_2" {
  count = 2

  key = "organization_name"
  value = local.organization_name
  category = "terraform"
  workspace_id = tfe_workspace.config_b[count.index].id
}

resource "tfe_variable" "token_2" {
  count = 2

  key = "token"
  value = var.token
  category = "terraform"
  sensitive = true
  workspace_id = tfe_workspace.config_b[count.index].id
}

resource "tfe_variable" "db_sizes" {
  count = 5

  key = "db_size"
  value = "${(count.index + 1) * 64}"
  category = "terraform"
  description = "The database size for cluster"
  variable_set_id = tfe_variable_set.cluster_vars[count.index].id
}

resource "tfe_variable" "instance_types" {
  for_each = toset(local.instance_types)

  key = "instance_type"
  value = "${each.value}"
  category = "terraform"
  description = "The EC2 instance type for each server in a cluster"
  variable_set_id = tfe_variable_set.cluster_vars[index(local.instance_types, each.value)].id
}

resource "tfe_variable" "cidr_blocks" {
  for_each = toset(local.cidr_blocks)

  key = "cidr_block"
  value = "${each.value}"
  category = "terraform"
  description = "The range of IP addresses to configure a given cluster"
  variable_set_id = tfe_variable_set.cluster_vars[index(local.cidr_blocks, each.value)].id
}

resource "tfe_variable_set" "cluster_vars" {
  count = 5

  name = "EC2 Cluster Configuration ${count.index + 1}"
  description = "A set of variables to configure an ec2-cluster module"
  organization = local.organization_name
}

resource "tfe_workspace_variable_set" "config_a" {
  count = 2

  variable_set_id = tfe_variable_set.cluster_vars[count.index].id
  workspace_id = tfe_workspace.config_a[count.index].id
}

resource "tfe_workspace_variable_set" "config_b" {
  count = 2

  variable_set_id = tfe_variable_set.cluster_vars[count.index + 2].id
  workspace_id = tfe_workspace.config_b[count.index].id
}
