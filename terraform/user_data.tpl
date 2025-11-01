#!/bin/bash
sudo apt update -y
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

echo "${dockerhub_pass}" | docker login -u "${dockerhub_user}" --password-stdin
docker pull ${dockerhub_user}/frontend:latest
docker run -d -p 80:80 ${dockerhub_user}/frontend:latest
