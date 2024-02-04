terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.51.1"
    }
  }

  cloud {
    organization = "ericreeves-demo"
    hostname     = "app.terraform.io"
    workspaces {
      name = "workspaces"
    }
  }
}

provider "tfe" {}
