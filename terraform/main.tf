terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.6.0"
}

provider "aws" {
  region = "ap-south-1" # you can change this region
}

# Create EC2 instance
resource "aws_instance" "app_server" {
  ami           = "ami-08e5424edfe926b43" # Ubuntu 22.04 for ap-south-1
  instance_type = "t2.micro"
  key_name      = "your-keypair"  # change to your EC2 key pair name

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install docker.io -y
              sudo systemctl start docker
              sudo docker login -u "${var.dockerhub_user}" -p "${var.dockerhub_pass}"
              sudo docker pull ${var.dockerhub_user}/cinescope-app:latest
              sudo docker run -d -p 80:80 ${var.dockerhub_user}/cinescope-app:latest
              EOF

  tags = {
    Name = "CineScope-Server"
  }
}

output "public_ip" {
  description = "Public IP of the deployed app"
  value       = aws_instance.app_server.public_ip
}
