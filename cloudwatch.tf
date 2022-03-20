resource "aws_cloudwatch_event_rule" "every-hour" {
  name                = "every-hour"
  schedule_expression = "rate(1 hour)"
  is_enabled          = true

  tags = local.global.tags
}

resource "aws_cloudwatch_event_rule" "first-monday-of-month-9am" {
  name                = "first-monday-of-month-9am"
  schedule_expression = "cron(0 9 ? * 2#1 *)"
  is_enabled          = true

  tags = local.global.tags
}