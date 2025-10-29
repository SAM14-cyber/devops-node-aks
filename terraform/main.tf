terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "app_image" {
  name = var.image_name
}

resource "docker_container" "app_container" {
  name  = "devops-node-aks"
  image = docker_image.app_image.latest
  ports {
    internal = 8080
    external = 8080
  }
}
