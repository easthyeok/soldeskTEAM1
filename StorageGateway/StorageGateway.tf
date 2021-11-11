resource "aws_storagegateway_gateway" "example" {
  gateway_ip_address = "ec2 public ip"
  gateway_name       = "example"
  gateway_timezone   = "GMT+9:00"
  gateway_type       = "FILE_S3"
}
