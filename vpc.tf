module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name                 = "${var.project_name}-${var.env}"
  cidr                 = var.vpc_subnet
  azs                  = data.aws_availability_zones.available.names
  private_subnets      = var.vpc_private_subnets
  public_subnets       = var.vpc_public_subnets
  enable_nat_gateway   = true
  enable_vpn_gateway   = var.enable_vpn_gateway
  database_subnets     = var.database_subnets
  tags                 = var.tags
}

