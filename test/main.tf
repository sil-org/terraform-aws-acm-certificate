
module "test" {
  source = "../"

  certificate_domain_name = "api.example.com"
  cloudflare_zone_name    = "example.com"
  create_dns_validation   = true
}

provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}
