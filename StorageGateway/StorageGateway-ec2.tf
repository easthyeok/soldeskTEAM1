resource "aws_instance" "ec2-FileGateway" {
    ami = "ami-0889d8d66cff226d9"
    instance_type = "m4.xlarge"
    availability_zone = "ap-northeast-2a"
    
    subnet_id = aws_subnet.terra-sub-pub-a.id
    key_name = "soldesk" 
    vpc_security_group_ids = [ 
    aws_security_group.terra-sg-pub-bastion.id 
  ] 
  tags = {
    Name = "FileGateway" 
  }
}

resource "aws_eip" "elasticip" {
    instance = aws_instance.ec2-FileGateway.id
}

output "EIP" {
    value = aws_eip.elasticip.public_ip
}