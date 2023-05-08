locals {
  dummy_project_names = ["Cordco Dev", "Cordco Prod", "Stark Networking", "Stark Cloud", "Developer Productivity", "Stark CCOE", "AWS Testing", "GCP Development", "Stane International", "Barstow Electronics", "Hot Cup Coffee"]
}

resource "tfe_project" "dummy" {
  count = length(local.dummy_project_names)
  
  name = local.dummy_project_names[count.index]
  organization = var.organization_name
}
