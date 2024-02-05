variable "tfc_org" {
  description = "The name of your TFC Org"
}

variable "platform_project_id" {
  description = "The ID of the Platform Project"
}

variable "labs_project_id" {
  description = "The ID of the Labs Project"
}

variable "vault_addr" {
  description = "The address of the Vault instance runs will access."
}

variable "vault_namespace" {
  description = "The Vault namespace to use, if not using the default"
}

variable "oauth_client_id" {
  description = "The ID of the OAuth Client to use for VCS integration"
}

variable "arm_subscription_id" {
  type        = string
  description = "The Azure Subscription ID"
}

variable "arm_tenant_id" {
  type        = string
  description = "The Azure Tenant ID"
}
