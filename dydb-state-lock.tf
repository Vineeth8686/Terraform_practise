# resource "aws_dynamodb_table" "basic-dynamodb-table" {
#   name           = "devsecopsb39-terraform-locks"
#   billing_mode   = "PAY_PER_REQUEST"
#   hash_key       = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }