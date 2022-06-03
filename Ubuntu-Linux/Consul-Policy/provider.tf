terraform {
  required_providers {
    consul = {
      source  = "hashicorp/consul"
      version = "2.15.1"
    }
  }
  /* backend "s3" {
    endpoint                    = "https://minio.mirahi.cloud:9000/hashistack"
    key                         = "terraform.tfstate"
    region                      = "main"
    bucket                      = "consul-policy"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    force_path_style            = true
  } */
}

provider "consul" {
  address    = var.consul_address
  datacenter = var.consul_datacenter
  token      = var.consul_token
}
