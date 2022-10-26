#=========================== eks_cluster/modules/variables.tf ===============================

variable "env" {
  description = "Environment name to create resource in."
  type        = string
}

variable "cluster_name" {
  description = "EKS Cluster name"
  type        = string
}

variable "cluster_version" {
  description = "EKS Cluster version."
  type        = string
}

variable "public_access_cidrs" {
  default = ["0.0.0.0/0"]
}

variable "additional_sg" {
  description = "Additional Security Groups for EKS Cluster."
  default     = []
}

variable "cluster_log_types" {
  description = "List of the desired control plane logging to enable."
  type        = list(string)
  default     = null
}

variable "node_groups" {
  type    = any
  default = {}
}

variable "subnets" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}
