# AWS Module for Terraform S3 Buckets

## This module will create:
- _s3 Bucket_

## **Usage**
```terraform
module "backend" {
  source = "path/to/this/module"
  env    = "test"
  client = "<client_name>"
}
```
```bash
export AWS_ACCESS_KEY_ID=<write your access key id>
export AWS_SECRET_ACCESS_KEY=<write you secret access key>
export AWS_DEFAULT_REGION=<write default region to create resource in>
```

Then perform the following commands on the root folder:
- `terraform init` terraform initialization
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply infrastructure build
- `terraform destroy` to destroy the infrastructure

# **Resources**
|Name | Type|
|-----|-----|
|[aws_s3_bucket.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)|resource|
|[aws_s3_bucket_public_access_block.public_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_account_public_access_block)|resource|
|[aws_s3_bucket_acl.bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl)|resource|
|[aws_s3_bucket_server_side_encryption_configuration.bucket_encryption](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration)|resource|
|[aws_s3_bucket_versioning.bucket_versioning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning)|resource|
|[aws_kms_key.key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key)|resource|
|[aws_kms_alias.alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias)|resource|


# **Inputs**
|Name|Description|Type|Default|Required|
|----|-----------|----|-------|--------|
|`tags`|A mapping of tags to assign.|`map(string)`|`{}`|no|
|`env`|Environment name to create resource in.|`string`|no|yes|
|`bucket_versioning`|The bucket and all objects should be destroyed when using true.|`bool`|`true`|yes|
|`kms_enable_key_rotation`|Enable key rotation for the KMS key.|`bool`|`false`|no|

# **Outputs**
|Name|Description|
|----|-----------|
|`bucket_name`|Bucket name.|