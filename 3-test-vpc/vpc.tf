# vpc 생성
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main"
  }
}

# 서브넷 생성 (public)
resource "aws_subnet" "public01" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/20"

  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "public_subnet01"
  }
}

resource "aws_subnet" "public02" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.16.0/20"

  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "public_subnet02"
  }
}

# 서브넷 생성 (private)
resource "aws_subnet" "private01" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.32.0/20"

  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "private_subnet01"
  }
}

resource "aws_subnet" "private02" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.48.0/20"

  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "private_subnet02"
  }
}

# 인터넷 게이트웨이 생성
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

# 보안그룹 생성
resource "aws_security_group" "remote" {
  vpc_id      = aws_vpc.main.id
  name        = "remote"
  description = "remote"

  # 인바운드 규칙 설정
  ingress {
    from_port   = 22            # 인바운드 시작 포트
    to_port     = 22            # 인바운드 끝나는 포트
    protocol    = "tcp"         # 사용할 프로토콜
    description = "ssh"         # 자세한 프로토콜 종류
    cidr_blocks = ["0.0.0.0/0"] # 허용할 IP 범위
  }

  # 아웃바운드 규칙 설정
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "web" {
  vpc_id      = aws_vpc.main.id
  name        = "web"
  description = "web"

  # 인바운드 규칙 설정
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "http"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    description = "https"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # 아웃바운드 규칙 설정
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 라우팅 테이블 생성
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "rt"
  }
}

# 라우팅 테이블과 서브넷 관계 설정
resource "aws_route_table_association" "public01" {
  subnet_id      = aws_subnet.public01.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "public02" {
  subnet_id      = aws_subnet.public02.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "private01" {
  subnet_id      = aws_subnet.private01.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "private02" {
  subnet_id      = aws_subnet.private02.id
  route_table_id = aws_route_table.rt.id
}
