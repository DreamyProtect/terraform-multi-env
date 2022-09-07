resource "scaleway_lb_ip" "public" {
  zone = local.settings.server_type.lb.zone
}

resource "scaleway_lb" "base" {
  ip_id  = scaleway_lb_ip.public.id
  zone   = local.settings.server_type.lb.zone
  type   = local.settings.server_type.lb.type
}
