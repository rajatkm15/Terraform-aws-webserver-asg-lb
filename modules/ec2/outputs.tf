output "template_name" {
  description = "AWS launch template name"
  value = aws_launch_template.template.id
}
