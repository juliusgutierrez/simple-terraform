variable "ec2name" {
  type = string
}


resource "aws_instance" "dbserver" {
  ami = "ami-032598fcc7e9d1c7a"
  instance_type = "t2.micro"
  tags = {
        Name = var.ec2name
  }
}
