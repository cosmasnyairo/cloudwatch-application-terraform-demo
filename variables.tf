# variable "account-id" {
#   type = string
# }

# variable "dispay_name" {
#   type = string
# }

# variable "alarm_rules" {
#   type = string
# }

variable "alarm_configs" {
  type = map(map(string))
}

# variable "sns_topic_name" {
#   type = string
# }
 
variable "log_group_name" {
  type = string
}
variable "tags" {
  type = map(any)
}

# variable "composite_alarm_description" {
#   type = string
# }
# variable "composite_alarm_name" {
#   type = string
# }
