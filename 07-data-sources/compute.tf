resource "aws_instance" "web" {
  ami                         = "ami-07b783cb49fc7ef94"
  associate_public_ip_address = true
  instance_type               = "t3a.small"
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.public_http_traffic.id]


  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }
}