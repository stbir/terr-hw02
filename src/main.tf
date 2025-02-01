data "yandex_vpc_network" "develop" {
  folder_id = var.folder_id
  name      = var.vpc_name
  }

resource "yandex_vpc_subnet" "develop" {
  folder_id      = var.folder_id
  name           = var.vpc_name
  v4_cidr_blocks = var.default_cidr
  zone           = var.default_zone
  network_id     = data.yandex_vpc_network.develop.id
  route_table_id = yandex_vpc_route_table.rt.id
}
resource "yandex_vpc_subnet" "develop_b" {
  folder_id      = var.folder_id
  name           = var.vpc_name_b
  v4_cidr_blocks = var.default_cidr_b
  zone           = var.default_zone_b
  network_id     = data.yandex_vpc_network.develop.id
  route_table_id = yandex_vpc_route_table.rt.id
}

resource "yandex_vpc_gateway" "nat_gateway" {
  folder_id      = var.folder_id
  name = "test-gateway"
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "rt" {
  folder_id      = var.folder_id
  name       = "test-route-table"
  network_id = data.yandex_vpc_network.develop.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.nat_gateway.id
  }
}




resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
# resource "yandex_vpc_subnet" "develop" {
#   name           = var.vpc_name
#   zone           = var.default_zone
#   network_id     = yandex_vpc_network.develop.id
#   v4_cidr_blocks = var.default_cidr
# }

# resource "yandex_vpc_subnet" "develop_b" {
#   name           = var.vpc_name_b
#   zone           = var.default_zone_b
#   network_id     = yandex_vpc_network.develop.id
#   v4_cidr_blocks = var.default_cidr_b
# }
data "yandex_compute_image" "ubuntu" {
  family = var.vm_family
}
resource "yandex_compute_instance" "platform" {
  name        = local.name_platform
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.fraction
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
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = false
  }
    metadata = var.metadata
}
