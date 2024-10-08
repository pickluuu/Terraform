resource "aws_vpc" "this" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = false


  tags = {
    Name = "my-vpc"
    Env  = "Testing"
  }
}

resource "aws_subnet" "Public_subnet" {
  vpc_id     = "aws_vpc.this.id"
  cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = "aws_vpc.this.id"
  cidr_block = "10.0.1.0/24"

}

resource "aws_internet_gateway" "igw" {
  vpc_id = "aws_vpc.this.id"

  tags = {
    Name = "internet-gateway"
  }
}