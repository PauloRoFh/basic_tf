resource "random_pet" "bucket_name" {
  length    = 1
  separator = "-"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "rocketseat-bucket-iac-${random_pet.bucket_name.id}-${terraform.workspace}"

  tags = {
    Name    = "Primeiro bucket"
    Iac     = "true"
    context = "${terraform.workspace}"
  }
}

resource "aws_s3_bucket_website_configuration" "bucket" {
  bucket = aws_s3_bucket.s3_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }

  depends_on = [aws_s3_bucket.s3_bucket]
}
 