variable "network_vpc_pub_id" {
  description = "Network VPC public ID"
  type        = string
}

variable "network_vpc_pub_cidr_block" {
  description = "Network VPC public CIDR block"
  type        = string
}

variable "network_subnet_pub_id" {
  description = "Network subnet public ID"
  type        = string
}

variable "compute_ami_id" {
  description = "Compute AMI ID"
  type        = string
  default     = "ami-0e38fa17744b2f6a5"
}

variable "compute_instance_type" {
  description = "Compute instance type"
  type        = string
  default     = "t2.nano"
}

variable "compute_key_name" {
  description = "Compute key name"
  type        = string
  default     = "key"
}