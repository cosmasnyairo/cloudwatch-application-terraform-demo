variable "account-id" {
  type        = string
  description = "Id for the account resources are to be created"
}

variable "dispay_name" {
  type        = string
  description = "SNS Topic Display Name"
}

variable "alarm_rules" {
  type        = string
  description = "Alarm rules for the Composite Alarm"

}

variable "alarm_configs" {
  type        = map(map(any))
  description = "Alarm configuration for the cloudwatch alarm"
}

variable "sns_topic_name" {
  type        = string
  description = "SNS Topic Display Name"
}

variable "log_group_name" {
  type        = string
  description = "Cloudwatch log group name"
}

variable "log_stream_name" {
  type        = string
  description = "Cloudwatch log stream name"
}

variable "tags" {
  type        = map(any)
  description = "Tags for resources"
}

variable "composite_alarm_description" {
  type        = string
  description = "Composite alarm description"
}

variable "composite_alarm_name" {
  type        = string
  description = "Cloudwatch alarm name"
}
