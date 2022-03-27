data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = [ data.aws_caller_identity.current.account_id ]
    }
  }
}

resource "aws_iam_role" "role" {
  name               = local.role_name
  path               = var.path

  assume_role_policy = data.aws_iam_policy_document.assume-role-policy.json

  tags = {
  #TODO - remove or fix
    #"Created By" = "${self.resource_name}"
  }
}
