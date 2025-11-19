# --------------------------------------------------------------------------------------------------
# DVWA
# --------------------------------------------------------------------------------------------------
variable "listen_port" {
  description = "Port for DVWA web interface"
  default     = "8080"
}

variable "php_version" {
  description = "PHP version to run DVWA"
  default     = "8.1"
}

variable "key_name" {
  description = "Name of the existing AWS Key Pair to use (e.g., personal-chima)"
  type        = string
}

# --------------------------------------------------------------------------------------------------
# INFRASTRUCTURE
# --------------------------------------------------------------------------------------------------
variable "vpc_cidr" {
  description = "VPC CIDR"
  default     = "10.0.0.0/16"
}

variable "vpc_subnet_cidr" {
  description = "Subnet CIDR"
  default     = "10.0.1.0/24"
}

variable "instance_type" {
  description = "AWS EC2 instance type to use for DVWA server"
  default     = "t3.nano"
}

variable "tags" {
  description = "Tags to add to all resources"
  default = {
    Name = "dvwa"
  }
}
