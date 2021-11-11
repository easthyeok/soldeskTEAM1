#ex-alb 생성
resource "aws_lb" "terra-alb-ex"{
    name = "terra-alb-ex" 
    internal = false
    load_balancer_type = "application" 
    security_groups = [aws_security_group.terra-sg-alb-ex.id] 
    subnets = [aws_subnet.terra-sub-pub-a.id, aws_subnet.terra-sub-pub-c.id]
    tags = { 
        Name = "terra-alb-ex" 
    }
}

output "aln_ex_dns" {
  value = "${aws_lb.terra-alb-ex.dns_name}"
  }
# 타겟 그룹 생성
resource "aws_lb_target_group" "terra-atg-ex"{
    name = "terra-atg-ex" 
    port = "80" 
    protocol = "HTTP" 
    vpc_id = aws_vpc.terra-vpc.id 
    target_type = "instance" 
    tags = { 
      Name = "terra-atg-ex" 
    } 
}

# 리스너 생성
resource "aws_lb_listener" "terra-alt-ex"{ 
    load_balancer_arn = aws_lb.terra-alb-ex.arn 
    port = "80" 
    protocol = "HTTP" 

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_target_group_attachment" "terra-att-ex1"{ 
    target_group_arn = aws_lb_target_group.terra-atg-ex.arn 
    target_id = aws_instance.terra-ec2-pri-a-apc.id 
    port = 80 
}
resource "aws_lb_target_group_attachment" "terra-att-ex2"{ 
    target_group_arn = aws_lb_target_group.terra-atg-ex.arn 
    target_id = aws_instance.terra-ec2-pri-c-apc.id 
    port = 80 
}

resource "aws_lb_listener" "terra-alt-ex2"{ 
    load_balancer_arn = aws_lb.terra-alb-ex.arn 
    port = "443" 
    protocol = "HTTPS" 
    ssl_policy        = "ELBSecurityPolicy-2016-08"
    certificate_arn   = "arn:aws:acm:ap-northeast-2:231620648634:certificate/d5a4f7a6-627b-4457-9ec5-0cc7a114de33"
    default_action{ 
        type = "forward" 
        target_group_arn = aws_lb_target_group.terra-atg-ex.arn 
    } 
}

# alb sg
resource "aws_security_group" "terra-sg-alb-ex"{
    name = "terra-sg-alb-ex" 
    description = "terra-sg-alb-ex" 
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
        cidr_blocks = ["0.0.0.0/0"]
    } 
    ingress { 
        from_port = 443
        to_port = 443
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
        Name = "terra-sg-alb-ex" 
    }

}
