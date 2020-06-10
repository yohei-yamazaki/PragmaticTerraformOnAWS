provider "aws" {
  version = "= 2.50.0"
  region  = var.region
  profile = "myaccount"
}

terraform {
  required_version = ">= 0.12.0"
}

resource "aws_instance" "exmaple" {
  ami                    = "ami-0f9ae750e8274075b"
  instance_type          = var.env == "prod" ? "m5.large" : "t3.micro"
  vpc_security_group_ids = [aws_security_group.example_ec2.id]

  user_data = <<EOF
    #!/bin/bash
    yum install -y httpd
    systemctl start httpd.service
EOF
}
