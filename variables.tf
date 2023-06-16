variable "region" {
  description = "The region where the VPC and associated resources will be created."
  type        = string
  default     = "us-south"
}

variable "existing_resource_group" {
  description = "Existing resource group name. If not set, a new resource group will be created."
  type        = string
  default     = null
}

variable "project_prefix" {
  description = "The prefix to use for all resource names in this example"
  type        = string
  default     = null
}

variable "existing_ssh_key" {
  description = "Existing SSH key name. If not set, a new SSH key will be created."
  type        = string
  default     = null
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

