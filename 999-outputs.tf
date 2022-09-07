locals {
  server_type_nodes = [
    for i in range(0,local.settings.server_type.instances.count):
    {
      ip = scaleway_instance_server.server_type[i].private_ip
      user = debian
      hostname = scaleway_instance_server.server_type[i].name
    }
  ]
}

resource "local_file" "inventory" {
  filename =  "hosts"
  content = templatefile(
    "templates/ansible_inventory.tftpl",
    {
      server_type = local.server_types_nodes
    }
  )
}

resource "local_file" "ssh_config" {
  filename =  "ssh_config"
  content = templatefile(
    "templates/ssh_config.tftpl",
    {
      created_hosts = concat(
        local.server_type_nodes
      )
    }
  )
}
