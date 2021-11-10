resource "aws_security_group" "terra-sg-pub-bastion"{
    name = "terra-sg-pub-bastion"
    description = "terra-sg-pub-bastion"
    vpc_id = aws_vpc.terra-vpc.id
    
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
      Name = "terra-sg-pub-bastion"
  }
}