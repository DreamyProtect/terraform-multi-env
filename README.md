# terraform-multi-env

A repository structure to manage multiple environments easily using terraform

## Project's structure

In the `environments` directory we can find:

* a `common.yaml` file that defines attributes that are common across all environments in the YAML format
* a `${environment}.yaml` file that defines attributes for an environment in the YAML format

Those files are read in the `010-variables.tf` of the root module and sourced to terraform's locals and accessed in the later resources creation files. The environment file is defined based on the `environment` variable that is prompted by terraform when running `terraform create` or `terraform plan` or can be passed to terraform using the `-var "environment=${environment}"` when using the previous commands.

Finally, the `999-outputs.tf` file generates an ansible inventory file that can later be used with ansible playbooks and an SSH config file.

The project uses [Scaleway's terraform provider](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs) in order to show how to create isometric environments just by defining YAML files with terraform.

If you have any questions or feedbacks, feel free to create an issue and I'll try to answer as fast as I can.
