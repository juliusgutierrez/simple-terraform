variable "web_name" {
  type = string
}

resource "aws_eip" "elasticeip" {
  instance = var.web_name
}

output "eip_ip" {
  value = aws_eip.elasticeip.public_ip
}