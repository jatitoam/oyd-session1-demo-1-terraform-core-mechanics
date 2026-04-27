resource "aws_s3_bucket" "demo" {
  bucket = "oyd-demo-dev-live"

  tags = {
    Environment = "dev"
    ManagedBy   = "terraform"
    Session     = "1"
  }
}
