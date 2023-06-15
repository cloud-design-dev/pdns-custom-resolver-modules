output "east_prefixes" {
  value = module.east_vpc.address_prefixes
}

output "west_prefixes" {
  value = module.west_vpc.address_prefixes
}

output "east_subnets" {
  value = module.east_vpc.subnets
}

output "west_subnets" {
  value = module.west_vpc.subnets
}