output "address_prefixes" {
  value = ibm_is_vpc_address_prefix.prefix.*.cidr
}

output "subnets" {
  value = ibm_is_subnet.subnet.*.ipv4_cidr_block
}

output "vpc_id" {
  value = ibm_is_vpc.vpc.id
}

output "subnet_id" {
  value = ibm_is_subnet.subnet.*.id
}

output "default_security_group" {
  value = ibm_is_vpc.vpc.default_security_group
}