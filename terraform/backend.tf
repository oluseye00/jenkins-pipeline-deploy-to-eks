terraform {
  backend "s3" {
    bucket = "primuslearning1-app"
    region = "us-east-1"
    key = "eks/terraform.tfstate"
    profile = "terraform-user"
  }
}