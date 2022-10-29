#===================== EKS Cluster's root module =========================

module "eks_cluster" {
  source = "../../terraform-modules/eks_cluster"

  env             = local.env
  vpc_id          = module.networking.vpc_id
  cluster_name    = "test"
  cluster_version = "1.21"
  subnets         = module.networking.private_subnets

  node_groups = {
    platform = {
      desired_size = 3
      max_size     = 4
      min_size     = 2

      disk_size      = 50
      instance_types = ["t2.medium"]

      version = "1.21"
      labels = {
        hs-component = "platform"
      }
    },
    trainer = {
      desired_size = 2
      max_size     = 4
      min_size     = 1

      disk_size      = 40
      instance_types = ["t2.medium"]

      version = "1.21"
      labels = {
        hs-component = "trainer"
      }
    }
  }
}
