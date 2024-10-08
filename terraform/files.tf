locals {
  talos = {
    version = "v1.7.6",
    new = "1.8.0"
  }
}

resource "proxmox_virtual_environment_download_file" "talos_nocloud_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "pve"

  file_name               = "talos-${local.talos.version}-nocloud-amd64.img"
  url                     = "https://factory.talos.dev/image/ce4c980550dd2ab1b17bbf2b08801c7eb59418eafe8f279833297925d67c7515/${local.talos.version}/nocloud-amd64.raw.gz"
  decompression_algorithm = "gz"
  overwrite               = false
}

resource "proxmox_virtual_environment_download_file" "talos_nocloud_image_iscsi" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "pve"

  file_name               = "talos-${local.talos.new}-nocloud-amd64-iscsi.img"
  url                     = "https://factory.talos.dev/image/f2716897efdcc84fb9cef8d04b20631b2ba11de56a941eee5a6577e4a5c08dc7/${local.talos.new}/nocloud-amd64.raw.gz"
  decompression_algorithm = "gz"
  overwrite               = false
}