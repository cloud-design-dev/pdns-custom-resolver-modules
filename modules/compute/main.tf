resource "ibm_is_instance" "compute" {
  name           = "${var.prefix}-instance"
  vpc            = var.vpc_id
  zone           = var.zone
  keys           = var.ssh_keys
  image          = data.ibm_is_image.base.id
  profile        = "cx2-2x4"
  resource_group = var.resource_group_id

  primary_network_interface {
    subnet          = var.subnet
    security_groups = [var.security_group]
  }

  tags = var.tags
}