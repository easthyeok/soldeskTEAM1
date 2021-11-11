resource "aws_route_table" "terra-rt-pub" {
    vpc_id = aws_vpc.terra-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.terra-igw.id
    }
    tags = {
        Name = "terra-rt-pub"
    }
}

resource "aws_route_table_association" "terra-rtass-pub-a"{
    subnet_id = aws_subnet.terra-sub-pub-a.id
    route_table_id = aws_route_table.terra-rt-pub.id
}

resource "aws_route_table_association" "terra-rtass-pub-c"{
    subnet_id = aws_subnet.terra-sub-pub-c.id
    route_table_id = aws_route_table.terra-rt-pub.id
}

