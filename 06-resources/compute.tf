resource "aws_instance" "web" {
  ami                         = "ami-0e1335a4a4a3d8f5b"
  associate_public_ip_address = true
  instance_type               = "t3a.small"
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.public_http_traffic.id]

  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }

  depends_on = [
    aws_subnet.public_subnet,
    aws_security_group.public_http_traffic,
    aws_internet_gateway.igw,
    aws_route_table_association.public_route
  ]
}

resource "aws_security_group" "public_http_traffic" {
  description = "Security group allowing traffic on ports 443 and 80"
  name        = "allow_tls"
  vpc_id      = aws_vpc.this.id
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.public_http_traffic.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}