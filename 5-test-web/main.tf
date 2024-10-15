
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami                    = "ami-0d081196e3df05f4d"
  instance_type          = "t2.nano"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
  #!/bin/bash
  sudo apt update -y
  sudo apt install apache2 -y
  sudo echo "roy" > /var/www/html/index.html
  EOF

  tags = {
    Name = "t101-week1-project1"
  }
}

resource "aws_security_group" "instance" {
  name = var.security_group_name

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

variable "security_group_name" {
  description = "The name of the security group"
  type        = string
  default     = "terraform-my-instance"
}

output "public_ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP of the Instance"
}
