resource "aws_cloudwatch_event_rule" "lambda" {
  name                = "every-ten-minutes"
  schedule_expression = var.function_cron_job
  is_enabled          = true

  tags = var.global.tags
}

resource "aws_cloudwatch_event_target" "lambda" {
  target_id = "lambda-${var.function_name}"
  arn       = aws_lambda_function.lambda.arn
  rule      = aws_cloudwatch_event_rule.lambda.name
}

resource "aws_cloudwatch_log_group" "lambda" {
  name = "/aws/lambda/${var.function_name}"

  tags = var.global.tags
}

