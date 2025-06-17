data "aws_vpc" "vpc" {
  default = true 
  }

data "aws_subnets" "subnet" {
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
}
