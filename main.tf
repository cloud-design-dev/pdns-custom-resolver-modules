


# If no existing_resource_group is declared, a new one will be created. 
module "resource_group" {
  source                       = "git::https://github.com/terraform-ibm-modules/terraform-ibm-resource-group.git?ref=v1.0.5"
  resource_group_name          = var.existing_resource_group == null ? "${local.project_prefix}-resource-group" : null
  existing_resource_group_name = var.existing_resource_group
}

# if no project_prefix is declared, a random string will be generated and used in its place
resource "random_string" "prefix" {

  count   = var.project_prefix != null ? 0 : 1
  length  = 4
  special = false
  upper   = false
}

resource "tls_private_key" "ssh" {
  count     = var.existing_ssh_key != "" ? 0 : 1
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "ibm_is_ssh_key" "generated_key" {
  count          = var.existing_ssh_key != "" ? 0 : 1
  name           = "${local.project_prefix}-${var.region}-key"
  public_key     = tls_private_key.ssh.0.public_key_openssh
  resource_group = module.resource_group.resource_group_id
  tags           = local.tags
}

resource "null_resource" "create_private_key" {
  count = var.existing_ssh_key != "" ? 0 : 1
  provisioner "local-exec" {
    command = <<-EOT
      echo '${tls_private_key.ssh.0.private_key_pem}' > ./'${local.project_prefix}'.pem
      chmod 400 ./'${local.project_prefix}'.pem
    EOT
  }
}

module "east_vpc" {
  source            = "./modules/vpc"
  prefix            = "${local.project_prefix}-east"
  default_cidr      = var.east_cidr
  resource_group_id = module.resource_group.resource_group_id
  zones             = values(local.vpc_zones)
  tags              = local.tags
}

module "west_vpc" {
  source            = "./modules/vpc"
  prefix            = "${local.project_prefix}-west"
  default_cidr      = var.west_cidr
  resource_group_id = module.resource_group.resource_group_id
  zones             = values(local.vpc_zones)
  tags              = local.tags
}

# module "east_security" {
#   source            = "./modules/security"
#   prefix            = "${local.project_prefix}-east"
#   vpc_id = module.east_vpc.vpc_id
#   resource_group_id = module.resource_group.resource_group_id
#   tags              = local.tags
# }

# module "east_vpn" {
#   source            = "./modules/vpn"
#   prefix            = "${local.project_prefix}-east"
#   vpc_id = module.east_vpc.vpc_id
#   resource_group_id = module.resource_group.resource_group_id
#   tags              = local.tags
# }

module "east_compute" {
  count             = 2
  source            = "./modules/compute"
  prefix            = "${local.project_prefix}-east-${count.index + 1}"
  vpc_id            = module.east_vpc.vpc_id
  resource_group_id = module.resource_group.resource_group_id
  zone              = local.vpc_zones[0]
  ssh_keys          = local.ssh_key_ids
  subnet            = module.east_vpc.subnet_id[0]
  tags              = local.tags
  security_group    = module.east_vpc.default_security_group
}