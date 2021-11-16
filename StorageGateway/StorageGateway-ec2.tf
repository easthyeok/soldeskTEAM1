#ec2생성#
resource "aws_instance" "ec2-FileGateway" {
    ami = "ami-0889d8d66cff226d9"
    instance_type = "m4.xlarge"
    availability_zone = "ap-northeast-2a"
    
    key_name = "soldesk" 
    vpc_security_group_ids = [ 
    aws_security_group.terra-sg-pub-bastion.id 
  ] 
  tags = {
    Name = "FileGateway" 
  }
}

#disk 추가#
resource "aws_ebs_volume" "terra-cache-disk" {
  availability_zone = "ap-northeast-2a"
  size              = 150
  type              = "gp3"
}

#disk 적용#
resource "aws_volume_attachment" "terra-ebs-volume" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.terra-cache-disk.id
  instance_id = aws_instance.ec2-FileGateway.id
}

#storage-gateway생성#
resource "aws_storagegateway_gateway" "storage-gateway" {

  gateway_ip_address = aws_instance.ec2-FileGateway.public_ip
  gateway_name       = "storage-gateway"
  gateway_timezone   = "GMT+9:00"
  gateway_type       = "FILE_S3"
}

#data와 resource가 하나로 움직이는듯 cache적용#
data "aws_storagegateway_local_disk" "storage-gateway-data" {
  disk_node   = aws_volume_attachment.terra-ebs-volume.device_name
  gateway_arn = aws_storagegateway_gateway.storage-gateway.arn
}

resource "aws_storagegateway_cache" "storage-gateway-cache" {
  disk_id     = data.aws_storagegateway_local_disk.storage-gateway-data.id
  gateway_arn = aws_storagegateway_gateway.storage-gateway.arn
}

#nfs-file 파일공유#
resource "aws_storagegateway_nfs_file_share" "nfs-file" {
  client_list  = ["0.0.0.0/0"]
  gateway_arn  = aws_storagegateway_gateway.storage-gateway.arn
  location_arn = aws_s3_bucket.bucket.arn
  role_arn     = aws_iam_role.gateway.arn
}