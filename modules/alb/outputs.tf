output "tg_arn" {
  description = "Target group informmation"
  value = aws_lb_target_group.tg_alb.arn
}

output "alb_dns_name" {
  description = "ALB dns name"
  value = aws_lb.alb.dns_name
}
