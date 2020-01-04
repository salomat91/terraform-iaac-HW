terraform {
  backend "s3" {
    bucket = "terraform-us-salomat"
    key    = "aws/ec2/ec2_state"
    region = "us-east-1"
  }
}