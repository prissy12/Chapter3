provider "aws" {
region = "us-east-1"
}

resources "aws_s3_bucket" "terraform_state" {
bucket = "toms1-terraform-up-and-running-stateterraform-up-and-running-state"

versioning {
enabled = true
}

lifecycle {
prevent_destory = true
}
}
output "s3_bucket_arn" {
  value = "${aws_s3_bucket.terraform_state.arn}"
  
 # Configure Terragrunt to use DynamoDB for locking
 lock = {
 backend = "dynamodb"
 config {    state_file_id = "global/s3"
 }}
 
 # Configure Terragrunt to automatically store tfstate files in S3
 remote_state = {
 backend = "s3"
 config {
 encrypt = "true"
 bucket  = "(toms1-terraform-up-and-running-stateterraform-up-and-running-state)"
 key     = "global/s3/terraform.tfstate"
 region  = "us-east-1"
 }
}
