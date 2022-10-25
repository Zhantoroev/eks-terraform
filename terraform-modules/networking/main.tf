data "aws_availability_zones" "available" {}

#=========================== networking/variables.tf ===============================

module "networking" {
  source = "./modules"

  azs             = data.aws_availability_zones.available.names
  env             = var.env
  vpc_cidr_block  = var.vpc_cidr
  max_subnets     = var.max_subnets
  public_subnets  = var.public_sn_count
  private_subnets = var.private_sn_count
  public_cidrs    = [for i in range(2, 255, 2) : cidrsubnet(var.vpc_cidr, 8, i)]
  private_cidrs   = [for i in range(1, 255, 2) : cidrsubnet(var.vpc_cidr, 8, i)]
}