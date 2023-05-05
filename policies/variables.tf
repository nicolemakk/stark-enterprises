variable "cluster_validate_workspace_ids" {
  type = list(string)
  description = "The list of workspace IDs to apply cluster_validate policy set."
  default = []
}
