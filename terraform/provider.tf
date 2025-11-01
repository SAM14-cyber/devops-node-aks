provider "aws" {
  region  = "ap-south-1" # or your preferred region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
