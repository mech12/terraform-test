provider "aws" {
  # region = "ap-northeast-2"
  region = "us-west-2"

}

resource "aws_vpc" "akbun-vpc" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "t101-study"
  }
}

resource "aws_subnet" "akbun-subnet1" {
  vpc_id     = aws_vpc.akbun-vpc.id
  cidr_block = "10.10.1.0/24"

  availability_zone = "us-west-2a"

  tags = {
    Name = "t101-subnet1"
  }
}

resource "aws_subnet" "akbun-subnet2" {
  vpc_id     = aws_vpc.akbun-vpc.id
  cidr_block = "10.10.2.0/24"

  availability_zone = "us-west-2c"

  tags = {
    Name = "t101-subnet2"
  }
}


resource "aws_internet_gateway" "akbun-igw" {
  vpc_id = aws_vpc.akbun-vpc.id

  tags = {
    Name = "t101-igw"
  }
}

# route table 생성
resource "aws_route_table" "akbun-rt" {
  vpc_id = aws_vpc.akbun-vpc.id

  tags = {
    Name = "t101-rt"
  }
}

# route table과 subnet 연결
resource "aws_route_table_association" "akubun-rt-association1" {
  subnet_id      = aws_subnet.akbun-subnet1.id
  route_table_id = aws_route_table.akbun-rt.id
}

# route table과 subnet 연결
resource "aws_route_table_association" "akubun-rt-association2" {
  subnet_id      = aws_subnet.akbun-subnet2.id
  route_table_id = aws_route_table.akbun-rt.id
}

# route 규칙 추가
resource "aws_route" "mydefaultroute" {
  route_table_id         = aws_route_table.akbun-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.akbun-igw.id
}
