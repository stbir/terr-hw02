terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.5"
}

provider "yandex" {
  # token     = var.token
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.default_zone
  service_account_key_file = file("~/.authorized_key.json")
}

provider "yandex" {
  # token     = var.token
  alias = "zone_b"
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.default_zone_b
  service_account_key_file = file("~/.authorized_key.json")
}