variable "github_token" {
  type = string
  sensitive = true
  description = "A Github Personal Access token"
}

variable "github_username" {
  type = string
  description = "The Github username that owns the repositories that will be used"
}

variable "token" {
  type = string
  description = "A TFC/E User token"
  sensitive = true
}

variable "organization_name" {
  type = string
  description = "The name of the TFC organization"
}

variable "hostname" {
  type = string
  default = "app.staging.terraform.io"
  description = "The hostname to use"
}