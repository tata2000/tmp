resource "aws_iam_group" "group" {
  name = local.group_name
  path = var.path
}

resource "aws_iam_group_policy_attachment" "group_policy" {
  group      = aws_iam_group.group.name
  policy_arn = aws_iam_policy.policy.arn
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect    = "Allow"
    actions   = ["sts:AssumeRole"]
    resources = [ aws_iam_role.role.arn ]
  }
}

resource "aws_iam_policy" "policy" {
  name        = local.policy_name
  path        = var.path
  description = "${local.policy_name} to allow users to assume role ${local.role_name}"

  policy = data.aws_iam_policy_document.assume_role.json
}
