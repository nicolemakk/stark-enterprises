resource "tfe_registry_module" "ec2_cluster_module" {
  vcs_repo {
    display_identifier = "${var.github_username}/terraform-fakewebservices-ec2-cluster"
    identifier = "${var.github_username}/terraform-fakewebservices-ec2-cluster"
    oauth_token_id = var.oauth_token_id
  }
}

resource "tfe_registry_module" "pets_can_code" {
  vcs_repo {
    display_identifier = "${var.github_username}/terraform-random-pets-can-code"
    identifier = "${var.github_username}/terraform-random-pets-can-code"
    oauth_token_id = var.oauth_token_id
  }
}

# resource "tfe_no_code_module" "pets_nocode_module" {
#   organization = local.organization_name
#   registry_module = tfe_registry_module.pets_can_code.id
#   enabled = true
#
#   variable_options {
#     name = "name_length"
#     type = "number"
#     options = [5,10,15,20,25]
#   }
# }
#
