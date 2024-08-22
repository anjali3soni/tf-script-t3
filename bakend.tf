terraform {
  backend "s3" {
    bucket = "jk-bucket-12345"
    key = "task-jk-pipe-last/terraform.tfstate"
    region = "us-east-2"
  }
}