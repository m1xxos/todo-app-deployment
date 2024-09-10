provider "proxmox" {
  endpoint = var.proxmox_api_url
  username = var.proxmox_api_token_id
  api_token = var.proxmox_api_token_secret
  insecure = true
}