output "vm_info" {
  value = {
    test-vm = {
        external_ip_address = module.test-vm.external_ip_address
        labels   = module.test-vm.labels
        fqdn = module.test-vm.fqdn
    }
  }
  }

output "subnet_id" {
  value = module.vpc.subnet_id
}

output "mysql_host" {
  description = "MySQL cluster host FQDN"
  value       = yandex_mdb_mysql_cluster.mysql-web-app.host[0].fqdn
}

