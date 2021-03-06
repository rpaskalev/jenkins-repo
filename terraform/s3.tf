

# resource "aws_s3_bucket" "iqies_my_first_resourse" {
#   bucket = "${var.bucket_name}-${data.aws_region.current.id}" #-${count.index}"
#   #acl    = var.acl_type

#   tags = {
#     Name        = var.bucket_name
#     Environment = var.environment
#   }
# }


resource "random_pet" "petname" {
  length    = 3
  separator = "-"
}


resource "aws_s3_bucket" "dev_bucket" {
  bucket = "development-${random_pet.petname.id}-${data.aws_region.current.id}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::development-${random_pet.petname.id}-${data.aws_region.current.id}/*"
            ]
        }
    ]
}
EOF

  website {
    index_document = "index.html"
    error_document = "error.html"

  }
  force_destroy = true
}

resource "aws_s3_bucket_object" "dev" {
  key          = "index.html"
  bucket       = aws_s3_bucket.dev_bucket.id
  content      = file("../assets/index.html")
  content_type = "text/html"

}

resource "aws_s3_bucket" "prod_bucket" {
  bucket = "production-${random_pet.petname.id}-${data.aws_region.current.id}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::production-${random_pet.petname.id}-${data.aws_region.current.id}/*"
            ]
        }
    ]
}
EOF

  website {
    index_document = "index.html"
    error_document = "error.html"

  }
  force_destroy = true
}

resource "aws_s3_bucket_object" "prod" {
  key          = "index.html"
  bucket       = aws_s3_bucket.prod_bucket.id
  content      = file("../assets/index.html")
  content_type = "text/html"
}


resource "aws_s3_bucket" "qa_bucket" {
  bucket = "qa-${random_pet.petname.id}-${data.aws_region.current.id}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::qa-${random_pet.petname.id}-${data.aws_region.current.id}/*"
            ]
        }
    ]
}
EOF

  website {
    index_document = "index.html"
    error_document = "error.html"

  }
  force_destroy = true
}

resource "aws_s3_bucket_object" "qa" {
  key          = "index.html"
  bucket       = aws_s3_bucket.qa_bucket.id
  content      = file("../assets/index.html")
  content_type = "text/html"
}