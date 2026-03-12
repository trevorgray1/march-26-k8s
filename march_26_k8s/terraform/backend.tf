# Configure your remote backend here (e.g., S3 + DynamoDB for state locking)
# REMINDER: Set up your backend bucket/table manually before applying!
terraform {
  backend "s3" {
    bucket         = "<YOUR-BUCKET-NAME>" # TODO: Set bucket name
    key            = "eks/terraform.tfstate"
    region         = "<YOUR-REGION>"      # TODO: Set region
    dynamodb_table = "<YOUR-LOCK-TABLE>"  # TODO: Set DynamoDB table
    encrypt        = true
  }
}
