resource "tfe_workspace" "dummy" {
  for_each = {
    detection_response_1 = "detection-response-1",
    detection_response_2 = "detection-response-2",
    detection_response_3 = "detection-response-3",
    team_developer_productivity_1 = "teamdeveloper-productivity-blue"
    team_developer_productivity_2 = "teamdeveloper-productivity-red",
    cloud_infra_linode = "cloud-infra-linode",
    omegastar_service = "omega-star-service",
    galactus_service = "galactus_service",
    jarvis = "jarvis"
  }

  name = each.key
  organization = local.organization_name
  auto_apply = false
}

resource "tfe_workspace" "config_a" {
  count = 2

  name = "cordco-${count.index + 1}"
  organization = local.organization_name

  vcs_repo {
    identifier = "${var.github_username}/config-with-variables"
    oauth_token_id = var.oauth_token_id
  }

  depends_on = [var.module_ids]
}

resource "tfe_workspace" "config_b" {
  count = 2

  name = "hot-cup-coffee-${count.index + 1}"
  organization = local.organization_name

  vcs_repo {
    identifier = "sebasslash/config-with-variables"
    oauth_token_id = var.oauth_token_id
  }

  depends_on = [var.module_ids]
}

resource "tfe_workspace" "accutech" {
  for_each = {
    alpha = "alpha"
    beta = "beta"
    gamma = "gamma"
    delta = "delta"
    epsilon = "epsilon"
  }

  name = "accutech-${each.value}"
  organization = local.organization_name

  vcs_repo {
    identifier = "sebasslash/config-to-edit"
    oauth_token_id = var.oauth_token_id
  }

  depends_on = [var.module_ids]
}

