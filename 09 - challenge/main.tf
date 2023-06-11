provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "dbserver" {
  ami = "ami-032598fcc7e9d1c7a"
  instance_type = "t2.micro"

  tags = {
        Name = "DB Server"
  }
}

resource "aws_instance" "webserver" {
  ami = "ami-032598fcc7e9d1c7a"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.allow_tcp.name]

  user_data = file("server-script.sh")
    tags = {
        Name = "Web Server"
    }
}

resource "aws_eip" "elasticeip" {
  instance = aws_instance.webserver.id
}

variable "tcp_port" {
  type = list(number)
  default = [80, 443]
}

resource "aws_security_group" "allow_tcp" {
  name = "Allow web traffic"
  
  dynamic "ingress" {
    iterator = port
    for_each = var.tcp_port
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
    
  }

  dynamic "egress" {
    iterator = port
    for_each = var.tcp_port
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
    
  }
}


output "privateIp" {
  description = "private ip"
  value = aws_instance.dbserver.private_ip
}

output "publicIp" {
  description = "public ip"
  value = aws_eip.elasticeip.public_ip
}
