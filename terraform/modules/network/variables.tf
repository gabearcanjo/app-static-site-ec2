variable "network_vpc_pub_cidr_block" {
  description = "Network VPC public CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "network_subnet_pub_cidr_block" {
  description = "Network subnet public CIDR block"
  type        = string
  default     = "10.0.1.0/24"
}

variable "network_subnet_pub_az" {
  description = "Network subnet public AZ"
  type        = string
  default     = "us-east-1a"
}

variable "network_vpc_priv_cidr_block" {
  description = "Network VPC private CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "network_subnet_priv_cidr_block" {
  description = "Network subnet private CIDR block"
  type        = string
  default     = "10.0.1.0/24"
}

variable "network_subnet_priv_az" {
  description = "Network subnet private AZ"
  type        = string
  default     = "us-east-1b"
}