variable "variables" {
  type = map(string)
  default = {}
}

variable "environment" {
  type = string
}

locals {
    environment_definition_path = "environments/${var.environment}.yaml"
    commons       = file("environments/common.yaml")
    environment_definition = fileexists(local.environment_definition_path) ? file(local.environment_definition_path) : yamlencode({})
    settings = merge(
        yamldecode(local.commons),
        yamldecode(local.environment_definition),
        var.variables
    )
}
