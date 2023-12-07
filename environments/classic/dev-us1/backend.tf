terraform {
  cloud {
    hostname     = "app.terraform.io"
    organization = "twilio-main"

    workspaces {
      name = "tcm-rds-migration"
    }
  }
}
