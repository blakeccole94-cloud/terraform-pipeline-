terraform {
  required_providers {
    random = { source = "hashicorp/random" }
    local  = { source = "hashicorp/local" }
  }
}

resource "random_pet" "name" {}

resource "local_file" "deployed" {
  filename = "${path.module}/deployed.txt"
  content  = "Deployed by pipeline v2: ${random_pet.name.id}"
}

output "pet_name" {
  value = random_pet.name.id
}
