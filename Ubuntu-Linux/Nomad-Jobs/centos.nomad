job "CentOs" {
  datacenters = ["mirahi"]
  type = "service"
    group "qemu" {    
      task "virtual" {
        driver = "qemu"
          config {
          image_path  = "local/CentOS-7.qcow2"
          accelerator = "kvm"
          }
  # Specifying an artifact is required with the "qemu"
  # driver. This is the # mechanism to ship the image to be run.
  artifact {
    source = "s3::https://minio.mirahi.cloud:9000/test/CentOS-7.qcow2"
    options {
      aws_access_key_id     = var.aws_access_key_id
      aws_access_key_secret = var.aws_access_key_secret
      region = "main"
        }
      }
    }
  }
}
