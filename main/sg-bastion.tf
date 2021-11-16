resource "aws_security_group" "terra-sg-pub-bastion"{
    name = "terra-sg-pub-bastion"
    description = "terra-sg-pub-bastion"
    
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 445
    to_port = 445
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 2049
    to_port = 2049
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #NFS#
    ingress {
    protocol    = "tcp"
    from_port   = 20048
    to_port     = 20048
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
    protocol    = "udp"
    from_port   = 20048
    to_port     = 20048
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
    protocol    = "tcp"
    from_port   = 111
    to_port     = 111
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
    protocol    = "udp"
    from_port   = 111
    to_port     = 111
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