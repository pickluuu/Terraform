resource "aws_vpc" "this" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = false


  tags = {
    Name = "my-vpc"
    Env = "Testing"
  }
}

