# outputs.tf

# Внешние IP адреса (публичные)
output "zabbix_public_ip" {
  description = "Внешний IP адрес Zabbix сервера"
  value       = yandex_compute_instance.zabbix.network_interface.0.nat_ip_address
}

output "elastic_public_ip" {
  description = "Внешний IP адрес Elasticsearch сервера"
  value       = yandex_compute_instance.elastic.network_interface.0.nat_ip_address
}

output "kibana_public_ip" {
  description = "Внешний IP адрес Kibana сервера"
  value       = yandex_compute_instance.kibana.network_interface.0.nat_ip_address
}

output "web1_public_ip" {
  description = "Внешний IP адрес Web сервера 1"
  value       = yandex_compute_instance.web-1.network_interface.0.nat_ip_address
}

output "web2_public_ip" {
  description = "Внешний IP адрес Web сервера 2"
  value       = yandex_compute_instance.web-2.network_interface.0.nat_ip_address
}

output "bastion_public_ip" {
  description = "Внешний IP адрес Bastion сервера"
  value       = yandex_compute_instance.bastion.network_interface.0.nat_ip_address
}

# Внутренние IP адреса
output "zabbix_private_ip" {
  description = "Внутренний IP адрес Zabbix сервера"
  value       = yandex_compute_instance.zabbix.network_interface.0.ip_address
}

output "elastic_private_ip" {
  description = "Внутренний IP адрес Elasticsearch сервера"
  value       = yandex_compute_instance.elastic.network_interface.0.ip_address
}

output "kibana_private_ip" {
  description = "Внутренний IP адрес Kibana сервера"
  value       = yandex_compute_instance.kibana.network_interface.0.ip_address
}

output "web1_private_ip" {
  description = "Внутренний IP адрес Web сервера 1"
  value       = yandex_compute_instance.web-1.network_interface.0.ip_address
}

output "web2_private_ip" {
  description = "Внутренний IP адрес Web сервера 2"
  value       = yandex_compute_instance.web-2.network_interface.0.ip_address
}

output "bastion_private_ip" {
  description = "Внутренний IP адрес Bastion сервера"
  value       = yandex_compute_instance.bastion.network_interface.0.ip_address
}

# Все IP в одном месте
output "all_public_ips" {
  description = "Список всех публичных IP адресов"
  value = {
    zabbix  = yandex_compute_instance.zabbix.network_interface.0.nat_ip_address
    elastic = yandex_compute_instance.elastic.network_interface.0.nat_ip_address
    kibana  = yandex_compute_instance.kibana.network_interface.0.nat_ip_address
    web1    = yandex_compute_instance.web-1.network_interface.0.nat_ip_address
    web2    = yandex_compute_instance.web-2.network_interface.0.nat_ip_address
    bastion = yandex_compute_instance.bastion.network_interface.0.nat_ip_address
  }
}

# Команды для SSH подключения
output "ssh_commands" {
  description = "Команды для SSH подключения к ВМ"
  value = {
    zabbix  = "ssh -i ~/.ssh/yassh user@${yandex_compute_instance.zabbix.network_interface.0.nat_ip_address}"
    elastic = "ssh -i ~/.ssh/yassh user@${yandex_compute_instance.elastic.network_interface.0.nat_ip_address}"
    kibana  = "ssh -i ~/.ssh/yassh user@${yandex_compute_instance.kibana.network_interface.0.nat_ip_address}"
    web1    = "ssh -i ~/.ssh/yassh user@${yandex_compute_instance.web-1.network_interface.0.nat_ip_address}"
    web2    = "ssh -i ~/.ssh/yassh user@${yandex_compute_instance.web-2.network_interface.0.nat_ip_address}"
    bastion = "ssh -i ~/.ssh/yassh user@${yandex_compute_instance.bastion.network_interface.0.nat_ip_address}"
  }
}