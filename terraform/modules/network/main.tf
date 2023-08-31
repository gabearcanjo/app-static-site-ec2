resource "aws_vpc" "vpc_pub" {
  cidr_block           = var.network_vpc_pub_cidr_block
  enable_dns_hostnames = "true"
}

resource "aws_subnet" "subnet_pub" {
  vpc_id                  = aws_vpc.vpc_pub.id
  cidr_block              = var.network_subnet_pub_cidr_block
  availability_zone       = var.network_subnet_pub_az
  map_public_ip_on_launch = true
}


resource "aws_internet_gateway" "vpc_pub_igw" {
  vpc_id = aws_vpc.vpc_pub.id
}

resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block                = var.network_vpc_priv_cidr_block
  }
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "subnet_pub_to_rt_pub" {
  subnet_id      = aws_subnet.subnet_pub.id
  route_table_id = aws_route_table.rt_pub.id
}
