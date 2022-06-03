resource "consul_acl_policy" "consul_agent" {
  name        = "consul_agent"
  datacenters = [var.consul_datacenter]
  rules       = <<-RULE
    node_prefix "" {
      policy = "write"
    }
    RULE
}

resource "consul_acl_token" "consul_agent" {
  description = "Consul Agent Token"
  policies    = [consul_acl_policy.consul_agent.name]
  local       = true
}

resource "local_sensitive_file" "consul_agent_token" {
  content  = data.consul_acl_token_secret_id.agent.secret_id
  filename = "/home/adrien/.secrets/consul_agent.yml"
}

resource "consul_acl_policy" "nomad_server" {
  name        = "nomad_server"
  datacenters = [var.consul_datacenter]
  rules       = <<-RULE
    agent_prefix "" {
      policy = "read"
    }

    node_prefix "" {
      policy = "read"
    }

    service_prefix "" {
      policy = "write"
    }

    acl = "write"
    RULE
}

resource "consul_acl_token" "nomad_server" {
  description = "Nomad Servers Token"
  policies    = [consul_acl_policy.nomad_server.name]
  local       = true
}

resource "local_sensitive_file" "nomad_server_token" {
  content  = data.consul_acl_token_secret_id.server.secret_id
  filename = "/home/adrien/.secrets/server_token.yml"
}

resource "consul_acl_policy" "nomad_worker" {
  name        = "nomad_worker"
  datacenters = [var.consul_datacenter]
  rules       = <<-RULE
    agent_prefix "" {
      policy = "read"
    }

    node_prefix "" {
      policy = "read"
    }

    service_prefix "" {
      policy = "write"
    }

    key_prefix "" {
      policy = "read"
    }
    RULE
}

resource "consul_acl_token" "nomad_worker" {
  description = "Nomad Worker Token"
  policies    = [consul_acl_policy.nomad_worker.name]
  local       = true
}

resource "local_sensitive_file" "nomad_worker_token" {
  content  = data.consul_acl_token_secret_id.worker.secret_id
  filename = "/home/adrien/.secrets/worker_token.yml"
}

resource "consul_acl_policy" "vault_storage" {
  name        = "vault_storage"
  datacenters = [var.consul_datacenter]
  rules       = <<-RULE
    service "vault" { 
      policy = "write" 
    }
    
    key_prefix "vault/" { 
      policy = "write" 
    }
    
    agent_prefix "" { 
      policy = "read" 
    }
    
    session_prefix "" { 
      policy = "write" 
    }
    RULE
}

resource "consul_acl_token" "vault_storage" {
  description = "Vault Storage Token"
  policies    = [consul_acl_policy.vault_storage.name]
  local       = true
}

resource "local_sensitive_file" "vault_storage_token" {
  content  = data.consul_acl_token_secret_id.storage.secret_id
  filename = "/home/adrien/.secrets/vault_storage.yml"
}