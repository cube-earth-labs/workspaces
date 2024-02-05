##########################################################
# Data Lookups
##########################################################

# Retrieve the Github Oauth Client
data "tfe_oauth_client" "client" {
  oauth_client_id = var.oauth_client_id
}
