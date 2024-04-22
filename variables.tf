variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "mi_ip"{
  description = "valor de mi ip para bastion host"
  type        = list(string)
}

variable "db_name" {
  type = string
  default = "my_database"
}

variable "master_user" {
  type = string
  default = "admin"
}

variable "master_pass" {
  type = string
  default = "password123"
}