# variable "aws_region" {
#   type = string
# }

variable "ec2_instance_type" {
  type    = string
  default = "t2.micro"

  validation {
    condition     = contains(["t2.micro", "t2.small", "t2.medium"], var.ec2_instance_type)
    error_message = "allow only the t2.micro,t2.small,t2.medium"
  }
}

variable "ec2_volume_type" {
  type    = string
  default = "gp3"
}

variable "ec2_volume_size" {
  type    = number
  default = 10

}
