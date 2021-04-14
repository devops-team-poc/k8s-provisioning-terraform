provider "aws" {
  region  = "{{ region }}"
}

resource "aws_s3_bucket" "{{ bucket_name }}" {
  bucket = "{{ bucket_name }}"
  force_destroy = true
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "{{ dynamodb_table }}" {
  name         = "{{ dynamodb_table }}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
