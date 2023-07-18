module "aws_backup_example" {
  source     = "lgallard/backup/aws"
  version    = "0.19.2"
  vault_name = var.name
  plan_name  = var.name
  rules      = var.backup_rules
  selections = [
    {
      name      = var.name
      resources = [
        aws_dynamodb_table.this[0].arn
      ]
      not_resources = []
    }
  ]
  tags = merge(
    var.tags,
    {
      "Name" = format("%s", var.name)
    },
  )
}
