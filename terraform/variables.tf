variable "aws_region" {
  default = "ap-south-1"
}

variable "docker_image" {
  description = "Docker image to deploy"
  default     = "<samj4>/frontend:latest"
}
