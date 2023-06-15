locals {
  # If no project_prefix is declared, a random string will be generated.
  project_prefix = var.project_prefix != null ? var.project_prefix : random_string.prefix[0].result

  # If existing_ssh_key is not declared, a new key will be generated. 
  ssh_key_ids = var.existing_ssh_key != "" ? [data.ibm_is_ssh_key.sshkey[0].id] : [ibm_is_ssh_key.generated_key[0].id]

  tags = [
    "owner:${var.owner}",
    "provider:ibm",
    "region:${var.region}",
    "project:${local.project_prefix}",
    "tfworkspace:${terraform.workspace}"
  ]

  # Will be used for project security group
  #   frontend_rules = [
  #     for r in var.frontend_rules : {
  #       name       = r.name
  #       direction  = r.direction
  #       remote     = lookup(r, "remote", null)
  #       ip_version = lookup(r, "ip_version", null)
  #       icmp       = lookup(r, "icmp", null)
  #       tcp        = lookup(r, "tcp", null)
  #       udp        = lookup(r, "udp", null)
  #     }
  #   ]


  zones = length(data.ibm_is_zones.regional.zones)
  vpc_zones = {
    for zone in range(local.zones) : zone => "${var.region}-${zone + 1}"
  }
  #   zones = length(data.ibm_is_zones.regional.zones)
  #   vpc_zones = {
  #     for zone in range(local.zones) : zone => {
  #       zone = "${var.region}-${zone + 1}"
  #     }
  #   }
}