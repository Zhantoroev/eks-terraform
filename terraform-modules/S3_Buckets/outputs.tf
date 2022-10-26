#====================== backend_bucket/outputs.tf ========================

output "bucket_name" {
  description = "Bucket name"
  value       = aws_s3_bucket.bucket.id
}
