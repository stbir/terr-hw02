
resource "yandex_compute_instance" "db" {
  provider = yandex.zone_b
  name        = local.name_db
  platform_id = var.vm_db_platform_id
  resources {
    cores         = var.vms_resources.db.cores
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.fraction
  }

  
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop_b.id
    nat       = false
  }

  

  metadata = var.metadata

}