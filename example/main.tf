
locals {
  full_domain_name = "${var.certificate_subdomain}.${var.cloudflare_zone_name}"
}

module "certificate" {
  source  = "sil-org/acm-certificate/aws"
  version = "0.1.0"

  certificate_domain_name = local.full_domain_name
  cloudflare_zone_name    = var.cloudflare_zone_name
  create_dns_validation   = var.create_dns_validation
}

module "domain" {
  source  = "sil-org/api-gateway-custom-domain/aws"
  version = "0.1.0"

  api_name        = var.api_name
  api_stage       = var.api_stage
  certificate_arn = module.certificate.certificate_arn
  domain_name     = local.full_domain_name
}
