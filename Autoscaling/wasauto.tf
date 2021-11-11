resource "aws_ami_from_instance" "wasauto"{
    name = "was-auto"
    source_instance_id = aws_instance.terra-ec2-pri-a-php.id
}    

resource "aws_launch_configuration" "wasconfig"{
    name_prefix = "was-ins-"
    image_id = aws_ami_from_instance.wasauto.id
    instance_type = "t2.micro"
    security_groups = [aws_security_group.terra-sg-pri-php.id]
    key_name = "soldesk"

    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_autoscaling_group" "wasasg"{
    name = "wasasg"
    desired_capacity = 1
    min_size = 1
    max_size = 2
    health_check_grace_period = 300
    health_check_type = "ELB"
    force_delete = true
    launch_configuration = aws_launch_configuration.wasconfig.name
    vpc_zone_identifier = [aws_subnet.terra-sub-pri-a-php.id, aws_subnet.terra-sub-pri-c-php.id]
}

resource "aws_autoscaling_attachment" "wasauto-att" {
    autoscaling_group_name = aws_autoscaling_group.wasasg.id
    alb_target_group_arn = aws_lb_target_group.terra-atg-ex.arn
}