resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP inbound traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "frontend_server" {
  ami           = "ami-0c2b8ca1dad447f8a" # Amazon Linux 2 (ap-south-1)
  instance_type = "t2.micro"
  key_name      = "my-key" # Replace with your own AWS key pair name
  security_groups = [aws_security_group.allow_http.name]

  user_data = templatefile("${path.module}/user_data.tpl", {
    docker_image = var.docker_image
  })

  tags = {
    Name = "frontend-auto-deploy"
  }
}

output "instance_public_ip" {
  value = aws_instance.frontend_server.public_ip
}
