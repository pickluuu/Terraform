resource "aws_vpc" "this" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = false


  tags = {
    Name = "my-vpc"
    Env  = "Testing"
  }
}

resource "aws_subnet" "public_subnet" {
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

resource "aws_route_table" "public_route" {
  vpc_id = "aws_vpc.this.id"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id

  }
}

resource "aws_route_table_association" "public_route" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route.id
}