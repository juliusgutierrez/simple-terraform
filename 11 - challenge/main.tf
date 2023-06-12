provider "aws" {
  region = "eu-west-2"
}

module "db" {
  source = "./db_server"
}

module "web" {
  source = "./web_server"
}

output "private_ip" {
  value = module.db.db_module_output 
}


output "publib_ip" {
  value = module.web.public_ip
}