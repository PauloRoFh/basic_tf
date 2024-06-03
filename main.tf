module "s3" {
  source         = "./modules/s3"
  s3_bucket_name = "rocketseat-bucket-iac-longhorn-default"
  s3_tags = {
    Iac = true
  }
}