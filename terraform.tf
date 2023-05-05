terraform {
  cloud {
    hostname = "app.staging.terraform.io"
    organization = "stark-enterprises"

    workspaces {
      name = "hq"
    }
  }

  required_providers {
    tfe = "~> 0.44.1"
  }
}

provider "tfe" {
  hostname = "app.staging.terraform.io"
  token = var.token
}
