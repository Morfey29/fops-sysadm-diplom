# outputs.tf

# Внешние IP адреса (публичные)
output "zabbix_public_ip" {
  description = "Внешний IP адрес Zabbix сервера"
  value       = yandex_compute_instance.zabbix.network_interface.0.nat_ip_address
}

output "kibana_public_ip" {
  description = "Внешний IP адрес Kibana сервера"
  value       = yandex_compute_instance.kibana.network_interface.0.nat_ip_address
}

output "bastion_public_ip" {
  description = "Внешний IP адрес Bastion сервера"
  value       = yandex_compute_instance.bastion.network_interface.0.nat_ip_address
}

output "load_balancer_ip" {
  description = "External IP address of Load Balancer"
  value       = yandex_alb_load_balancer.l7a.listener[0].endpoint[0].address[0].external_ipv4_address
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