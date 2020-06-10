provider "aws" {
  version = "= 2.50.0"
  region  = var.region
  profile = "myaccount"
}


terraform {
  required_version = ">= 0.12.0"
}
resource "aws_instance" "exmaple" {
  ami           = "ami-0f9ae750e8274075b"
  instance_type = "t3.micro"
}
