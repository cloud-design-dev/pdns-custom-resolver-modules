variable "prefix" {}
variable "zone" {}
variable "ssh_keys" {}
variable "security_group" {}
variable "subnet" {}
variable "vpc_id" {}
variable "resource_group_id" {}
variable "image_name" {
  description = "The name of an existing OS image to use. You can list available images with the command 'ibmcloud is images'."
  type        = string
  default     = "ibm-ubuntu-22-04-1-minimal-amd64-3"
}

variable "tags" {}