terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.1.0"
    }
  }
}

provider "local" {
  # Configuration options
}

resource "local_file" "hello" {
  content  = "Hello, Terraform"
  filename = "hello.txt"
}

