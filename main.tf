resource "aws_s3_bucket" "terraform_state" {
  bucket = "tom-terraform-up"
  versioning {
  enabled = true
  }

  lifecycle {
  prevent_destroy = true  
  }
  }