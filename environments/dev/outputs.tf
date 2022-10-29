output "private_sn_id" {
  value     = module.networking.private_subnets
  sensitive = true
}
