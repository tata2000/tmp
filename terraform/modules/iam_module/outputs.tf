output "names" {
  value = toset([
    for k,v in module.naming_convention : v.name
  ])
}
output "group" {
  value = aws_iam_group.group.arn
}

output "role" {
  value = aws_iam_role.role.arn
}

output "policy" {
  value = aws_iam_policy.policy.arn
}

output "user" {
  value = aws_iam_user.user
}
