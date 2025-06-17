output "subnet_id" {
  description = "Subnet information withing default VPC"
  value = data.aws_subnets.subnet.ids
}

output "vpc_id" {
 description = "VPC id"
 value = data.aws_vpc.vpc.id
}

