resource "ibm_is_vpc" "vpc" {
  name                        = "${var.prefix}-vpc"
  resource_group              = var.resource_group_id
  address_prefix_management   = "manual"
  default_network_acl_name    = "${var.prefix}-default-nacl"
  default_security_group_name = "${var.prefix}-default-sg"
  default_routing_table_name  = "${var.prefix}-default-rt"
  tags                        = var.tags
}

resource "ibm_is_vpc_address_prefix" "prefix" {
  count = length(var.zones)

  name       = "${var.prefix}-prefix-${count.index + 1}"
  zone       = var.zones[count.index]
  vpc        = ibm_is_vpc.vpc.id
  cidr       = cidrsubnet(var.default_cidr, 4, count.index)
  is_default = true
}

resource "ibm_is_subnet" "subnet" {
  count           = length(var.subnets)
  depends_on      = [ibm_is_vpc_address_prefix.prefix]
  name            = "${var.prefix}-${count.index}-subnet"
  vpc             = ibm_is_vpc.vpc.id
  zone            = var.zones[0]
  resource_group  = var.resource_group_id
  ipv4_cidr_block = cidrsubnet(ibm_is_vpc_address_prefix.prefix[0].cidr, 2, count.index)
  tags            = var.tags
}