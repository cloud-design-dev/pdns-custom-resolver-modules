output "gateway_id" {
  value = ibm_is_vpn_gateway.gateway.id
}

output "connection_id" {
  value = ibm_is_vpn_gateway_connection.connection
}

output "gateway_peer" {
  value = ibm_is_vpn_gateway.gateway.peer_address
}

output "gateway" {
  value = ibm_is_vpn_gateway.gateway
}