locals {
  dummy_workspace_names = ["cordco-satellite-1", "cordco-satellite-2", "cordco-satellite-3", "team-developer-productivity-1", "team-developer-productivity-2", "cloud-infra-linode", "omega-star-service", "galactus_service", "jarvis", "barstow-electronics-developer-productivity", "hot-cup-coffee-billing" ]
  config_c_workspace_names = ["alpha-cordco-testing", "barstow-electronics-cluster", "omega-star-development", "galactus-prod", "infinity-gauntlet"]
}

resource "tfe_workspace" "dummy" {
  count = length(local.dummy_workspace_names)

  name = local.dummy_workspace_names[count.index]
  organization = var.organization_name
  auto_apply = false
}

resource "tfe_workspace" "config_a" {
  count = 3

  name = "accutech-development-${count.index + 1}"
  organization = var.organization_name
  auto_apply = true

  vcs_repo {
    identifier = "${var.github_username}/config-with-variables"
    oauth_token_id = var.oauth_token_id
  }
}

resource "tfe_workspace" "config_b" {
  count = 2

  name = "accutech-research-${count.index + 1}"
  organization = var.organization_name
  auto_apply = true

  vcs_repo {
    identifier = "${var.github_username}/config-with-variables"
    oauth_token_id = var.oauth_token_id
  }
}

resource "tfe_workspace" "config_c" {
  count = 5

  name = local.config_c_workspace_names[count.index]
  organization = var.organization_name
  auto_apply = false

  vcs_repo {
    identifier = "${var.github_username}/config-to-edit"
    oauth_token_id = var.oauth_token_id
  }
}

