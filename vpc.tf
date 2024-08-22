module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "jk-vpc"
  cidr = "10.0.0.0/16"

  azs = ["us-east-2a","us-east-2b"]
  private_subnets = ["10.0.1.0/24","10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_vpn_gateway = true

  public_subnet_names = [
    "pub-sub1", "pub-sub2"
  ]

  private_subnet_names = [
    "pr-sub1","pr-sub2"
  ]

  vpc_tags = {
    Name = "jk-vpc"
  }

  map_public_ip_on_launch = true
}