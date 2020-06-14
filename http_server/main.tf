data "template_file" "httpd_user_data" {
  template = file("./http_server/user_data.sh.tpl")

  vars = {
    package = "httpd"
  }
}

resource "aws_instance" "default" {
  ami                    = "ami-0f9ae750e8274075b"
  vpc_security_group_ids = [aws_security_group.default.id]
  instance_type          = var.instance_type

  user_data = data.template_file.httpd_user_data.rendered
}

resource  "aws_security_group" "default" {
  name = "ec2"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
