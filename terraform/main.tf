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
  name = "samj4/movie-webapp:latest"
}

resource "docker_container" "app_container" {
  name  = "movie-container"
  image = docker_image.app_image.name
  ports {
    internal = 8080
    external = 8080
  }
}
