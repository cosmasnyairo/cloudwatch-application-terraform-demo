# resource "aws_sns_topic" "aws_event_notifications" {
#   name         = var.sns_topic_name
#   display_name = var.dispay_name
#   tags = merge(
#     var.tags,
#     {
#       Name = var.sns_topic_name
#     },
#   )
# }

# resource "aws_sns_topic_policy" "aws_event_notifications_policy" {
#   arn    = aws_sns_topic.aws_event_notifications.arn
#   policy = data.aws_iam_policy_document.sns_topic_policy.json
# }

resource "aws_cloudwatch_log_metric_filter" "MetricFilter" {
  for_each       = var.alarm_configs
  name           = each.value.metric_filter_name
  log_group_name = var.log_group_name
  pattern        = each.value.log_filter_pattern

  metric_transformation {
    name      = each.value.metric_name
    value     = each.value.metric_value
    namespace = each.value.metric_namespace
    dimensions = {
      "$.functioncalled" = "$.functioncalled"
    }
  }
}

resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "sales-demo"

  dashboard_body = <<EOF
{
  "widgets": [
    {
      "type": "metric",

      "width": 6,
      "height": 8,
      "properties": {
        "sparkline": true,
        "metrics": [
          ["DemoMetrics", "addProduct", "$.functioncalled", "addproduct"]
        ],
        "view": "gauge",
        "stacked": false,
        "stat": "SampleCount",
        "period": 30,
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
          ["DemoMetrics", "addDiscount", "$.functioncalled", "add_discount"]
        ],
        "view": "gauge",
        "stacked": false,
        "stat": "SampleCount",
        "period": 30,
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
          ["DemoMetrics", "addtoCart", "$.functioncalled", "addtocart"]
        ],
        "view": "gauge",
        "stacked": false,
        "stat": "SampleCount",
        "period": 30,
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
          ["DemoMetrics", "getDiscounts", "$.functioncalled", "get_discounts"]
        ],
        "view": "gauge",
        "stacked": false,
        "stat": "SampleCount",
        "period": 30,
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
        "metrics": [["DemoMetrics", "getCart", "$.functioncalled", "getcart"]],
        "view": "gauge",
        "stacked": false,
        "stat": "SampleCount",
        "period": 30,
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
            "$.functioncalled",
            "getproductbyid"
          ]
        ],
        "view": "gauge",
        "stacked": false,
        "stat": "SampleCount",
        "period": 30,
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
          ["DemoMetrics", "getProducts", "$.functioncalled", "getproducts"]
        ],
        "view": "gauge",
        "stacked": false,
        "stat": "SampleCount",
        "period": 30,
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
            "$.functioncalled",
            "removediscounts"
          ]
        ],
        "view": "gauge",
        "stacked": false,
        "stat": "SampleCount",
        "period": 30,
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
            "$.functioncalled",
            "removefromcart"
          ]
        ],
        "view": "gauge",
        "stacked": false,
        "stat": "SampleCount",
        "period": 30,
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
          ["DemoMetrics", "removeProduct", "$.functioncalled", "removeproduct"]
        ],
        "view": "gauge",
        "stacked": false,
        "stat": "SampleCount",
        "period": 30,
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

# resource "aws_cloudwatch_metric_alarm" "CloudWatchAlarm" {
#   for_each            = var.alarm_configs
#   alarm_name          = each.value.alarm_name
#   alarm_description   = each.value.alarm_description
#   metric_name         = each.value.metric_name
#   namespace           = each.value.metric_namespace
#   statistic           = each.value.metric_statistic
#   period              = each.value.metric_period
#   threshold           = each.value.metric_threshold
#   evaluation_periods  = each.value.metric_evaluation_periods
#   comparison_operator = each.value.metric_comparison_operator
#   treat_missing_data  = each.value.metric_treat_missing_data
#   dimensions = {
#       "$.functioncalled" = "$.functioncalled"
#   }
#   tags = merge(
#     var.tags,
#     {
#       Name = each.value.alarm_name
#     },
#   )
# }



# resource "aws_cloudwatch_composite_alarm" "CompositeAlarm" {
  
#   alarm_description = var.composite_alarm_description
#   alarm_name        = var.composite_alarm_name
#   alarm_actions     = [aws_sns_topic.aws_event_notifications.arn]
#   alarm_rule        = var.alarm_rules               
#   tags = merge(
#     var.tags,
#     {
#       Name = var.composite_alarm_name
#     },
#   )
#   depends_on = [
#     aws_cloudwatch_metric_alarm.CloudWatchAlarm
#   ]
# }
