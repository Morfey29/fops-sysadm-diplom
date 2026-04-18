terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.199.0"
    }
  }

  required_version = ">=1.14.8"
}

provider "yandex" {
  # token                    = "do not use!!!"
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  service_account_key_file = file("~/.ssh/yassh.pub")
}