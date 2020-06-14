provider "aws" {
  version = "= 2.50.0"
  region  = var.region
  profile = "myaccount"
}

terraform {
  required_version = ">= 0.12.0"
}

module "dev_server" {
  source        = "./http_server"
  instance_type = "t3.micro"
}
