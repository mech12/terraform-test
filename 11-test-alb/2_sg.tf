resource "aws_security_group" "akbun-mysg" {
  vpc_id      = aws_vpc.akbun-vpc.id
  name        = "T101 SG"
  description = "T101 Study SG"
}

resource "aws_security_group_rule" "mysginbound" {
  type              = "ingress"
  from_port         = 0
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.akbun-mysg.id
}

resource "aws_security_group_rule" "mysgoutbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.akbun-mysg.id
}
