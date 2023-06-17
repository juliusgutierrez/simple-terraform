terraform {
  backend "s3" {
    key = "terraform/tfstate.tfstate"
    bucket = "use-gutierrez-terraform-backup-bucket-2023"
    region = "eu-west-2"
    access_key = ""
    secret_key = ""
  }
}