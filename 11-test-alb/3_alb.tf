resource "aws_lb" "akbun-alb" {
  name               = "t101-alb"
  load_balancer_type = "application"
  subnets            = [aws_subnet.akbun-subnet1.id, aws_subnet.akbun-subnet2.id]
  security_groups    = [aws_security_group.akbun-mysg.id]

  tags = {
    Name = "t101-alb"
  }
}

resource "aws_lb_listener" "myhttp" {
  load_balancer_arn = aws_lb.akbun-alb.arn
  port              = 80
  protocol          = "HTTP"

  # By default, return a simple 404 page
  default_action {
    type = "fixed-response" # 고정 응답
    # type의 종류: fixed-response, forward, redirect, authenticate-oidc, authenticate-cognito

    fixed_response {
      content_type = "text/plain"
      message_body = "404: page not found - T101 Study"
      status_code  = 404
    }
  }
}

resource "aws_lb_target_group" "akbun-tg" {
  name     = "t101-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.akbun-vpc.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200-299" # 200-299: 200 ~ 299 사이의 응답 코드를 정상으로 판단
    interval            = 5
    timeout             = 3
    healthy_threshold   = 2 # 2번 연속 성공
    unhealthy_threshold = 2 # 2번 연속 실패
  }
}

resource "aws_lb_listener_rule" "akbun-albrule" {
  listener_arn = aws_lb_listener.myhttp.arn
  priority     = 100 # Listener Rule의 우선순위

  condition {
    path_pattern {
      values = ["*"]
    }
  }

  action { # Listener Rule의 동작
    type             = "forward"
    target_group_arn = aws_lb_target_group.akbun-tg.arn
  }
}

output "akbunalb_dns" {
  value       = aws_lb.akbun-alb.dns_name
  description = "The DNS Address of the ALB"
}
