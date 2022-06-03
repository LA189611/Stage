terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.1.1"
    }
  }
  /* backend "s3" {
    endpoint                    = "https://minio.mirahi.cloud:9000/hashistack"
    key                         = "terraform.tfstate"
    region                      = "main"
    bucket                      = "nomad-cluster"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    force_path_style            = true
  } */
}

provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}
