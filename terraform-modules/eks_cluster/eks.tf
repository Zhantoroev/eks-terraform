#=========================== EKS Cluster ==============================
resource "aws_eks_cluster" "cluster" {
  name     = "${var.env}-${var.cluster_name}"
  role_arn = aws_iam_role.cluster.arn
  version  = var.cluster_version

  enabled_cluster_log_types = var.cluster_log_types

  vpc_config {
    security_group_ids      = flatten([aws_security_group.cluster.id, var.additional_sg])
    subnet_ids              = var.subnets
    endpoint_private_access = false
    endpoint_public_access  = true
    public_access_cidrs     = var.public_access_cidrs
  }

  depends_on = [
    aws_security_group_rule.cluster_egress_internet,
    aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.cluster_AmazonEKSServicePolicy,
    aws_iam_role_policy_attachment.cluster_AmazonEKSVPCResourceControllerPolicy
  ]

  lifecycle {
    create_before_destroy = false
  }
}

#==================== EKS Cluster's Security Group ====================
resource "aws_security_group" "cluster" {
  name_prefix = "${var.env}-${var.cluster_name}"
  description = "Cluster communication with worker nodes"
  vpc_id      = var.vpc_id

  tags = {
    Name = "SG-${var.cluster_name}"
  }
}

resource "aws_security_group_rule" "cluster_egress_internet" {
  description       = "Allow cluster egress access to the Internet."
  protocol          = "-1"
  security_group_id = aws_security_group.cluster.id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  to_port           = 0
  type              = "egress"
}

#======================= EKS Cluster's IAM Roles ========================
resource "aws_iam_role" "cluster" {
  name               = "${var.env}-${var.cluster_name}-iam"
  assume_role_policy = data.aws_iam_policy_document.cluster_AssumeRole.json
}

resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.cluster.name
}

resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.cluster.name
}

resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSVPCResourceControllerPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.cluster.name
}


data "aws_iam_policy_document" "cluster_AssumeRole" {
  statement {
    sid    = "EKSClusterAssumeRole"
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}
