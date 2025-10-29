terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# Pull image from Docker Hub (your repo: samj4/devops-node-aks)
resource "docker_image" "app_image" {
  name = "samj4/devops-node-aks:latest"
}

# Run container
resource "docker_container" "app_container" {
  name  = "devops-container"
  image = docker_image.app_image.name
  ports {
    internal = 8080
    external = 8080
  }
}
