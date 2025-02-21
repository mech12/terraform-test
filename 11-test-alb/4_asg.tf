resource "aws_autoscaling_group" "akbun-asg" {
  name                 = "myasg"
  launch_configuration = aws_launch_configuration.akbun-launchconfig.name
  vpc_zone_identifier  = [aws_subnet.akbun-subnet1.id, aws_subnet.akbun-subnet2.id]

  # ELB 연결
  health_check_type = "ELB"
  target_group_arns = [aws_lb_target_group.akbun-tg.arn]

  min_size = 2
  max_size = 4

  tag {
    key                 = "Name"
    value               = "terraform-asg"
    propagate_at_launch = true
  }
}

resource "aws_launch_configuration" "akbun-launchconfig" {
  name_prefix                 = "t101-lauchconfig-"
  image_id                    = data.aws_ami.my_amazonlinux2.id
  instance_type               = "t2.nano"
  security_groups             = [aws_security_group.akbun-mysg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              wget https://busybox.net/downloads/binaries/1.31.0-defconfig-multiarch-musl/busybox-x86_64
              mv busybox-x86_64 busybox
              chmod +x busybox
              RZAZ=$(curl http://169.254.169.254/latest/meta-data/placement/availability-zone-id)
              IID=$(curl 169.254.169.254/latest/meta-data/instance-id)
              LIP=$(curl 169.254.169.254/latest/meta-data/local-ipv4)
              echo "<h1>RegionAz($RZAZ) : Instance ID($IID) : Private IP($LIP) : Web Server</h1>" > index.html
              nohup ./busybox httpd -f -p 80 &
              EOF

  # Required when using a launch configuration with an auto scaling group.
  lifecycle {
    create_before_destroy = true
    # 테라폼에서 라이프 사이클 조정(create_before_destroy)을 통해 삭제되기 전에 생성하도록 지정하여 서비스가 중단 없이 인프라를 업데이트.
  }
}
