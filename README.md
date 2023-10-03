# Terraform-AWS-iCloud-Mail-R53

Terraform module to create the MX, SPF, DKIM and TXT records that are required to use a [custom domain for email with iCloud+](https://support.apple.com/en-us/HT212514) using AWS Route53.

To get started create a new workspace for your domain (replace `awslab-cloud` with your domain name): 

`terraform worksapce new awslab-cloud`

Then update the necessary variables in the `tfvars` file. In this case it would [awslab-cloud.tfvars](envs/awslab-cloud.tfvars). 

Then apply the configuration: 

`terraform apply -var-file=envs/awslab-cloud.tfvars`

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_hosted_zone"></a> [create\_hosted\_zone](#input\_create\_hosted\_zone) | Set to true to create a new hosted zone for the domain | `bool` | `false` | no |
| <a name="input_lookup_mail_zone_id"></a> [lookup\_mail\_zone\_id](#input\_lookup\_mail\_zone\_id) | Set to true to lookup the zone ID using the domain name, hosted zone must be in same aws account | `bool` | `false` | no |
| <a name="input_mail_domain_name"></a> [mail\_domain\_name](#input\_mail\_domain\_name) | Domain name that will be used for email for iCloud custom domain email | `string` | n/a | yes |
| <a name="input_mail_domain_zone_id"></a> [mail\_domain\_zone\_id](#input\_mail\_domain\_zone\_id) | Set this variable to the Hosted Zone ID of the domain you are using for mail | `string` | `null` | no |
| <a name="input_verifcation_domain_key"></a> [verifcation\_domain\_key](#input\_verifcation\_domain\_key) | Set this to the DKIM value that is provided from iCloud.com when creating custom domain | `string` | n/a | yes |
| <a name="input_verification_spf_record"></a> [verification\_spf\_record](#input\_verification\_spf\_record) | Set this to the SPF value that is provided from iCloud.com when creating custom domain | `string` | `"v=spf1 include:icloud.com ~all"` | no |
| <a name="input_verification_txt_record"></a> [verification\_txt\_record](#input\_verification\_txt\_record) | Set this to TXT value that is provided from iCloud.com when creating custom domain | `string` | n/a | yes |