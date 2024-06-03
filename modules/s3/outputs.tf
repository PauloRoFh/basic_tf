output "bucket_domain_name" {
  value       = aws_s3_bucket.s3_bucket.bucket_domain_name
  sensitive   = false
  description = "Domínio do bucket S3"

}

output "bucket_id" {
  value       = aws_s3_bucket.s3_bucket.id
  sensitive   = false
  description = "Id de domínio do bucket S3"
}