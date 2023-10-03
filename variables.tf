variable "mail_domain_name" {
  description = "Domain name that will be used for email for iCloud custom domain email"
  type        = string
}

variable "create_hosted_zone" {
  description = "Set to true to create a new hosted zone for the domain"
  default     = false
  type        = bool
}

variable "mail_domain_zone_id" {
  description = "Set this variable to the Hosted Zone ID of the domain you are using for mail"
  default     = null
  type        = string
}

variable "verification_txt_record" {
  description = "Set this to TXT value that is provided from iCloud.com when creating custom domain"
  type        = string
}

variable "verification_spf_record" {
  description = "Set this to the SPF value that is provided from iCloud.com when creating custom domain"
  type        = string
  default     = "v=spf1 include:icloud.com ~all"
}

variable "verifcation_domain_key" {
  description = "Set this to the DKIM value that is provided from iCloud.com when creating custom domain"
  type        = string
}

variable "lookup_mail_zone_id" {
  description = "Set to true to lookup the zone ID using the domain name, hosted zone must be in same aws account"
  type        = bool
  default     = false
}