variable "oauth_token_id" {
  type = string
}

variable "github_username" {
  type = string
}

variable "token" {
  type = string
  sensitive = true
}

variable "organization_name" {
  type = string
  description = "The name of the TFC organization"
}

variable "hostname" {
  type = string
  description = "The hostname to use"
}