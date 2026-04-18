
#считываем данные об образе ОС
data "yandex_compute_image" "ubuntu_2204_lts" {
  family = "ubuntu-2204-lts"
}

#--------------------bastion----------------------------------
resource "yandex_compute_instance" "bastion" {
  name        = "vm-bastion" #Имя ВМ в облачной консоли
  hostname    = "bastion" #формирует FDQN имя хоста, без hostname будет сгенрировано случаное имя.
  platform_id = "standard-v3"
  allow_stopping_for_update = true
  zone        = "ru-central1-a" #зона ВМ должна совпадать с зоной subnet!!!

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  boot_disk {
    disk_id = "${yandex_compute_disk.disk-bastion.id}"
  }

  metadata = {
    user-data          = file("./cloud-init.yml")
  }

  scheduling_policy {preemptible = true }

  network_interface {
    subnet_id          = yandex_vpc_subnet.public.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.internal.id, yandex_vpc_security_group.public-bastion.id]
  }
}

#--------------------web-1----------------------------------
resource "yandex_compute_instance" "web-1" {
  name        = "vm-web-1"      #Имя ВМ в облачной консоли
  hostname    = "web-1"         #формирует FDQN имя хоста, без hostname будет сгенрировано случаное имя.
  platform_id = "standard-v3"
  allow_stopping_for_update = true
  zone        = "ru-central1-a" #зона ВМ должна совпадать с зоной subnet!!!

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  boot_disk {
    disk_id = "${yandex_compute_disk.disk-web-1.id}"
  }

  metadata = {
    user-data          = file("./cloud-init.yml")
  }

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id          = yandex_vpc_subnet.subnet_web-1.id
    security_group_ids = [yandex_vpc_security_group.internal.id]
  }
}

#--------------------web-2----------------------------------
resource "yandex_compute_instance" "web-2" {
  name        = "vm-web-2"     #Имя ВМ в облачной консоли
  hostname    = "web-2"        #формирует FDQN имя хоста, без hostname будет сгенрировано случаное имя.
  platform_id = "standard-v3"
  allow_stopping_for_update = true
  zone        = "ru-central1-b" #зона ВМ должна совпадать с зоной subnet!!!

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  boot_disk {
    disk_id = "${yandex_compute_disk.disk-web-2.id}"
  }

  metadata = {
    user-data          = file("./cloud-init.yml")
  }

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id          = yandex_vpc_subnet.subnet_web-2.id
    security_group_ids = [yandex_vpc_security_group.internal.id]
  }
}

#--------------------zabbix----------------------------------
resource "yandex_compute_instance" "zabbix" {
  name        = "vm-zabbix"    #Имя ВМ в облачной консоли
  hostname    = "zabbix"       #формирует FDQN имя хоста, без hostname будет сгенрировано случаное имя.
  platform_id = "standard-v3"
  allow_stopping_for_update = true
  zone        = "ru-central1-a" #зона ВМ должна совпадать с зоной subnet!!!

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  boot_disk {
    disk_id = "${yandex_compute_disk.disk-zabbix.id}"
  }

  metadata = {
    user-data          = file("./cloud-init.yml")
  }

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id          = yandex_vpc_subnet.public.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.internal.id, yandex_vpc_security_group.public-zabbix.id]
  }
}

#--------------------elastic----------------------------------
resource "yandex_compute_instance" "elastic" {
  name        = "vm-elastic" #Имя ВМ в облачной консоли
  hostname    = "elastic" #формирует FDQN имя хоста, без hostname будет сгенрировано случаное имя.
  platform_id = "standard-v3"
  zone        = "ru-central1-a" #зона ВМ должна совпадать с зоной subnet!!!

  resources {
    cores         = 2
    memory        = 4
    core_fraction = 20
  }

  boot_disk {
    disk_id = "${yandex_compute_disk.disk-elastic.id}"
  }

  metadata = {
    user-data          = file("./cloud-init.yml")
  }

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id          = yandex_vpc_subnet.private.id #зона ВМ должна совпадать с зоной subnet!!!
    security_group_ids = [yandex_vpc_security_group.internal.id]
  }
}

#--------------------kibana----------------------------------
resource "yandex_compute_instance" "kibana" {
  name        = "vm-kibana"    #Имя ВМ в облачной консоли
  hostname    = "kibana"       #формирует FDQN имя хоста, без hostname будет сгенрировано случаное имя.
  platform_id = "standard-v3"
  allow_stopping_for_update = true
  zone        = "ru-central1-a" #зона ВМ должна совпадать с зоной subnet!!!

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  boot_disk {
    disk_id = "${yandex_compute_disk.disk-kibana.id}"
  }

  metadata = {
    user-data          = file("./cloud-init.yml")
  }

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id          = yandex_vpc_subnet.public.id 
    nat                = true
    security_group_ids = [yandex_vpc_security_group.internal.id, yandex_vpc_security_group.public-kibana.id]
  }
}

