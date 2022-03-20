module "ubiquiti_script" {
  source                = "./automation-module"
  function_name         = "ubiquiti_script"
  function_description  = "Checks Ubiquiti shop for camera inventory"
  function_iam_role_arn = aws_iam_role.automation_role.arn
  function_cron_job     = "rate(1 hour)"
  global                = local.global
}