module "teams" {
  source = "./teams"

  organization_name = var.organization_name
}

module "projects" {
  source = "./projects"

  organization_name = var.organization_name
}

module "vcs" {
  source = "./vcs"

  oauth_token = var.github_token
  organization_name = var.organization_name
}

module "registry" {
  source = "./registry"

  github_username = var.github_username
  oauth_token_id = module.vcs.oauth_token_id
  organization_name = var.organization_name
}

module "workspaces" {
  source = "./workspaces"

  github_username = var.github_username
  oauth_token_id = module.vcs.oauth_token_id
  token = var.token
  organization_name = var.organization_name
  hostname = var.hostname
}

module "policies" {
  source = "./policies"

  organization_name = var.organization_name
}

