resource "aws_instance" "webserver" {
  ami = "ami-032598fcc7e9d1c7a"
  instance_type = "t2.micro"
  security_groups = [module.sg_module.sg_name]

  user_data = file("./web_server/server-script.sh")
    tags = {
        Name = "Web Server"
    }
}

module "sg_module" {
  source = "../security_groups"
}

module "eip_module" {
  source = "../eip"
  web_name = aws_instance.webserver.id 
}

output "public_ip" {
  value = module.eip_module.eip_ip
}


