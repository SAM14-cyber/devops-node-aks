terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.3.0"
}

provider "docker" {}

# Pull your Docker image
resource "docker_image" "app_image" {
  name = "sam14/devops-node-aks:latest"
}

# Run the container
resource "docker_container" "app_container" {
  name  = "node-app"
  image = docker_image.app_image.latest
  ports {
    internal = 8080
    external = 8080
  }
}
