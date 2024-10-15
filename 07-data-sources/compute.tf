resource "aws_instance" "web" {
  ami                         = "ami-07b783cb49fc7ef94"
  associate_public_ip_address = true
  instance_type               = "t3a.small"

  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }
}