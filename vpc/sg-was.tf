resource "aws_security_group" "terra-sg-pri-php"{
    name = "terra-sg-pri-php"
    description = "terra-sg-pri-php"
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
    security_groups = [aws_security_group.terra-sg-alb-inter.id]
}

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}
  tags = {
      Name = "terra-sg-pri-php"
    }
}