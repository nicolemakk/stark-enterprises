variable "oauth_token" {
  type = string
  sensitive = true
}

variable "organization_name" {
  type = string
  description = "The name of the TFC organization"
}