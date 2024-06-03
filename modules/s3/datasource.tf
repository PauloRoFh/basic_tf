data "aws_s3_bucket" "bucket" {
  bucket = "rocketseat-bucket-iac-${random_pet.bucket_name.id}-${terraform.workspace}"
}