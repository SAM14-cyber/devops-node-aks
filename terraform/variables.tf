variable "dockerhub_user" {
  description = "Docker Hub username"
  type        = string
}

variable "dockerhub_pass" {
  description = "Docker Hub password"
  type        = string
  sensitive   = true
}
