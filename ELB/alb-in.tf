#ex-alb 생성
resource "aws_lb" "terra-alb-inter"{
    name = "terra-alb-inter" 
    internal = true
    load_balancer_type = "application" 
    security_groups = [aws_security_group.terra-sg-alb-inter.id] 
    subnets = [aws_subnet.terra-sub-pri-a-php.id, aws_subnet.terra-sub-pri-c-php.id]
    tags = { 
        Name = "terra-alb-inter" 
    } 
}
output "alb_in_dns" {
  value = "${aws_lb.terra-alb-inter.dns_name}"
  }

# 타겟 그룹 생성
resource "aws_lb_target_group" "terra-atg-inter"{
    name = "terra-atg-inter" 
    port = "80" 
    protocol = "HTTP" 
    vpc_id = aws_vpc.terra-vpc.id 
    target_type = "instance" 
    tags = { 
      Name = "terra-atg-inter" 
    } 
}

# 리스너 생성
resource "aws_lb_listener" "terra-alt-inter"{ 
    load_balancer_arn = aws_lb.terra-alb-inter.arn 
    port = "80"
    protocol = "HTTP" 
    default_action{ 
        type = "forward" 
        target_group_arn = aws_lb_target_group.terra-atg-inter.arn 
    } 
}

resource "aws_lb_target_group_attachment" "terra-att-in1"{ 
    target_group_arn = aws_lb_target_group.terra-atg-inter.arn 
    target_id = aws_instance.terra-ec2-pri-a-php.id 
    port = 80
}
resource "aws_lb_target_group_attachment" "terra-att-in2"{ 
    target_group_arn = aws_lb_target_group.terra-atg-inter.arn 
    target_id = aws_instance.terra-ec2-pri-c-php.id 
    port = 80
}

# alb sg
resource "aws_security_group" "terra-sg-alb-inter" {
    name = "terra-sg-alb-inter" 
    description = "terra-sg-alb-inter" 
    vpc_id = aws_vpc.terra-vpc.id 
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
        security_groups = [aws_security_group.terra-sg-alb-ex.id]
    } 
    ingress {
        from_port = 0
        to_port = 65535
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
        Name = "terra-sg-alb-inter" 
    } 
}
