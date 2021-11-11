resource "aws_route_table" "terra-rt-pri"{
    vpc_id = aws_vpc.terra-vpc.id

    tags = {
        Name = "terra-rt-pri"
    }
}
resource "aws_route" "terra-r-pri-ap"{
    route_table_id = aws_route_table.terra-rt-pri.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.terra-ngw.id
}
resource "aws_route_table_association" "terra-rtass-pri-a-apc"{
    subnet_id = aws_subnet.terra-sub-pri-a-apc.id
    route_table_id = aws_route_table.terra-rt-pri.id
}
resource "aws_route_table_association" "terra-rtass-pri-c-apc"{
    subnet_id = aws_subnet.terra-sub-pri-c-apc.id
    route_table_id = aws_route_table.terra-rt-pri.id
}
resource "aws_route_table_association" "terra-rtass-pri-a-php"{
    subnet_id = aws_subnet.terra-sub-pri-a-php.id
    route_table_id = aws_route_table.terra-rt-pri.id
}
resource "aws_route_table_association" "terra-rtass-pri-c-php"{
    subnet_id = aws_subnet.terra-sub-pri-c-php.id
    route_table_id = aws_route_table.terra-rt-pri.id
}
resource "aws_route_table_association" "terra-rtass-pri-a-db"{
    subnet_id = aws_subnet.terra-sub-pri-a-db.id
    route_table_id = aws_route_table.terra-rt-pri.id
}
resource "aws_route_table_association" "terra-rtass-pri-c-db"{
    subnet_id = aws_subnet.terra-sub-pri-c-db.id
    route_table_id = aws_route_table.terra-rt-pri.id
}