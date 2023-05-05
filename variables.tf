variable "github_token" {
  type = string
  sensitive = true
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

