#Main configuration file

module "template" {
 source = "./modules/ec2/"
 imageid = "ami-0f918f7e67a3323f0"
 instance_type = "t2.micro"
 key = "ansible_ssh_key"
 security_group_id = [module.securitygroup.sg_web]
}

module "datastore" {
 source = "./modules/datastores"
}

module "securitygroup" {
  source = "./modules/security_groups"
  sg_web_name = "sg_web"
  vpc_id = module.datastore.vpc_id
  http_port = local.http_port
  protocol = local.protocol
  sg_alb_name = "sg_alb"
  all_ip = local.all_ip
}

module "asg" {
  source = "./modules/asg"
  template_name = module.template.template_name
  subnet = module.datastore.subnet_id
  max_size = 4
  min_size = 1
  target_group = [module.alb.tg_arn]
}

module "alb" {
  source = "./modules/alb"
  alb_name = "alb-web"
  sg_alb = [module.securitygroup.sg_alb]
  subnets = module.datastore.subnet_id
  port = local.http_port
  protocol = local.http_protocol
  tg_name = "tg-alb"
  vpc_id = module.datastore.vpc_id
 }

output "dns_name" {
value = module.alb.alb_dns_name
}
