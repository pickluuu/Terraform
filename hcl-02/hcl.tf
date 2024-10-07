terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.37.0"
    }
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my_bucket"

  tags = {
  }
}
