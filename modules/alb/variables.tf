variable "alb_name" {
  description = "ALB name"
  type = string
}

variable "sg_alb" {
  description = "Security group for ALB"
  }

variable "subnets" {
  description = "Subnet"
}

variable "port" {
  description = "Port number where load balancer will listen for incoming traffic"
  type = number
}


variable "protocol" {
  description = "protocol"
  type = string
}

variable "tg_name" {
  description = "Target group name"
  type = string

}

variable "vpc_id" {
  description = "VPC id"
}


