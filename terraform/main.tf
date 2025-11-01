resource "aws_instance" "frontend_server" {
  ami           = "ami-0c2b8ca1dad447f8a"
  instance_type = "t2.micro"
  key_name      = "my-key"
  security_groups = [aws_security_group.allow_http.name]

  user_data = templatefile("${path.module}/user_data.tpl", {
    docker_image   = var.docker_image
    dockerhub_user = var.dockerhub_user
    dockerhub_pass = var.dockerhub_pass
  })

  tags = {
    Name = "frontend-auto-deploy"
  }
}

output "instance_public_ip" {
  value = aws_instance.frontend_server.public_ip
}
