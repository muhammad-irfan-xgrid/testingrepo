// Create VPC
# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  # parameters
  name = var.vpc_name
  cidr = var.vpc_cidr
  azs             = [var.availability_zone1, var.availability_zone2]
  private_subnets = [var.private_subnet1_cidr, var.private_subnet2_cidr]
  public_subnets  = [var.public_subnet1_cidr, var.public_subnet2_cidr]
  enable_nat_gateway      = var.enable_nat_gateway
  enable_vpn_gateway      = var.enable_vpn_gateway
  single_nat_gateway      = var.single_nat_gateway
  one_nat_gateway_per_az  = var.one_nat_gateway_per_az
  tags = {
    Name = var.vpc_name
  }
}
