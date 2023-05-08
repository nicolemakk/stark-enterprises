resource "tfe_policy" "instance_check" {
  name         = "ec2-instance-check"
  description  = "Validates that a given EC2 instance is of the right type."
  organization = var.organization_name
  kind         = "sentinel"
  policy       = file("${path.module}/instance-type.sentinel")
  enforce_mode = "hard-mandatory"
}

resource "tfe_policy" "db_check" {
  name         = "db-check"
  description  = "Validates that a given database has enough disk storage capacity."
  organization = var.organization_name
  kind         = "sentinel"
  policy       = file("${path.module}/db-size.sentinel")
  enforce_mode = "hard-mandatory"
}

resource "tfe_policy" "version_check" {
  name         = "allowed-terraform-version"
  description  = "Validates that an allowed Terraform version is being used."
  organization = var.organization_name
  kind         = "sentinel"
  policy       = file("${path.module}/allowed-terraform-version.sentinel")
  enforce_mode = "hard-mandatory"
}

resource "tfe_policy_set" "cluster_validation" {
  name = "validate-cluster"
  description = "The set of policies that validate an EC2 cluster"
  organization = var.organization_name
  kind = "sentinel"
  policy_ids = [
    tfe_policy.instance_check.id,
    tfe_policy.db_check.id
  ]
  workspace_ids = []
}

resource "tfe_policy_set" "dummy" {
  for_each = {
    aws_networking_prod = "Prescriptive Sentinel policies that can be used to establish secure Terraform configuration for Amazon Web Services networking infrastructure.",
    gcp_networking_prod = "Prescriptive Sentinel policies that can be used to establish secure Terraform configuration for Google Cloud Platform networking infrastructure.",
    azure_networking_prod = "Prescriptive Sentinel policies that can be used to establish secure Terraform configuration for Microsoft Azure networking infrastructure.",
    aws_encryption_prod = "Policies for encryption on AWS resources",
    gcp_encryption_prod = "Policies for encryption on GCP resources",
    azure_encryption_prod = "Policies for encryption on Azure resources",
    aws_security_prod = "Policies for security checks on AWS resources",
    gcp_security_prod = "Policies for security checks on GCP resources",
    azure_security_prod = "Policies for security checks on Azure resources",
    aws_storage_prod = "Policies for storage on AWS resources",
    gcp_storage_prod = "Policies for storage on GCP",
    azure_storage_prod = "Policies for storage on Azure",
    aws_cost_prod = "Policies for reducing cost on AWS",
    gcp_cost_prod = "Policies for reducing cost on GCP",
    azure_cost_prod = "Policies for reducing cost on Azure",
    terraform_prod= "Policies for ensuring best practicies are met for Terraform resource provisioning.",
    development = "Policies to enforce on development environment",
    production = "Policies to enforce on production environment",
    legal_prod = "Policies legal requires us to enforce",
    sox_prod = "Policies for SOX compliance",
    best_practices_prod = "Policies for CCOE Best Practice enforcement."
    aws_networking_dev = "Prescriptive Sentinel policies that can be used to establish secure Terraform configuration for Amazon Web Services networking infrastructure.",
    gcp_networking_dev = "Prescriptive Sentinel policies that can be used to establish secure Terraform configuration for Google Cloud Platform networking infrastructure.",
    azure_networking_dev = "Prescriptive Sentinel policies that can be used to establish secure Terraform configuration for Microsoft Azure networking infrastructure.",
    aws_encryption_dev = "Policies for encryption on AWS resources",
    gcp_encryption_dev = "Policies for encryption on GCP resources",
    azure_encryption_dev = "Policies for encryption on Azure resources",
    aws_security_dev = "Policies for security checks on AWS resources",
    gcp_security_dev = "Policies for security checks on GCP resources",
    azure_security_dev = "Policies for security checks on Azure resources",
    aws_storage_dev = "Policies for storage on AWS resources",
    gcp_storage_dev = "Policies for storage on GCP",
    azure_storage_dev = "Policies for storage on Azure",
    aws_cost_dev = "Policies for reducing cost on AWS",
    gcp_cost_dev = "Policies for reducing cost on GCP",
    azure_cost_dev = "Policies for reducing cost on Azure",
    terraform_dev = "Policies for ensuring best practicies are met for Terraform resource provisioning.",
    legal_dev = "Policies legal requires us to enforce",
    sox2_dev = "Policies for SOX compliance",
    best_practices_dev = "Policies for CCOE Best Practice enforcement."
  }

  name = each.key
  description = each.value
  organization = var.organization_name
  kind = "sentinel"
  policy_ids = [
    tfe_policy.version_check.id
  ]
  workspace_ids = []
}
