module "teams" {
  source = "./teams"
}

module "vcs" {
  source = "./vcs"

  oauth_token = var.github_token
}

module "registry" {
  source = "./registry"

  github_username = var.github_username
  oauth_token_id = module.vcs.oauth_token_id
}

module "workspaces" {
  source = "./workspaces"

  github_username = var.github_username
  module_ids = module.registry.module_ids
  oauth_token_id = module.vcs.oauth_token_id
}

module "policies" {
  source = "./policies"

  cluster_validate_workspace_ids = flatten([
    module.workspaces.config_a_workspace_ids,
    module.workspaces.config_b_workspace_ids
  ])
}

