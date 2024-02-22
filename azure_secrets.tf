# ##########################################################
# # Configuration
# ##########################################################
# locals {
#   tfc_labs_role          = "tfc-labs-role"
#   tfc_labs_auth_path     = "jwt-labs"
#   azure_secrets_vcs_repo = "cube-earth-labs/azure_secrets"
# }


# ##########################################################
# # Resources
# ##########################################################
# resource "tfe_workspace" "azure_secrets" {
#   name             = "azure_secrets"
#   description      = "Azure Secrets Engine and Key Vault Configuration"
#   organization     = var.tfc_org
#   project_id       = var.labs_project_id
#   auto_apply       = true
#   trigger_patterns = ["/**/*.tf"]

#   vcs_repo {
#     identifier     = local.azure_secrets_vcs_repo
#     branch         = "main"
#     oauth_token_id = data.tfe_oauth_client.client.oauth_token_id
#   }
# }

# resource "tfe_variable" "azure_enable_vault_provider_auth" {
#   description  = "Enable the Workload Identity integration for Vault."
#   workspace_id = tfe_workspace.azure_secrets.id

#   key      = "TFC_VAULT_PROVIDER_AUTH"
#   value    = "true"
#   category = "env"
# }

# resource "tfe_variable" "azure_tfc_vault_addr" {
#   description  = "The address of the Vault instance runs will access."
#   workspace_id = tfe_workspace.azure_secrets.id

#   key      = "TFC_VAULT_ADDR"
#   value    = var.vault_addr
#   category = "env"
# }

# resource "tfe_variable" "azure_tfc_vault_role" {
#   description  = "The Vault role runs will use to authenticate."
#   workspace_id = tfe_workspace.azure_secrets.id

#   key      = "TFC_VAULT_RUN_ROLE"
#   value    = local.tfc_labs_role
#   category = "env"
# }

# resource "tfe_variable" "azure_tfc_vault_namespace" {
#   description  = "The Vault namespace runs will use to authenticate."
#   workspace_id = tfe_workspace.azure_secrets.id

#   key      = "TFC_VAULT_NAMESPACE"
#   value    = var.vault_namespace
#   category = "env"
# }

# resource "tfe_variable" "azure_tfc_vault_auth_path" {
#   description  = "The Vault auth path runs will use to authenticate."
#   workspace_id = tfe_workspace.azure_secrets.id

#   key      = "TFC_VAULT_AUTH_PATH"
#   value    = local.tfc_labs_auth_path
#   category = "env"
# }

# # resource "tfe_variable" "tfc_vault_backed_azure_auth" {
# #   workspace_id = tfe_workspace.azure_secrets.id

# #   key      = "TFC_VAULT_BACKED_AZURE_AUTH"
# #   value    = "true"
# #   category = "env"
# # }

# # resource "tfe_variable" "tfc_vault_backed_azure_run_vault_role" {
# #   workspace_id = tfe_workspace.azure_secrets.id

# #   key      = "TFC_VAULT_BACKED_AZURE_RUN_VAULT_ROLE"
# #   value    = "tfc"
# #   category = "env"
# }

# resource "tfe_variable" "azure_subscription_id" {
#   workspace_id = tfe_workspace.azure_secrets.id

#   key      = "azure_subscription_id"
#   value    = var.arm_subscription_id
#   category = "terraform"
# }

# resource "tfe_variable" "azure_tenant_id" {
#   workspace_id = tfe_workspace.azure_secrets.id

#   key      = "azure_tenant_id"
#   value    = var.arm_tenant_id
#   category = "terraform"
# }
