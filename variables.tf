variable "region" {
  description = "The region where the VPC and associated resources will be created."
  type        = string
  default     = "ca-tor"
}

variable "existing_resource_group" {
  description = "Existing resource group name. If not set, a new resource group will be created."
  type        = string
  default     = "CDE"
}

variable "project_prefix" {
  description = "The prefix to use for all resource names in this example"
  type        = string
  default     = null
}

variable "owner" {
  description = "The owner of the deployed resources. This will be set as a tag on each resource."
  type        = string
  default     = "ryantiffany"
}

variable "existing_ssh_key" {
  description = "Existing SSH key name. If not set, a new SSH key will be created."
  type        = string
  default     = "rst-ca-tor"
}

variable "east_cidr" {
  description = "The CIDR block for the East VPC address prefixes."
  type        = string
  default     = "172.16.0.0/18"
}

variable "west_cidr" {
  description = "The CIDR block for the West VPC address prefixes."
  type        = string
  default     = "192.168.0.0/18"
}

