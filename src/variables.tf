###cloud vars


variable "cloud_id" {
  type        = string
  default = "b1g543c75ruug8mfakgc"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default = "b1g9fimo39goc97r2arh"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_zone_b" {
  type        = string
  default = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "default_cidr_b" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}
variable "vpc_name_b" {
  type        = string
  default     = "develop_b"
  description = "VPC network & subnet name"
}

###ssh vars

# variable "vms_ssh_root_key" {
#   type        = string
#   default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILL13RigE0jLY4VYNjozf4uCXnOjz/b+ISKSp9TSVGfj bist@debian"
#   description = "ssh-keygen -t ed25519"
# }


###main vars

variable "vm__web_family" {
  type = string
  default = "ubuntu-2004-lts"
}

variable "vm_name" {
  type = string
  default = "netology-develop-platform"
}

# variable "vm_project1" {
#   type = string
#   default = "web"
# }
# variable "vm_project2" {
#   type = string
#   default = "db"
# }
variable "vm_web_platform_id" {
  type = string
  default = "standard-v1"
}

# variable "vm_web_cores" {
#   type = number
#   default = "2"
# }

# variable "vm_web_memory" {
#   type = number
#   default = "1"
# }

# variable "vm_web_core_fraction" {
#   type = number
#   default = "5"
# }

###db vars

variable "vm_family" {
  type = string
  default = "ubuntu-2004-lts"
}

variable "vm_db_name" {
  type = string
  default = "netology-develop-platform-db"
}

variable "vm_db_platform_id" {
  type = string
  default = "standard-v1"
}

# variable "vm_db_cores" {
#   type = number
#   default = "2"
# }

# variable "vm_db_memory" {
#   type = number
#   default = "2"
# }

# variable "vm_db_core_fraction" {
#   type = number
#   default = "20"
# }

variable "vms_resources" {
  default = {
    web = {
      cores = 2
      memory = 1
      fraction = 5
    },
    db = {
      cores = 2
      memory = 2
      fraction = 20
    }
  }
}

variable "metadata" {
  default = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILL13RigE0jLY4VYNjozf4uCXnOjz/b+ISKSp9TSVGfj bist@debian"
  }
}

variable "test" {
  type = any
  default = {
    "dev1" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117",
      "10.0.1.7",
    ],
    "dev2" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@84.252.140.88",
      "10.0.2.29",
    ],
    "prod1" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@51.250.2.101",
      "10.0.1.30",
    ]
  }
}
  
    