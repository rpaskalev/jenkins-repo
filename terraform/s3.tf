

resource "aws_s3_bucket" "iqies_my_first_resourse" {
  bucket = "${var.bucket_name}-${data.aws_region.current.id}" #-${count.index}"
  #acl    = var.acl_type

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

