provider "aws" {
  version = "= 2.50.0"
  region  = var.region
  profile = "myaccount"
}

terraform {
  required_version = ">= 0.12.0"
}

locals {
  ami = "ami-0f9ae750e8274075b"
}

resource "aws_instance" "exmaple" {
  ami           = locals.ami
  instance_type = var.example_instance_type
}
