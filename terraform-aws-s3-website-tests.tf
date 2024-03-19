# ##########################################################
# # Configuration
# ##########################################################
# locals {
#   tf_test_vcs_repo    = "cube-earth-labs/terraform-aws-s3-website-tests"
#   tf_test_name        = "terraform-aws-s3-website-tests"
#   tf_test_description = "Terraform Tests - AWS S3 Website"
# }


# # ##########################################################
# # # Resources
# # ##########################################################
# # resource "tfe_workspace" "this" {
# #   name             = locals.name
# #   description      = locals.description
# #   organization     = var.tfc_org
# #   project_id       = var.labs_project_id
# #   auto_apply       = true
# #   trigger_patterns = ["/**/*.tf"]

# #   vcs_repo {
# #     identifier     = local.tf_test_vcs_repo
# #     branch         = "main"
# #     oauth_token_id = data.tfe_oauth_client.client.oauth_token_id
# #   }
# # }

# resource "tfe_registry_module" "this" {
#   organization = var.tfc_org
#   test_config {
#     tests_enabled = true
#   }
#   vcs_repo {
#     display_identifier = local.tf_test_vcs_repo
#     identifier         = local.tf_test_vcs_repo
#     oauth_token_id     = data.tfe_oauth_client.client.oauth_token_id
#     branch             = "main"
#   }
# }
