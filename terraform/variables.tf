variable "region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "availability_zone" {
  default = "ap-south-1a"
}

variable "ami" {
  default = "ami-01a00762f46d584a1"
}

variable "instance_type" {
  default = "t3.small"
}

variable "key_name" {
  default = "agent-key-new"
}
