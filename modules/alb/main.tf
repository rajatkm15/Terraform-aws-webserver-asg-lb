resource "aws_lb" "alb" {
  name = var.alb_name
  security_groups = var.sg_alb
  load_balancer_type = "application"
  subnets = var.subnets
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port = var.port
  protocol = var.protocol
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "404: Page Not Found"
      status_code = 404
    }
 }
}

resource "aws_lb_target_group" "tg_alb" {
  name = var.tg_name
  port = var.port
  protocol = var.protocol
  vpc_id = var.vpc_id
  health_check {
    path = "/"
    protocol = var.protocol
    matcher = 200
    interval = 15
    timeout = 3
    healthy_threshold = 2
    unhealthy_threshold = 3
  }
}

resource "aws_lb_listener_rule" "listener_rule" {
  listener_arn = aws_lb_listener.listener.arn
  priority = 100

  condition {
    path_pattern {
      values = ["*"]
    }
  }

  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg_alb.arn

  }
}
 

