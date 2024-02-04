##########################################################
# Configuration
##########################################################
locals {
  tfc_vault_role      = "tfc-role"
  tfc_vault_auth_path = "jwt-platform"
  vcs_repo            = "cube-earth-labs/vault_config"
}

# Retrieve the Github Oauth Client
data "tfe_oauth_client" "client" {
  oauth_client_id = var.oauth_client_id
}

##########################################################
# Resources
##########################################################
resource "tfe_workspace" "vault_config" {
  name             = "vault_config"
  organization     = var.tfc_org
  project_id       = var.platform_project_id
  auto_apply       = true
  trigger_patterns = ["/**/*.tf"]

  vcs_repo {
    identifier     = local.vcs_repo
    branch         = "main"
    oauth_token_id = data.tfe_oauth_client.client.oauth_token_id
  }
}

resource "tfe_variable" "enable_vault_provider_auth" {
  description  = "Enable the Workload Identity integration for Vault."
  workspace_id = tfe_workspace.vault_config.id

  key      = "TFC_VAULT_PROVIDER_AUTH"
  value    = "true"
  category = "env"
}

resource "tfe_variable" "tfc_vault_addr" {
  description  = "The address of the Vault instance runs will access."
  workspace_id = tfe_workspace.vault_config.id

  key      = "TFC_VAULT_ADDR"
  value    = var.vault_addr
  category = "env"
}

resource "tfe_variable" "tfc_vault_role" {
  description  = "The Vault role runs will use to authenticate."
  workspace_id = tfe_workspace.vault_config.id

  key      = "TFC_VAULT_RUN_ROLE"
  value    = local.tfc_vault_role
  category = "env"
}

resource "tfe_variable" "tfc_vault_namespace" {
  description  = "The Vault namespace runs will use to authenticate."
  workspace_id = tfe_workspace.vault_config.id

  key      = "TFC_VAULT_NAMESPACE"
  value    = var.vault_namespace
  category = "env"
}

resource "tfe_variable" "tfc_vault_auth_path" {
  description  = "The Vault auth path runs will use to authenticate."
  workspace_id = tfe_workspace.vault_config.id

  key      = "TFC_VAULT_AUTH_PATH"
  value    = local.tfc_vault_auth_path
  category = "env"
}
