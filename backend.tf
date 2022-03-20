terraform {
  backend "s3" {
    bucket         = "tfstate-sms-automations"
    key            = "tfstate-sms-automations/tfstate/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tfstate-lock-sms-automations"
  }
}