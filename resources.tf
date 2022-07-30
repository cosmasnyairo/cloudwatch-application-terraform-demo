resource "aws_sns_topic" "aws_event_notifications" {
  name         = var.sns_topic_name
  display_name = var.dispay_name
  tags = merge(
    var.tags,
    {
      Name = var.sns_topic_name
    },
  )
}

resource "aws_sns_topic_policy" "aws_event_notifications_policy" {
  arn    = aws_sns_topic.aws_event_notifications.arn
  policy = data.aws_iam_policy_document.sns_topic_policy.json
}

resource "aws_cloudwatch_log_group" "demogroup" {
  name              = var.log_group_name
  retention_in_days = 1
  tags = merge(
    var.tags,
    {
      Name = var.log_group_name
    },
  )
}

resource "aws_cloudwatch_log_stream" "demologstream" {
  name           = var.log_stream_name
  log_group_name = aws_cloudwatch_log_group.demogroup.name
}


resource "aws_cloudwatch_log_metric_filter" "MetricFilter" {
  for_each       = var.alarm_configs
  name           = each.value.metric_filter_name
  log_group_name = aws_cloudwatch_log_group.demogroup.name
  pattern        = each.value.log_filter_pattern
  metric_transformation {
    name      = each.value.metric_name
    value     = each.value.metric_value
    namespace = each.value.metric_namespace
    dimensions = {
      "$.demoaction" = "$.demoaction"
    }
  }
}

resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "sales-demo"

  dashboard_body = <<EOF
{
  "periodOverride": "inherit", 
  "liveDataOverride": "true",
  "widgets": [
    {
      "type": "metric",
      
      "width": 6,
      "height": 8,
      "properties": {
        "sparkline": true,
        "metrics": [
          ["DemoMetrics", "addProduct", "$.demoaction", "addproduct"]
        ],
        "view": "gauge",
        "stacked": false,
        "stat": "SampleCount",
        "period": 86400,
     "liveData": true,
        "yAxis": {
          "left": {
            "min": 5,
            "max": 100
          }
        },
        "title": "Products added",
        "region": "eu-west-1"
      }
    },
    {
      "type": "metric",

      "width": 6,
      "height": 8,
      "properties": {
        "sparkline": true,
        "metrics": [
          ["DemoMetrics", "addDiscount", "$.demoaction", "add_discount"]
        ],
        "view": "gauge",
        "stacked": false,
        "stat": "SampleCount",
        "period": 86400,
     "liveData": true,
        "yAxis": {
          "left": {
            "min": 5,
            "max": 100
          }
        },
        "title": "Discounts added",
        "region": "eu-west-1"
      }
    },
    {
      "type": "metric",
   

      "width": 6,
      "height": 8,
      "properties": {
        "sparkline": true,
        "metrics": [
          ["DemoMetrics", "addtoCart", "$.demoaction", "addtocart"]
        ],
        "view": "gauge",
        "stacked": false,
        "stat": "SampleCount",
        "period": 86400,
     "liveData": true,
        "yAxis": {
          "left": {
            "min": 5,
            "max": 100
          }
        },
        "title": "items added to cart",
        "region": "eu-west-1"
      }
    },
    {
      "type": "metric",



      "width": 6,
      "height": 8,
      "properties": {
        "sparkline": true,
        "metrics": [
          ["DemoMetrics", "getDiscounts", "$.demoaction", "get_discounts"]
        ],
        "view": "gauge",
        "stacked": false,
        "stat": "SampleCount",
        "period": 86400,
     "liveData": true,
        "yAxis": {
          "left": {
            "min": 5,
            "max": 100
          }
        },
        "title": "Discounts fetched",
        "region": "eu-west-1"
      }
    },
    {
      "type": "metric",


      "width": 6,
      "height": 8,
      "properties": {
        "sparkline": true,
        "metrics": [["DemoMetrics", "getCart", "$.demoaction", "getcart"]],
        "view": "gauge",
        "stacked": false,
        "stat": "SampleCount",
        "period": 86400,
     "liveData": true,
        "yAxis": {
          "left": {
            "min": 5,
            "max": 100
          }
        },
        "title": "cart itters fetched",
        "region": "eu-west-1"
      }
    },
    {
      "type": "metric",



      "width": 6,
      "height": 8,
      "properties": {
        "sparkline": true,
        "metrics": [
          [
            "DemoMetrics",
            "getProductbyId",
            "$.demoaction",
            "getproductbyid"
          ]
        ],
        "view": "gauge",
        "stacked": false,
        "stat": "SampleCount",
        "period": 86400,
     "liveData": true,
        "yAxis": {
          "left": {
            "min": 5,
            "max": 100
          }
        },
        "title": "products fetched",
        "region": "eu-west-1"
      }
    },
    {
      "type": "metric",



      "width": 6,
      "height": 8,
      "properties": {
        "sparkline": true,
        "metrics": [
          ["DemoMetrics", "getProducts", "$.demoaction", "getproducts"]
        ],
        "view": "gauge",
        "stacked": false,
        "stat": "SampleCount",
        "period": 86400,
     "liveData": true,
        "yAxis": {
          "left": {
            "min": 5,
            "max": 100
          }
        },
        "title": "Single products fetched",
        "region": "eu-west-1"
      }
    },
    {
      "type": "metric",



      "width": 6,
      "height": 8,
      "properties": {
        "sparkline": true,
        "metrics": [
          [
            "DemoMetrics",
            "removeDiscount",
            "$.demoaction",
            "removediscounts"
          ]
        ],
        "view": "gauge",
        "stacked": false,
        "stat": "SampleCount",
        "period": 86400,
     "liveData": true,
        "yAxis": {
          "left": {
            "min": 5,
            "max": 100
          }
        },
        "title": "Discounts removed",
        "region": "eu-west-1"
      }
    },
    {
      "type": "metric",

      "width": 6,
      "height": 8,
      "properties": {
        "sparkline": true,
        "metrics": [
          [
            "DemoMetrics",
            "removefromCart",
            "$.demoaction",
            "removefromcart"
          ]
        ],
        "view": "gauge",
        "stacked": false,
        "stat": "SampleCount",
        "period": 86400,
     "liveData": true,
        "yAxis": {
          "left": {
            "min": 5,
            "max": 100
          }
        },
        "title": "items removed from cart",
        "region": "eu-west-1"
      }
    },
    {
      "type": "metric",

      "width": 6,
      "height": 8,
      "properties": {
        "sparkline": true,
        "metrics": [
          ["DemoMetrics", "removeProduct", "$.demoaction", "removeproduct"]
        ],
        "view": "gauge",
        "stacked": false,
        "stat": "SampleCount",
        "period": 86400,
     "liveData": true,
        "yAxis": {
          "left": {
            "min": 5,
            "max": 100
          }
        },
        "title": "Product removed",
        "region": "eu-west-1"
      }
    }
  ]
}

EOF
}

resource "aws_cloudwatch_metric_alarm" "CloudWatchAlarm" {
  for_each            = var.alarm_configs
  alarm_name          = each.value.alarm_name
  alarm_description   = each.value.alarm_description
  metric_name         = each.value.metric_name
  namespace           = each.value.metric_namespace
  statistic           = each.value.metric_statistic
  period              = each.value.metric_period
  threshold           = each.value.metric_threshold
  evaluation_periods  = each.value.metric_evaluation_periods
  comparison_operator = each.value.metric_comparison_operator
  treat_missing_data  = each.value.metric_treat_missing_data
  dimensions = {
    "$.demoaction" = each.value.dimenisonvalue
  }
  tags = merge(
    var.tags,
    {
      Name = each.value.alarm_name
    },
  )
}

resource "aws_cloudwatch_composite_alarm" "CompositeAlarm" {

  alarm_description = var.composite_alarm_description
  alarm_name        = var.composite_alarm_name
  alarm_actions     = [aws_sns_topic.aws_event_notifications.arn]
  alarm_rule        = var.alarm_rules
  tags = merge(
    var.tags,
    {
      Name = var.composite_alarm_name
    },
  )
  depends_on = [
    aws_cloudwatch_metric_alarm.CloudWatchAlarm
  ]
}
