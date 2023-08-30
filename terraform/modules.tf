module "network" {
  source = "./modules/network"

  network_vpc_pub_cidr_block     = "10.0.0.0/16"
  network_subnet_pub_cidr_block  = "10.0.1.0/24"
}

module "compute" {
  source = "./modules/compute"

  network_vpc_pub_id          = module.network.network_vpc_pub_id
  network_vpc_pub_cidr_block  = module.network.network_vpc_pub_cidr_block
  network_subnet_pub_id       = module.network.network_subnet_pub_id
  network_vpc_priv_id         = module.network.network_vpc_priv_id
  network_vpc_priv_cidr_block = module.network.network_vpc_priv_cidr_block
  network_subnet_priv_id      = module.network.network_subnet_priv_id
  compute_ami_id              = "ami-02e136e904f3da870"
  compute_instance_type       = "t2.micro"
  compute_key_name            = "vockey"
}