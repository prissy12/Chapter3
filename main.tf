provider "aws" {
region = "us-east-1"
}

resources "aws_s3_bucket" "terraform_state" {
bucket = "toms1-terraform_state"

versioning {
enabled = true
}

lifecycle {
prevent_destory = true
}
}
