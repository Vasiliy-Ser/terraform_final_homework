# Создание Managed MySQL
resource "yandex_mdb_mysql_cluster" "mysql-web-app" {
  version     = var.mysql_config.mysql_version 
  name        = var.mysql_config.mysql_name
  environment = var.mysql_environment
  network_id  = module.vpc.network_id

  resources {
    resource_preset_id = var.mysql_config.preset_id
    disk_type_id      = var.mysql_config.disk_type
    disk_size         = var.mysql_config.disk_size
  }

  host {
    zone      = var.vm_zone
    subnet_id = module.vpc.subnet_id[0]
  }

  access {
    web_sql = true
  }

}

# Создание БД в кластере MySQL
resource "yandex_mdb_mysql_database" "app-db" {
  cluster_id = yandex_mdb_mysql_cluster.mysql-web-app.id
  name       = var.mysql_config.db_name
}

# Создание пользователя для БД
resource "yandex_mdb_mysql_user" "db-user" {
  cluster_id = yandex_mdb_mysql_cluster.mysql-web-app.id
  name       = var.mysql_config.user_name
  password   = var.mysql_config.user_pass
  
  permission {
    database_name = yandex_mdb_mysql_database.app-db.name
    roles         = ["ALL"]
  }
}
