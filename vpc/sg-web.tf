resource "aws_security_group" "terra-sg-pri-apc"{
    name = "terra-sg-pri-apc"
    description = "terra-sg-pri-apc"
    vpc_id = aws_vpc.terra-vpc.id
    
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    security_groups = [aws_security_group.terra-sg-pub-bastion.id]
}
  ingress { 
    from_port = 80
    to_port = 80
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
      Name = "terra-sg-pri-apc"
  }
}