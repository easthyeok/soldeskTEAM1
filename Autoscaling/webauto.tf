resource "aws_ami_from_instance" "webauto"{
    name = "webauto"
    source_instance_id = aws_instance.terra-ec2-pri-a-apc.id
}    

resource "aws_launch_configuration" "webconfig"{
    name_prefix = "web-ins-"
    image_id = aws_ami_from_instance.webauto.id
    instance_type = "t2.micro"
    security_groups = [aws_security_group.terra-sg-pri-apc.id]
    key_name = "soldesk"

    lifecycle { 
        create_before_destroy = true 
    }
}

resource "aws_autoscaling_group" "webasg"{
    name = "webasg"
    desired_capacity = 1
    min_size = 1
    max_size = 2
    health_check_grace_period = 300
    health_check_type = "ELB"
    force_delete = true
    launch_configuration = aws_launch_configuration.webconfig.name
    vpc_zone_identifier = [aws_subnet.terra-sub-pri-a-apc.id, aws_subnet.terra-sub-pri-c-apc.id]
}

resource "aws_autoscaling_attachment" "webauto-att" {
    autoscaling_group_name = aws_autoscaling_group.webasg.id
    alb_target_group_arn = aws_lb_target_group.terra-atg-inter.arn
}