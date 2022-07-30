output "loggroupname" {
  value = aws_cloudwatch_log_group.demogroup.name
  description = "Log group created"
}

output "logstreamname" {
  value = aws_cloudwatch_log_stream.demologstream.name
  description = "Log stream created"
}