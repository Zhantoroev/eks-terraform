# ==================== HyperScience filestore Bucket =======================

module "hs_k8s_filestore" {
  source = "../../terraform-modules/S3_Buckets"

  env    = local.env
  client = "test"
}
