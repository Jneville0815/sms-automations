resource "aws_cloudwatch_event_target" "lambda" {
  target_id = "lambda-${var.function_name}"
  arn       = aws_lambda_function.lambda.arn
  rule      = var.function_cron_name
}

resource "aws_cloudwatch_log_group" "lambda" {
  name = "/aws/lambda/${var.function_name}"

  tags = var.global.tags
}

