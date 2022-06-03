terraform {
  required_providers {
    tls = {
      source  = "hashicorp/tls"
      version = "3.3.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.2.2"
    }
  }
  backend "s3" {
    endpoint                    = "https://minio.mirahi.cloud:9000/hashistack"
    key                         = "terraform.tfstate"
    region                      = "main"
    bucket                      = "nomad-ca"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    force_path_style            = true
  }
}

provider "local" {
}

provider "tls" {
}