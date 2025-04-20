#For terraform >=1.6<=1.8.5
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "~> 0.140.1"
    }
    template = {
      source  = "hashicorp/template"
      version = "~> 2.2.0"  # Указываем версию, например, "~> 2.2"
    }
  }

}

provider "yandex" {
  # token     = var.token
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
#  zone                     = var.default_zone
  service_account_key_file = file("~/.authorized_key.json")
}
