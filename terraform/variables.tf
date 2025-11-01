variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_name" {
  type    = string
  default = "" # optional, set if you want SSH access
}

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "docker_image" {
  default = "yourdockerhubuser/frontend:latest"
}

variable "allowed_ip" {
  description = "IP allowed to access the app (for security). Use 0.0.0.0/0 if public."
  type        = string
  default     = "0.0.0.0/0"
}
