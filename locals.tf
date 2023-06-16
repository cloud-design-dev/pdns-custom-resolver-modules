locals {
  # If no project_prefix is declared, a random string will be generated.
  project_prefix = var.project_prefix != null ? var.project_prefix : random_string.prefix[0].result

  # If existing_ssh_key is not declared, a new key will be generated. 
  ssh_key_ids = var.existing_ssh_key != "" ? [data.ibm_is_ssh_key.sshkey[0].id] : [ibm_is_ssh_key.generated_key[0].id]

  tags = [
    "provider:ibm",
    "region:${var.region}",
    "project:${local.project_prefix}",
    "tfworkspace:${terraform.workspace}"
  ]

  zones = length(data.ibm_is_zones.regional.zones)
  vpc_zones = {
    for zone in range(local.zones) : zone => "${var.region}-${zone + 1}"
  }
}
