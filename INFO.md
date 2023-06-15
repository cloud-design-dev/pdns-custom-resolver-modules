<!-- BEGIN_TF_DOCS -->
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_east_compute"></a> [east\_compute](#module\_east\_compute) | ./modules/compute | n/a |
| <a name="module_east_security"></a> [east\_security](#module\_east\_security) | ./modules/security | n/a |
| <a name="module_east_vpc"></a> [east\_vpc](#module\_east\_vpc) | ./modules/vpc | n/a |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | git::https://github.com/terraform-ibm-modules/terraform-ibm-resource-group.git | v1.0.5 |
| <a name="module_west_compute"></a> [west\_compute](#module\_west\_compute) | ./modules/compute | n/a |
| <a name="module_west_security"></a> [west\_security](#module\_west\_security) | ./modules/security | n/a |
| <a name="module_west_vpc"></a> [west\_vpc](#module\_west\_vpc) | ./modules/vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [ibm_is_ssh_key.generated_key](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.54.0/docs/resources/is_ssh_key) | resource |
| [null_resource.create_private_key](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [random_string.prefix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [tls_private_key.ssh](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [ibm_is_ssh_key.sshkey](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.54.0/docs/data-sources/is_ssh_key) | data source |
| [ibm_is_zones.regional](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.54.0/docs/data-sources/is_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_east_cidr"></a> [east\_cidr](#input\_east\_cidr) | The CIDR block for the East VPC address prefixes. | `string` | `"172.16.0.0/18"` | no |
| <a name="input_existing_resource_group"></a> [existing\_resource\_group](#input\_existing\_resource\_group) | Existing resource group name. If not set, a new resource group will be created. | `string` | `"CDE"` | no |
| <a name="input_existing_ssh_key"></a> [existing\_ssh\_key](#input\_existing\_ssh\_key) | Existing SSH key name. If not set, a new SSH key will be created. | `string` | `"rst-ca-tor"` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | The owner of the deployed resources. This will be set as a tag on each resource. | `string` | `"ryantiffany"` | no |
| <a name="input_project_prefix"></a> [project\_prefix](#input\_project\_prefix) | The prefix to use for all resource names in this example | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | The region where the VPC and associated resources will be created. | `string` | `"ca-tor"` | no |
| <a name="input_west_cidr"></a> [west\_cidr](#input\_west\_cidr) | The CIDR block for the West VPC address prefixes. | `string` | `"192.168.0.0/18"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_east_prefixes"></a> [east\_prefixes](#output\_east\_prefixes) | n/a |
| <a name="output_east_subnets"></a> [east\_subnets](#output\_east\_subnets) | n/a |
| <a name="output_west_prefixes"></a> [west\_prefixes](#output\_west\_prefixes) | n/a |
| <a name="output_west_subnets"></a> [west\_subnets](#output\_west\_subnets) | n/a |
<!-- END_TF_DOCS -->