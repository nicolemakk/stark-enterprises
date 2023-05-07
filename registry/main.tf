resource "tfe_registry_module" "ec2_cluster_module" {
  vcs_repo {
    display_identifier = "${var.github_username}/terraform-fakewebservices-ec2-cluster"
    identifier = "${var.github_username}/terraform-fakewebservices-ec2-cluster"
    oauth_token_id = var.oauth_token_id
  }
}

resource "tfe_registry_module" "dummy" {
  for_each = {
    stark_webservices = "stark-webservices",
    vpc = "stark-vpc",
    security-group = "stark-security-group"
  }

  namespace       = "terraform-azure-modules"
  name            = each.value
  organization    = var.organization_name
  module_provider = "fakewebservices"
  registry_name   = "private"
}

resource "tfe_registry_module" "aws_curation" {
  for_each = {
    vpc = "vpc",
    eks = "eks",
    s3-bucket = "s3-bucket",
    rds = "rds",
    ec2-instance = "ec2-instance",
    lambda = "lambda",
    iam = "iam"
    security-group = "security-group"
  }

  namespace       = "terraform-aws-modules"
  organization    = var.organization_name
  module_provider = "aws"
  name            = each.value
  registry_name   = "public"
}

resource "tfe_registry_module" "gcp_curation" {
  for_each = {
    iam = "iam",
    kubernetes-engine = "kubernetes-engine",
    network = "network",
    cloud-storage = "cloud-storage"
  }

  namespace       = "terraform-google-modules"
  name            = each.value
  organization    = var.organization_name
  module_provider = "google"
  registry_name   = "public"
}

resource "tfe_registry_module" "azurerm_curation" {
  for_each = {
    aks = "aks",
    postgressql = "postgressql",
    compute = "compute",
    network-security-group = "network-security-group"
  }

  namespace       = "azure"
  name            = each.value
  organization    = var.organization_name
  module_provider = "azurerm"
  registry_name   = "public"
}