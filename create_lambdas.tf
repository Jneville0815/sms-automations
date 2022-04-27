module "create_lambdas" {
  for_each              = { for script, script_description in var.scripts : script => script_description }
  source                = "./automation-module"
  function_name         = each.key
  function_description  = each.value
  function_iam_role_arn = aws_iam_role.automation_role.arn
  function_cron_name    = aws_cloudwatch_event_rule.first-monday-of-month-9am.name
  function_cron_arn     = aws_cloudwatch_event_rule.first-monday-of-month-9am.arn
  global                = local.global
}
