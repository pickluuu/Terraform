data "aws_ami" "ubuntu" {

  most_recent = true
  owners      = ["099720109477"] # Owner is canonical
  provider    = aws.eu-west-1

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

output "ubuntu_ami_data" {
  value = data.aws_ami.ubuntu
}


# resource "aws_instance" "web" {
#   ami                         = "ami-07b783cb49fc7ef94"
#   associate_public_ip_address = true
#   instance_type               = "t3a.small"

#   root_block_device {
#     delete_on_termination = true
#     volume_size           = 10
#     volume_type           = "gp3"
#   }
# }