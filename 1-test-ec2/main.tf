provider "aws" {
  # region = "ap-northeast-2"
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0d081196e3df05f4d" # Ubuntu 22.04 LTS
  instance_type = "t2.nano"

  tags = {
    Name = "example-instance"
  }
}
