resource "aws_security_group" "sg_web" {
  name = var.sg_web_name
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "sg_web_inbound_rules" {
 description = "allow inbound http traffic only from load balancer to ec2 instance"
 type = "ingress"
 security_group_id = aws_security_group.sg_web.id
 from_port = var.http_port
 to_port = var.http_port
 protocol = var.protocol
 source_security_group_id = aws_security_group.sg_alb.id
}

resource "aws_security_group_rule" "sg_web_outbound_rules" {
 description = "allow all outgoing traffic"
 type = "egress"
 security_group_id = aws_security_group.sg_web.id
 from_port = var.http_port
 to_port = var.http_port
 protocol = "-1"
 cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group" "sg_alb" {
 name = var.sg_alb_name
 vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "sg_alb__inbound_rules" {
  type = "ingress"
  description = " allow inbound traffic from anywhere"
  security_group_id = aws_security_group.sg_alb.id
  from_port = var.http_port
  to_port = var.http_port
  protocol = var.protocol
  cidr_blocks = var.all_ip
}

resource "aws_security_group_rule" "sg_alb_outbound_rules" {
  description = "Allow outbound traffic to EC2 instance "
  type = "egress"
  security_group_id = aws_security_group.sg_alb.id
  from_port = var.http_port
  to_port = var.http_port
  protocol = "-1"
  source_security_group_id = aws_security_group.sg_web.id
 }
