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
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "app_container" {
  name  = "nginx_container"
  image = docker_image.app_image.image_id
  ports {
    internal = 80
    external = 8080
  }
}
