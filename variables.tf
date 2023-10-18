variable "project_name" {
  type        = string
  default     = "gizmo"
  description = "name of project"

}

variable "env" {
  type        = string
  default     = "dev"
  description = "name of env"

}

variable "vpc_subnet" {
  type        = string
  default     = "10.0.0.0/16"
  description = "vpc subnet for env"

}

variable "vpc_public_subnets" {
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  description = "public subnets for vpc"

}

variable "vpc_private_subnets" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  description = "private subnets for vpc"
}

variable "enable_vpn_gateway" {
  type        = bool
  default     = false
  description = "enable vpn gateway"

}

variable "database_subnets" {
  type        = list(string)
  default     = ["10.0.50.0/24", "10.0.51.0/24"]
  description = "vpc subnet for env"

}

variable "db_subnet_group_name" {
  type        = string
  default     = "widgetsdb"
  description = "name of database"

}

variable "tags" {
  type = object({
    dept      = string
    tfmanaged = bool
    project   = string
  })
  default = {
    dept      = "acme widgets department"
    tfmanaged = true
    project   = "gizmo"
  }
}

variable "db_username" {
  description = "RDS root username"
}

variable "db_password" {
  description = "RDS root user password"
  sensitive   = true
}

variable "db_instance_class" {
  type    = string
  default = "db.t3.micro"
}