terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.36.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
  backend "s3" {
    bucket  = "rocketseat-state-terraform-lemur"
    region  = "us-east-2"
    key     = "terraform.tfstate"
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-2"
}


resource "random_pet" "bucket_name" {
  length    = 1
  separator = "-"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "rocketseat-state-terraform-${random_pet.bucket_name.id}"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.bucket

  versioning_configuration {
    status = "Enabled"
  }

  depends_on = [aws_s3_bucket.terraform_state]

}