resource "tfe_oauth_client" "github" {
  name = "ipl-empathy-session-github-client"
  organization = local.organization_name
  api_url = "https://github.com"
  http_url = "https://github.com"
  oauth_token = var.oauth_token
  service_provider = "github"
}
