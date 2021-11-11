resource "aws_eip" "terra-nip"{
    vpc = true
    tags = {
        Name = "terra-nip"
    }
}
resource "aws_nat_gateway" "terra-ngw"{
    allocation_id = aws_eip.terra-nip.id
    subnet_id = aws_subnet.terra-sub-pub-a.id
    tags = {
        Name = "terra-ngw"
    }
}