#bastion host
resource "aws_instance" "terra-ec2-pub-a-bastion"{
  ami = "ami-04e8dfc09b22389ad"
  instance_type = "t2.micro"
  availability_zone = "ap-northeast-2a"
  associate_public_ip_address = true

  subnet_id = aws_subnet.terra-sub-pub-a.id
  key_name = "soldesk"
  vpc_security_group_ids = [
      aws_security_group.terra-sg-pub-bastion.id
  ]
  tags = {
      Name = "terra-ec2-pub-a-bastion"
  }
}

#Apache
resource "aws_instance" "terra-ec2-pri-a-apc"{
  ami = "ami-04e8dfc09b22389ad" 
  instance_type = "t2.micro" 
  availability_zone = "ap-northeast-2a" 

  subnet_id = aws_subnet.terra-sub-pri-a-apc.id 
  key_name = "soldesk" 
  vpc_security_group_ids = [ 
    aws_security_group.terra-sg-pri-apc.id 
  ] 
  tags = {
    Name = "terra-ec2-pri-a-apc" 
  } 
  user_data = "${file("user-data.web")}"
}

resource "aws_instance" "terra-ec2-pri-c-apc"{
  ami = "ami-04e8dfc09b22389ad" 
  instance_type = "t2.micro" 
  availability_zone = "ap-northeast-2c" 

  subnet_id = aws_subnet.terra-sub-pri-c-apc.id 
  key_name = "soldesk" 
  vpc_security_group_ids = [ 
    aws_security_group.terra-sg-pri-apc.id 
  ] 
  tags = {
    Name = "terra-ec2-pri-c-apc" 
  } 
  user_data = "${file("user-data.web")}"
}

# php
resource "aws_instance" "terra-ec2-pri-a-php"{
  ami = "ami-04e8dfc09b22389ad" 
  instance_type = "t2.micro" 
  availability_zone = "ap-northeast-2a" 

  subnet_id = aws_subnet.terra-sub-pri-a-php.id 
  key_name = "soldesk" 
  vpc_security_group_ids = [ 
    aws_security_group.terra-sg-pri-php.id 
  ] 
  tags = {
    Name = "terra-ec2-pri-a-php" 
  }
    user_data = "${file("user-data.was")}" 
}

resource "aws_instance" "terra-ec2-pri-c-php"{
  ami = "ami-04e8dfc09b22389ad" 
  instance_type = "t2.micro" 
  availability_zone = "ap-northeast-2c" 

  subnet_id = aws_subnet.terra-sub-pri-c-php.id 
  key_name = "soldesk" 
  vpc_security_group_ids = [ 
    aws_security_group.terra-sg-pri-php.id 
  ] 
  tags = {
    Name = "terra-ec2-pri-c-php" 
  }
  user_data = "${file("user-data.was")}"
}