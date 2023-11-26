resource "aws_cloudwatch_metric_alarm" "threshold" {
  alarm_name  = "${var.prefix} har over ${var.threshold} bilder i bøtta si!"
  namespace   = var.prefix
  metric_name = var.metric_name

  comparison_operator = "GreaterThanThreshold"
  threshold           = var.threshold
  evaluation_periods  = var.evaluation_periods
  period              = var.period
  statistic           = var.statistic

  alarm_description = "Alarm for å si ifra at det er over ${var.threshold} bilder i bucketen"
  alarm_actions     = [aws_sns_topic.user_updates.arn]
}

resource "aws_sns_topic" "user_updates" {
  name = "${var.prefix}-alarm-topic"
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.user_updates.arn
  protocol  = "email"
  endpoint  = var.alarm_email
}