data "consul_agent_config" "remote_agent" {}

data "consul_datacenters" "mirahi" {}

data "consul_nodes" "nodes" {}

data "consul_acl_token_secret_id" "server" {
  accessor_id = consul_acl_token.nomad_server.accessor_id
}

data "consul_acl_token_secret_id" "worker" {
  accessor_id = consul_acl_token.nomad_worker.accessor_id
}

data "consul_acl_token_secret_id" "storage" {
  accessor_id = consul_acl_token.vault_storage.accessor_id
}

data "consul_acl_token_secret_id" "agent" {
  accessor_id = consul_acl_token.consul_agent.accessor_id
}
