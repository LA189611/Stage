terraform {
  required_providers {
    nomad = {
      source  = "hashicorp/nomad"
      version = "1.4.16"
    }
  }
  /* backend "s3" {
    endpoint                    = "https://minio.mirahi.cloud:9000/hashistack"
    key                         = "terraform.tfstate"
    region                      = "main"
    bucket                      = "nomad-jobs"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    force_path_style            = true
  } */
}

provider "nomad" {
  # Configuration options
  address = var.nomad_address
}