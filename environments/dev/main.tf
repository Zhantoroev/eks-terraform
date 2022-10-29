provider "aws" {
  region = "us-east-1"
}


terraform {
  required_providers {
    aws = {
      version = "~> 4.20.0"
      source  = "hashicorp/aws"
    }
  }

  # backend "s3" {
  #   bucket            = "<bucket_name>"
  #   key               = "dev/terraform.tfstate"
  #   encrypt           = true
  #   kms_key_id        = "alias/dev-terraform-state"
  #   dynamodb_endpoint = "terraform-state"
  # }
}


locals {
  env = "dev"
}
