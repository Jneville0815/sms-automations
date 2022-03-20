variable "function_name" {
  type = string
}

variable "function_iam_role_arn" {
  type = string
}

variable "function_description" {
  type = string
}

variable "function_cron_job" {
  type = string
}

variable "global" {
  type = object({
    repository_name = string
    aws_account_id  = string
    aws_region      = string
    tags            = map(string)
  })
}
