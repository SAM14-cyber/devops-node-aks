terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Pull the image from Docker Hub
resource "docker_image" "app_image" {
  name = var.image_name
}

# Run container from pulled image
resource "docker_container" "app_container" {
  name  = "devops_app_container"
  image = docker_image.app_image.image_id
  ports {
    internal = 8080
    external = 8080
  }
}
