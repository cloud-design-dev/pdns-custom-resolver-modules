resource "ibm_is_vpn_gateway" "gateway" {
  name   = var.prefix
  subnet = var.subnet
  mode   = var.gateway_mode
}

resource "ibm_is_vpn_gateway_connection" "connection" {
  name           = "${var.prefix}-connection"
  vpn_gateway    = ibm_is_vpn_gateway.gateway.id
  peer_address   = var.peer_ip_address
  preshared_key  = var.gateway_preshared_key
  local_cidrs    = [var.local_cidr]
  peer_cidrs     = [var.remote_cidr]
  admin_state_up = true
}
