terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "2.24.1"
    }
  }
  /* backend "s3" {
    endpoint                    = "https://minio.mirahi.cloud:9000/hashistack"
    key                         = "terraform.tfstate"
    region                      = "main"
    bucket                      = "vault"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    force_path_style            = true
  } */
}

provider "vault" {
  address = "http://172.20.8.239:8200"
}
