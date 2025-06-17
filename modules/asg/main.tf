#AWS auto scaling group


resource aws_autoscaling_group "asg" {
  launch_template {
    id = var.template_name
    version = "$Latest"
  }

  vpc_zone_identifier = var.subnet
  max_size = var.max_size
  min_size = var.min_size
  desired_capacity = var.desired_capacity
  target_group_arns = var.target_group
  health_check_type = "ELB" #EC2/ELB
  tag {
    key = "Name" 
    value = "asg-instance"
    propagate_at_launch = true
  }
}
  
