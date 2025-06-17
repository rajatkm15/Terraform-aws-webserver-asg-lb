#Input Variables for Auto Scaling Group module

variable "template_name" {
  description = "variable for launch template"
  type = string
}

variable "subnet" {
  description = "Subnet information within the vpc"
}

variable "max_size" {
  description = "Maximum number of instance"
  type = number
}

variable "min_size" {
  description = "Minimum number of instance"
  type = number
}

variable "desired_capacity" {
  description = "desired number of instance launched initially"
  type = number
  default = 2
}

variable "target_group" {
  description = "target group for the ASG"
}

