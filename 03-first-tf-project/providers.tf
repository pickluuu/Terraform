terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket = "myapp-backup-bucket-uswest-2024"
    key    = "state.tfstate"
    region = "us-west-1"
  }
}

provider "aws" {
  region = "eu-west-1"
}