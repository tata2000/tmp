module "naming_convention" {
  for_each = local.naming_set
  source = "../naming_convention"

  name = var.name
  detailed_name = var.detailed_name
  append = each.key

}
