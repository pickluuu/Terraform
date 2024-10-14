resource "aws_instance" "web" {
  ami                         = "ami-0de3736b2ee1b8978"
  associate_public_ip_address = true
  instance_type               = "t3a.small"
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.public_http_traffic.id]


  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }

  # Fixing attribute issues
  source_dest_check           = true
  user_data_replace_on_change = true

  depends_on = [
    aws_subnet.public_subnet,
    aws_security_group.public_http_traffic
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