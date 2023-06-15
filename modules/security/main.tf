locals {
  frontend_rules = [
    for r in var.frontend_rules : {
      name       = r.name
      direction  = r.direction
      remote     = lookup(r, "remote", null)
      ip_version = lookup(r, "ip_version", null)
      icmp       = lookup(r, "icmp", null)
      tcp        = lookup(r, "tcp", null)
      udp        = lookup(r, "udp", null)
    }
  ]
}

module "security_group" {
  source                = "terraform-ibm-modules/vpc/ibm//modules/security-group"
  version               = "1.1.1"
  create_security_group = true
  name                  = "${var.prefix}-workload-sg"
  vpc_id                = var.vpc_id
  resource_group_id     = var.resource_group_id
  security_group_rules  = local.frontend_rules
}


# # Adding Security Group 
# resource "ibm_is_security_group" "workload" {
#   name           = "${var.prefix}-workload-sg"
#   vpc            = var.vpc_id
#   resource_group = var.resource_group_id
#   tags           = var.tags
# }

# # SG Rules
# # Allow all incoming network traffic on port 22
# resource "ibm_is_security_group_rule" "ingress_ssh_workload" {
#   group     = ibm_is_security_group.workload.id
#   direction = "inbound"
#   remote    = "0.0.0.0/0"

#   tcp {
#     port_min = 22
#     port_max = 22
#   }
# }

# # Allow all incoming network traffic icmp inbound
# resource "ibm_is_security_group_rule" "ingress_icmp_workload" {
#   group     = ibm_is_security_group.workload.id
#   direction = "inbound"
#   remote    = "0.0.0.0/0"
#   icmp {
#     code = 0
#     type = 8
#   }
# }

# # Allow all outbound network traffic --> Solved DNS resolution problem.. refine to just dns resolution
# resource "ibm_is_security_group_rule" "dns_outbound_workload" {
#   group     = ibm_is_security_group.workload.id
#   direction = "outbound"
#   remote    = "0.0.0.0/0"
#   udp {
#     port_min = 53
#     port_max = 53
#   }
# }