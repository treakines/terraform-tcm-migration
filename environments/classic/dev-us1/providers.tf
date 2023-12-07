# When importing state comment this line out
variable "TFC_CONFIGURATION_VERSION_GIT_COMMIT_SHA" {
  description = "Do not explicitly set the value, as it will be automatically injected by the TFC workspace."
}

provider "aws" {
  region = "us-east-1"
  alias  = "us-east-1"

  # Comment out this block when importing a thing
  assume_role {
    role_arn     = "arn:aws:iam::111018753471:role/platform-terraform-delegate"
    session_name = "TFC-COMMIT-SHA-${var.TFC_CONFIGURATION_VERSION_GIT_COMMIT_SHA}"
  }

  # https://wiki.hq.twilio.com/display/PLATOPS/Tagging+your+AWS+Resources
  default_tags {
    tags = {
      # these tags need to be added in each module
      "platform:system"     = "Data Catalog"
      "platform:team"       = "data-catalog"
      "tcss:owner"          = "data-catalog"
      "tcss:creator"        = "data-catalog"
      "tcss:classification" = "green"
      "tcss:repo"           = "git@code.hq.twilio.com:data/catalog-aws-resources.git"
      "tcss:tag-version"    = "1"
      "managed-by-tfc"      = "true"
    }
  }
}
