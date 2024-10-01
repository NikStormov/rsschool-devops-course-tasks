resource "aws_lb" "terraform-task2" {
  name               = "${var.ec2_instance_name}-lb"
  load_balancer_type = "application"
  internal           = false
  security_groups    = [aws_security_group.http.id]
  subnets            = [aws_subnet.private_subnets[*].id, aws_subnet.public_subnets[*].id]
}

resource "aws_alb_target_group" "task2_target_group" {
  name     = "${var.ec2_instance_name}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.root.id

  health_check {
    path                = "/"
    port                = "traffic-port"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 2
    interval            = 60
    matcher             = "200"
  }
}

resource "aws_alb_listener" "ec2-alb-http-listener" {
  load_balancer_arn = aws_lb.terraform-task2.id
  port              = "80"
  protocol          = "HTTP"
  depends_on        = [aws_alb_target_group.task2_target_group]

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.task2_target_group.arn
  }
}