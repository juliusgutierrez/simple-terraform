resource "aws_instance" "dbserver" {
  ami = "ami-032598fcc7e9d1c7a"
  instance_type = "t2.micro"

  tags = {
        Name = "DB Server"
  }
}

output "db_module_output" {
  value = aws_instance.dbserver.private_ip
}