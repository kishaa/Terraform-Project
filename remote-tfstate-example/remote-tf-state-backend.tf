terraform {
  backend "s3" {
    bucket = "kishaa-s3-bucket"
    key    = "./terraform/tf-state"
    region = "ap-south-1"
  }
  
}