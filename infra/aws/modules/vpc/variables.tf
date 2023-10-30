variable "vpc_cidr_block" {
   description = "CIDR block for VPC"
   type = string
   default = "10.0.0.0/16"
}

# variable "public_subnet_cidr_blocks" {
#   default     = ["10.0.0.0/24", "10.0.2.0/24", "10.0.3.0/24"]
#   type        = list(string)
#   description = "List of public subnet CIDR blocks"
# }

# variable "private_subnet_cidr_blocks" {
#   default     = ["10.0.1.0/24", "10.0.4.0/24", "10.0.5.0/24"]
#   type        = list(string)
#   description = "List of private subnet CIDR blocks"
# }

variable "azone_count" {
  description = "availability zones for the creation of subnets"
  type = number
  default = 3
}

