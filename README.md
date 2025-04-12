<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_bcrypt"></a> [bcrypt](#requirement\_bcrypt) | 0.1.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks"></a> [eks](#module\_eks) | terraform-aws-modules/eks/aws | 19.13.1 |
| <a name="module_karpenter"></a> [karpenter](#module\_karpenter) | terraform-aws-modules/eks/aws//modules/karpenter | 19.13.1 |
| <a name="module_kms"></a> [kms](#module\_kms) | terraform-aws-modules/kms/aws | 1.5.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.additional](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_eks_cluster_auth.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tags"></a> [additional\_tags](#input\_additional\_tags) | Additional tags to apply to all resources, used for deployment specific tags e.g. environment name. | `map(string)` | `{}` | no |
| <a name="input_admin_role_arn"></a> [admin\_role\_arn](#input\_admin\_role\_arn) | The ARN of the IAM role that will be given administrator access to the cluster. | `string` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | The kubernetes version to use for the cluster, e.g. 1.24. | `string` | n/a | yes |
| <a name="input_enduser"></a> [enduser](#input\_enduser) | Company name. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment the resource is being deployed into. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Top level name of the project being deployed. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region. | `string` | n/a | yes |
| <a name="input_region_shortcode"></a> [region\_shortcode](#input\_region\_shortcode) | AWS region shortcode. | `string` | n/a | yes |
| <a name="input_service"></a> [service](#input\_service) | The name of the component being deployed. A service may by made up of multiple components. | `string` | `""` | no |
| <a name="input_vpc_azs"></a> [vpc\_azs](#input\_vpc\_azs) | A list of availability zones names or ids in the region | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | The endpoint URL to access the cluster's API. |
<!-- END_TF_DOCS --># ray-eks
