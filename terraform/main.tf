provider "proxmox" {
  endpoint  = var.proxmox_api_url
  username  = var.proxmox_api_token_id
  api_token = var.proxmox_api_token_secret
  insecure  = true

  ssh {
    agent = true
    username = "root"
    password = var.ssh_password
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}