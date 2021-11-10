resource "aws_subnet" "terra-sub-pub-a"{
    vpc_id = aws_vpc.terra-vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-northeast-2a"

    map_public_ip_on_launch = true

    tags = {
        Name = "terra-sub-pub-a"
    }
}
resource "aws_subnet" "terra-sub-pub-c"{
    vpc_id = aws_vpc.terra-vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-northeast-2c"
    map_public_ip_on_launch = true

    tags = {
        Name = "terra-sub-pub-c"
    }
}