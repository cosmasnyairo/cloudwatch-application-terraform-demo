data "aws_iam_policy_document" "sns_topic_policy" {
  policy_id = "__default_policy_ID"
  statement {
    actions = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:DeleteTopic",
      "SNS:AddPermission",
    ]
    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"
      values   = sensitive([var.account-id])
    }
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    resources = [aws_sns_topic.aws_event_notifications.arn]
    sid       = "__default_statement_ID"
  }
}
