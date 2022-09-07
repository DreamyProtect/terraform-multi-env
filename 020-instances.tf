resource "scaleway_instance_server" "server_type" {
  count = local.settings.server_type.instances.count

  type = local.settings.server_type.instances.network.nutanix_id
  image = local.settings.server_type.instances.image
}
