variable "resource_group_id" {}
variable "tags" {}
variable "zones" {}
variable "prefix" {}
variable "subnets" {
  default = ["vsi", "vpn"]
}

variable "default_cidr" {}
