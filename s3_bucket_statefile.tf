resource "aws_s3_bucket" "devsecopsb39tfstate" {
  bucket = "vikelnkm"

  tags = {
    Name        = "${var.vpc_name}-state-bucket"
    Environment = var.env
  }
} 