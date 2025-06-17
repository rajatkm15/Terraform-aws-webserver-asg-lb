output "sg_web" {
  description = "Secuirty group info. for ec2 instances"
  value = aws_security_group.sg_web.id
}

output "sg_alb" {
  description = "Security group for ALB"
  value = aws_security_group.sg_alb.id
  }
