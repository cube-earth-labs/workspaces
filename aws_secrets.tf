##########################################################
# Configuration
##########################################################
locals {
  aws_secrets_vcs_repo = "cube-earth-labs/vault_config"
}


##########################################################
# Resources
##########################################################
resource "tfe_workspace" "aws_secrets" {
  name             = "aws_secrets"
  organization     = var.tfc_org
  project_id       = var.labs_project_id
  auto_apply       = true
  trigger_patterns = ["/**/*.tf"]

  vcs_repo {
    identifier     = local.aws_secrets_vcs_repo
    branch         = "main"
    oauth_token_id = data.tfe_oauth_client.client.oauth_token_id
  }
}
