locals {
  role = "role"
  policy = "policy"
  user = "user"
  group = "group"

  naming_set = toset([local.role, local.policy, local.user, local.group])


  role_name = module.naming_convention[local.role].name
  policy_name = module.naming_convention[local.policy].name
  user_name = module.naming_convention[local.user].name
  group_name = module.naming_convention[local.group].name
}
