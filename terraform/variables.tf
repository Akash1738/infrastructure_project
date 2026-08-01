variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "vpc_id" {
  type    = string
  default = "vpc-02f7a4c516baee7d2"
}

variable "subnet_id" {
  type    = string
  default = "subnet-096e5fffa72b98f19"
}

variable "ami" {
  type    = string
  default = "ami-01a00762f46d584a1"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = "agent-key-new"
}
