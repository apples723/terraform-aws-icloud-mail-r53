terraform {
  backend "s3" {
    bucket = "gsiders-terraform"
    key = "icloud-mail-r53/terraform.tfstate"
    region = "us-east-1"
    profile = "gsapp"
  }
}

provider "aws" {
  profile = "gsapp"
  region = "us-east-1"
}
