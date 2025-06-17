#AWS ami

variable "imageid" {
  description = "AWS ami, default to ubuntu server 24.04LTS"
  default = "ami-0f918f7e67a3323f0"
}

variable "instance_type" {
  description = "EC2 instance type"
  default = "t2.micro"
}

variable "key" {
  description = "SSH key"
 }

variable "security_group_id" {
  description = "Security group for the EC2 instance"
}
