# Store Infrastructure state data in postgres
terraform {
  backend "pg" {
    conn_str = "postgres://terraform:terraform123@terraform_backend/terraform"
  }
}
terraform {
  required_providers {
    keycloak = {
      source = "edflex-tech/keycloak"
      version = "3.8.0-rc.3"
    }
  }
}

provider "keycloak" {
    client_id     = "admin-cli"
    username      = "admin"
    password      = "admin123"
    url           = "https://localhost:8443"
    base_path = ""
}

resource "keycloak_realm" "realm" {
  realm   = "demo"
  enabled = true
}

resource "keycloak_openid_client" "openid_client" {
  realm_id  = keycloak_realm.realm.id
  client_id = "grafana"
  name    = "grafna"
  enabled = true
  access_type         = "CONFIDENTIAL"
  valid_redirect_uris = [
    "https://localhost:8443/openid-callback"
  ]
}

resource "keycloak_openid_user_client_role_protocol_mapper" "user_client_role_mapper" {
  realm_id   = keycloak_realm.realm.id
  client_id  = keycloak_openid_client.openid_client.id
  name       = "user-client-role-mapper"
  claim_name = "roles"
}