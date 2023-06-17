provider "aws" {
  region = "eu-west-2"
}

resource "aws_db_instance" "my_rds" {
    name = "my_rds"
    identifier = "my-first-rds"
    instance_class = "db.t2.micro"
    engine = "mariadb"
    engine_version = "10.2.21"
    username = "test_username"
    password = "test_password"
    port = 3306
    allocated_storage = 20
    skip_final_snapshot = true
}