locals {
  global = {
    repository_name = var.repository_name
    aws_account_id  = data.aws_caller_identity.current.account_id
    aws_region      = data.aws_region.current.name
    tags = {
      "source-repository" = var.repository_name
      "owner-email"       = "jimmyeneville@gmail.com"
    }
  }
}