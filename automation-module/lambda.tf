resource "aws_lambda_function" "lambda" {
  function_name                  = var.function_name
  description                    = var.function_description
  role                           = var.function_iam_role_arn
  filename                       = "${var.function_name}.zip"
  handler                        = "${var.function_name}.lambda_handler"
  source_code_hash               = filebase64sha256("${var.function_name}.zip")
  runtime                        = "python3.8"
  reserved_concurrent_executions = 1
  memory_size                    = 128
  timeout                        = 900

  environment {
    variables = {
      TWILIO_AUTH_TOKEN   = data.aws_ssm_parameter.twilio_auth_token.value
      TWILIO_ACCOUNT_SID  = data.aws_ssm_parameter.twilio_account_sid.value
      TWILIO_PHONE_NUMBER = data.aws_ssm_parameter.twilio_phone_number.value
    }
  }

  tags = var.global.tags
}

resource "aws_lambda_permission" "lambda" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  statement_id  = "AllowExecutionFromCloudWatch"
  principal     = "events.amazonaws.com"
  source_arn    = var.function_cron_arn
}