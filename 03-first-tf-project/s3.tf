resource "random_id" "bucket_siffix" {
  byte_length = 6
}

resource "aws_s3_bucket" "bucket_firt_tf_project" {
  bucket = "my-tf-bucket-${random_id.bucket_siffix.hex}"
}

output "bucket_id" {
  value = aws_s3_bucket.bucket_firt_tf_project.id
}