#AWS launch template

resource "aws_launch_template" "template" {
  name_prefix = "web-"
  image_id = var.imageid
  instance_type = var.instance_type
  key_name = var.key
  vpc_security_group_ids = var.security_group_id
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "web"
    }
  }
  user_data = base64encode(templatefile("${path.root}/script/script.sh", {}))
  
}

