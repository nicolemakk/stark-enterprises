terraform {
  cloud {
    hostname = "app.staging.terraform.io"
    organization = "organization_name"

    workspaces {
      name = "hq"
    }
  }

  required_providers {
    tfe = "~> 0.44.1"
  }
}

provider "tfe" {
  hostname = var.hostname
  token = var.token
}

provider "random" {
  # Configuration options
}
