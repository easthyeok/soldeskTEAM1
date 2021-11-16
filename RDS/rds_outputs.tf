output "rds_endpoint" {
  value = "${aws_db_instance.default.endpoint}"
  }

output "rds_identifier" {
  value = "${aws_db_instance.default.identifier}"
  }

output "rds_username" {
  value = "${aws_db_instance.default.username}"
  }



