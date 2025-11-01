variable "docker_user" {
  description = "Docker username"
  type        = string
}

variable "docker_pass" {
  description = "Docker password"
  type        = string
  sensitive   = true
}
