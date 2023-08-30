output "network_vpc_pub_id" {
  value = aws_vpc.vpc_pub.id
}

output "network_vpc_pub_cidr_block" {
  value = aws_vpc.vpc_pub.cidr_block
}

output "network_subnet_pub_id" {
  value = aws_subnet.subnet_pub.id
}
