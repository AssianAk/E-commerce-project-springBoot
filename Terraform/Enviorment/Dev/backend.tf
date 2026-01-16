terraform {
  backend "s3" {
    bucket         = "akash-terraform-state-bucket786"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
