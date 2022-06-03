# Root CA
resource "tls_private_key" "ca_key" {
  algorithm = "RSA"
}

resource "tls_self_signed_cert" "ca_cert" {
  private_key_pem   = tls_private_key.ca_key.private_key_pem
  is_ca_certificate = true
  subject {
    common_name  = "Consul Agent CA"
    organization = "Mirahi"
  }
  validity_period_hours = 8760
  allowed_uses = [
    "cert_signing",
    "key_encipherment",
    "digital_signature"
  ]
}

resource "local_file" "consul_ca_key" {
  content  = tls_private_key.ca_key.private_key_pem
  filename = "${var.ansible_dir}/mirahi-agent-ca-key.pem"
}
resource "local_file" "consul_ca" {
  content  = tls_self_signed_cert.ca_cert.cert_pem
  filename = "${var.ansible_dir}/mirahi-agent-ca.pem"
}
resource "local_file" "consul_ca_agent" {
  content  = tls_self_signed_cert.ca_cert.cert_pem
  filename = "${var.ansible_agent_dir}/mirahi-agent-ca.pem"
}

# Server Certificates
resource "tls_private_key" "server_key_0" {
  algorithm = "RSA"
}

## Public Server Cert
resource "tls_cert_request" "server_cert_0" {
  private_key_pem = tls_private_key.server_key_0.private_key_pem
  subject {
    common_name  = "Server CSR"
    organization = "Mirahi"
  }
  dns_names = [
    "consul",
    "localhost"
  ]
  ip_addresses = ["127.0.0.1"]
}

## Signed Public Server Certificate
resource "tls_locally_signed_cert" "server_signed_cert_0" {
  cert_request_pem   = tls_cert_request.server_cert_0.cert_request_pem
  ca_private_key_pem = tls_private_key.ca_key.private_key_pem
  ca_cert_pem        = tls_self_signed_cert.ca_cert.cert_pem
  allowed_uses = [
    "digital_signature",
    "key_encipherment"
  ]
  validity_period_hours = 8760
}

resource "local_file" "server_cert_0" {
  content  = tls_locally_signed_cert.server_signed_cert_0.cert_pem
  filename = "${var.ansible_dir}/mirahi-server-mirahi-0.pem"
}

resource "local_file" "server_key_0" {
  content  = tls_private_key.server_key_0.private_key_pem
  filename = "${var.ansible_dir}/mirahi-server-mirahi-0-key.pem"
}

# Server Certificates
resource "tls_private_key" "server_key_1" {
  algorithm = "RSA"
}

## Public Server Cert
resource "tls_cert_request" "server_cert_1" {
  private_key_pem = tls_private_key.server_key_1.private_key_pem
  subject {
    common_name  = "Server CSR"
    organization = "Mirahi"
  }
  dns_names = [
    "consul",
    "localhost"
  ]
  ip_addresses = ["127.0.0.1"]
}

## Signed Public Server Certificate
resource "tls_locally_signed_cert" "server_signed_cert_1" {
  cert_request_pem   = tls_cert_request.server_cert_1.cert_request_pem
  ca_private_key_pem = tls_private_key.ca_key.private_key_pem
  ca_cert_pem        = tls_self_signed_cert.ca_cert.cert_pem
  allowed_uses = [
    "digital_signature",
    "key_encipherment"
  ]
  validity_period_hours = 8760
}

resource "local_file" "server_cert_1" {
  content  = tls_locally_signed_cert.server_signed_cert_1.cert_pem
  filename = "${var.ansible_dir}/mirahi-server-mirahi-1.pem"
}

resource "local_file" "server_key_1" {
  content  = tls_private_key.server_key_1.private_key_pem
  filename = "${var.ansible_dir}/mirahi-server-mirahi-1-key.pem"
}
# Server Certificates
resource "tls_private_key" "server_key_2" {
  algorithm = "RSA"
}

## Public Server Cert
resource "tls_cert_request" "server_cert_2" {
  private_key_pem = tls_private_key.server_key_2.private_key_pem
  subject {
    common_name  = "Server CSR"
    organization = "Mirahi"
  }
  dns_names = [
    "consul",
    "localhost"
  ]
  ip_addresses = ["127.0.0.1"]
}

## Signed Public Server Certificate
resource "tls_locally_signed_cert" "server_signed_cert_2" {
  cert_request_pem   = tls_cert_request.server_cert_2.cert_request_pem
  ca_private_key_pem = tls_private_key.ca_key.private_key_pem
  ca_cert_pem        = tls_self_signed_cert.ca_cert.cert_pem
  allowed_uses = [
    "digital_signature",
    "key_encipherment"
  ]
  validity_period_hours = 8760
}

resource "local_file" "server_cert_2" {
  content  = tls_locally_signed_cert.server_signed_cert_2.cert_pem
  filename = "${var.ansible_dir}/mirahi-server-mirahi-2.pem"
}

resource "local_file" "server_key_2" {
  content  = tls_private_key.server_key_2.private_key_pem
  filename = "${var.ansible_dir}/mirahi-server-mirahi-2-key.pem"
}