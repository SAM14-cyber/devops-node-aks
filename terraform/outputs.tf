output "container_id" {
  value = docker_container.app_container.id
}

output "app_url" {
  value = "http://localhost:8080"
}
