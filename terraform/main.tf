# Terraform initialisations + Providers
terraform {
  required_providers {
    launchdarkly = {
      source  = "launchdarkly/launchdarkly"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "launchdarkly" {
  access_token = var.ld_access_token
}

provider "aws" {
    region = "${var.region}"
}

# Separate static websites with CNAME records

module "station_1" {
  source = "./static_website"
  bucket = "${var.project}-1.${var.domain_name}"
  domain_zoneid = var.domain_zoneid
}

module "station_2" {
  source = "./static_website"
  bucket = "${var.project}-2.${var.domain_name}"
  domain_zoneid = var.domain_zoneid
}