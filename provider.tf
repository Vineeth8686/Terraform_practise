terraform {
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
# terraform {
#   backend "s3" {
#     bucket = "vikelnkm"
#     key    = "path/terraform.tfstate"
#     region = "ap-south-1"
#     dynamodb_table = "devsecopsb39-terraform-locks"
#     encrypt        = true
#   }
# }
