terraform {
  backend "s3" {
    bucket = "rady-bucket-1-0-0"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      owner = "rady"
    }
  }
}
