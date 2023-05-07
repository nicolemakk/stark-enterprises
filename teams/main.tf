resource "tfe_team" "readonly" {
  count = 2
  name = "Auditors ${count.index+1}"
  organization = var.organization_name
  visibility = "organization"

  organization_access {
    read_workspaces = true
    read_projects = true
  }
}

resource "tfe_team" "policy_team" {
  count = 2
  name = "Hot Cup Coffee ${count.index+1}"
  organization = var.organization_name
  visibility = "organization"

  organization_access {
    manage_policies = true
    manage_policy_overrides = true
  }
}

resource "tfe_team" "workspaces_team" {
  count = 2
  name = "Cordco ${count.index+1}"
  organization = var.organization_name
  visibility = "organization"

  organization_access {
    manage_workspaces = true
  }
}

resource "tfe_team" "projects_team" {
  count = 2
  name = "Stark Enterprises ${count.index+1}"
  organization = var.organization_name
  visibility = "organization"

  organization_access {
    manage_workspaces = true
    manage_projects = true
  }
}

resource "tfe_team" "vcs_team" {
  count = 2
  name = "Barstow Electronics ${count.index+1}"
  organization = var.organization_name
  visibility = "organization"

  organization_access {
    manage_vcs_settings = true
  }
}

