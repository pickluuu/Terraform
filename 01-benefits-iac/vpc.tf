terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}

resource "aws_vpc" "Testing" {
    cidr_block = "10.0.0.0/16"
}