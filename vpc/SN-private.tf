resource "aws_subnet" "terra-sub-pri-a-apc"{
    vpc_id = aws_vpc.terra-vpc.id
    cidr_block = "10.0.10.0/24"
    availability_zone = "ap-northeast-2a"

    tags = {
        Name = "terra-sub-pri-a-apc"
    }
}

resource "aws_subnet" "terra-sub-pri-c-apc"{
    vpc_id = aws_vpc.terra-vpc.id
    cidr_block = "10.0.20.0/24"
    availability_zone = "ap-northeast-2c"

    tags = {
        Name = "terra-sub-pri-c-apc"
    }
}

resource "aws_subnet" "terra-sub-pri-a-php"{
    vpc_id = aws_vpc.terra-vpc.id
    cidr_block = "10.0.30.0/24"
    availability_zone = "ap-northeast-2a"

    tags = {
        Name = "terra-sub-pri-a-php"
    }
}

resource "aws_subnet" "terra-sub-pri-c-php"{
    vpc_id = aws_vpc.terra-vpc.id
    cidr_block = "10.0.40.0/24"
    availability_zone = "ap-northeast-2c"

    tags = {
        Name = "terra-sub-pri-c-php"
    }
}

resource "aws_subnet" "terra-sub-pri-a-db"{
    vpc_id = aws_vpc.terra-vpc.id
    cidr_block = "10.0.50.0/24"
    availability_zone = "ap-northeast-2a"

    tags = {
        Name = "terra-sub-pri-a-db"
    }
}

resource "aws_subnet" "terra-sub-pri-c-db"{
    vpc_id = aws_vpc.terra-vpc.id
    cidr_block = "10.0.60.0/24"
    availability_zone = "ap-northeast-2c"

    tags = {
        Name = "terra-sub-pri-c-db"
    }
}
