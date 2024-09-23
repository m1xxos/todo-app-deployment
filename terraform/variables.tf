variable "proxmox_api_url" {
  type = string
}

variable "proxmox_api_token_id" {
  type      = string
  sensitive = true
}

variable "proxmox_api_token_secret" {
  type      = string
  sensitive = true
}

variable "ssh_password" {
  type      = string
  sensitive = true
}

variable "bucket" {
  type = string
}

variable "access_key" {
  type      = string
  sensitive = true
}

variable "secret_key" {
  type      = string
  sensitive = true
}

variable "cloudflare_api_token" {
  type      = string
  sensitive = true
}

variable "cloudflare_zone_id" {
  type      = string
  sensitive = true
}

variable "nginx_username" {
  type = string
}

variable "nginx_password" {
  type = string
}

variable "cluster_name" {
  type    = string
  default = "homelab"
}

variable "default_gateway" {
  type    = string
  default = "192.168.1.1"
}

variable "talos_cp_01_ip_addr" {
  type    = string
  default = "192.168.1.80"
}

variable "talos_cp_02_ip_addr" {
  type    = string
  default = "192.168.1.81"
}

variable "talos_cp_03_ip_addr" {
  type    = string
  default = "192.168.1.82"
}


variable "talos_worker_01_ip_addr" {
  type    = string
  default = "192.168.1.83"
}
