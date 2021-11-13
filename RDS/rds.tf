resource "aws_db_instance" "default" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0.23"
  instance_class       = "db.t2.micro"
  identifier           = "database-1"
  username             = "soldesk"
  password             = "soldesk1"
  parameter_group_name = "default.mysql8.0"
  db_subnet_group_name = "${aws_db_subnet_group.default.id}"
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.terra-sg-pri-db.id]
}

resource "aws_db_subnet_group" "default" {
  name = "main"
  subnet_ids = [aws_subnet.terra-sub-pri-a-db.id, aws_subnet.terra-sub-pri-c-db.id]

  tags = {
    Name = "My DB subnet group"
  }
}