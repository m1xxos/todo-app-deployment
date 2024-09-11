resource "cloudflare_record" "main-cluster" {
  zone_id = var.cloudflare_zone_id
  name    = "talos.m1xxos.me"
  content = "192.168.1.85"
  type    = "A"
  ttl     = 3600
}

resource "cloudflare_record" "main-cluster-extra" {
  zone_id = var.cloudflare_zone_id
  name    = "*.talos"
  content = "talos.m1xxos.me"
  type    = "CNAME"
  ttl     = 3600
}