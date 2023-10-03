locals {
  mail_domain_zone_id = var.create_hosted_zone ? aws_route53_zone.mail[0].id : var.lookup_mail_zone_id ? data.aws_route53_zone.mail[0].id : var.mail_domain_zone_id
}

resource "aws_route53_zone" "mail" {
  count = var.create_hosted_zone ? 1 : 0
  name = var.mail_domain_name
}

data "aws_route53_zone" "mail" {
  count = var.create_hosted_zone == false && var.lookup_mail_zone_id == true ? 1 : 0
  name = var.mail_domain_name
}


resource "aws_route53_record" "mx_record" {
  zone_id = local.mail_domain_zone_id
  name    = "awslab.cloud"
  type    = "MX"
  ttl     = "300"
  records = ["10 mx01.mail.icloud.com.", "10 mx02.mail.icloud.com." ]
}

resource "aws_route53_record" "txt_record" {
  zone_id = local.mail_domain_zone_id
  name    = "awslab.cloud"
  type    = "TXT"
  ttl     = "300"
  records = [var.verification_txt_record]
}

resource "aws_route53_record" "spf_record" {
  zone_id = local.mail_domain_zone_id
  name    = "awslab.cloud"
  type    = "SPF"
  ttl     = "300"
  records = [var.verification_spf_record]
}

resource "aws_route53_record" "dkim_record" {
  zone_id = local.mail_domain_zone_id
  name    = "sig1._domainkey"
  type    = "CNAME"
  ttl     = "300"
  records = [var.verifcation_domain_key]
}