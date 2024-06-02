variable vpc_cidr {
  type        = string
  default     = "10.0.0.0/16"
  description = "description"
}

variable vpc_name {
  type        = string
  default     = "Terraform_Practise"
  description = "description"
}

variable owner_name {
  type        = string
  default     = "Vineeth Yadav"
  description = "description"
}

variable env {
  type        = string
  default     = "Development"
  description = "description"
}

variable public_subnets_cidr {
  type        = list
  default     = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
  description = "description"
}

variable availability_zone {
  type        = list
  default     = ["ap-south-1a","ap-south-1b","ap-south-1c"]
  description = "description"
}

variable private_subnets_cidr {
  type        = list(string)
  default     = ["10.0.4.0/24","10.0.5.0/24","10.0.6.0/24"]
  description = "description"
}
variable instance_type {}
variable imagename {}
variable key_name {}





