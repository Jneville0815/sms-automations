data "aws_iam_policy_document" "automation_assume_role_policy_document" {
  statement {
    effect = "Allow"
    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }
    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "automation_role_policy_document" {
  statement {
    effect    = "Allow"
    actions   = ["logs:CreateLogGroup"]
    resources = ["arn:aws:logs:${local.global.aws_region}:${local.global.aws_account_id}:*"]
  }

  statement {
    effect    = "Allow"
    actions   = ["logs:CreateLogStream", "logs:PutLogEvents"]
    resources = ["arn:aws:logs:${local.global.aws_region}:${local.global.aws_account_id}:log-group:/aws/lambda/*"]
  }
}

resource "aws_iam_role" "automation_role" {
  name               = "automation_role"
  assume_role_policy = data.aws_iam_policy_document.automation_assume_role_policy_document.json
  inline_policy {
    name   = "automation_role_policy"
    policy = data.aws_iam_policy_document.automation_role_policy_document.json
  }
  tags = local.global.tags
}
