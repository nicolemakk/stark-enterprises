variable "github_username" {
  type = string
  description = "The Github user that owns the module sources"
}

variable "oauth_token_id" {
  type = string
  description = "The Github token for github_username. Used to create the OAuth client."
}

variable "organization_name" {
  type = string
  description = "The name of the TFC organization"
}