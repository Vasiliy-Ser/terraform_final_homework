#---------------------cloud vars-----------------------------
/*variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}
*/

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}


variable "default_zone" {
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
  type = list(object({
    name = string
    cidr = string
  }))
  default = [
    { name = "ru-central1-a", cidr = "10.0.1.0/24" },
    { name = "ru-central1-b", cidr = "10.0.2.0/24" },
    { name = "ru-central1-d", cidr = "10.0.3.0/24" }
  ]
}

variable "zone" {
  description = "ttps://cloud.yandex.ru/docs/overview/concepts/geo-scope"
  type        = string
  default     = "ru-central1-a"
}

variable "default2_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}


# ------------------common vars---------------------

variable "vms_ssh_root_key" {
  type        = string
#  default     = []
  description = "ssh-keygen -t ed25519"
}

variable "vm_user" {
  description = "Username for VM access"
  type        = string
  default     = "master"
}

variable "vm_image_id" {
  description = "ID of the image to use for VM"
  type        = string
  default     = "ubuntu-2004-lts"
}

# -------------------MYSQL-------------------------


variable "vm_zone" {
  description = "Зона доступности для ВМ"
  type        = string
  default     = "ru-central1-a"
}

variable "mysql_config" {
  description = "Конфигурация MySQL"
  type = object({
    db_name     = string
    user_name   = string
    user_pass   = string
    disk_size   = number
    preset_id   = string
    disk_type   = string
    mysql_name  = string
    mysql_version = string
  })
  default = {
    db_name     = "appdb"
    user_name   = "dbuser"
    user_pass   = "pass123456789"
    disk_size   = 10
    preset_id   = "c3-c2-m4"
    disk_type   = "network-hdd"
    mysql_name  = "nikola"
    mysql_version = "8.0"
  }
}

variable "registry_name" {
  description = "Name Container Registry"
  type        = string
  default     = "my-reg"
}

/*
variable "network_config" {
  description = "Конфигурация сети"
  type = object({
    network_name = string
    subnet_name  = string
    cidr_blocks  = list(string)
  })
  default = {
    network_name = "network"
    subnet_name  = "subnet"
    cidr_blocks  = ["192.168.10.0/24"]
  }
}
*/

variable "mysql_environment" {
  type        = string
  default     = "PRODUCTION"
  description = "mysql_version"
}

variable "web_app_image" {
  description = "Web app container image"
  type        = string
}

variable "web_app_port" {
  description = "Port for web application"
  type        = number
  default     = 8080
}

