#===================== Networking root module =========================

module "networking" {
  source = "../../terraform-modules/networking"

  env              = local.env
  vpc_cidr         = "10.0.0.0/16"
  public_sn_count  = 3
  private_sn_count = 3
}





