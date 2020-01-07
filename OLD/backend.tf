terraform {
  backend "s3" {
    bucket = "backend-state-salomat"
    key    = "infrastructure"
    region = "us-east-1"
  }
}