resource "aws_iam_user" "user" {
  name = local.user_name
  path = var.path

  tags = {
    #TODO
  }
}

resource "aws_iam_user_group_membership" "user_group_membership" {
  user = local.user_name

  groups = [
    local.group_name,
  ]
}
