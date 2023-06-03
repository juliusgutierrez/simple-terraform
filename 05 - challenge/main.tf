provider "aws" {
  region = "eu-west-2"
}

variable "cidr_block" {
  type = string
  default = "192.168.0.0/24"
}

variable "inputname" {
  type = string
  default = "terraformVPC"
  description = "Set the name of the VPC"
}

resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr_block

  tags = {
    Name = var.inputname
  }
}