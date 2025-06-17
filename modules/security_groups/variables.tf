variable "sg_web_name" {
 description = "Security group for EC2 instance"
 type = string
}

variable "sg_alb_name" {
 description = "Security group for ALB"
 type = string
}

variable "http_port" {
 description  = "HTTP PORT"
 type = number
}

variable "vpc_id" {
  description = "VPC where Security group will be created"
}

variable "protocol" {
 description = "Protocol"
 type = string
}

variable "all_ip" {
 description = "all"
}

