// Create CloudWatch Alarms on CPU/Memory utilization metrics
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm
# Alarms High Utilization
resource "aws_cloudwatch_metric_alarm" "high_cpu_alarm" {
  alarm_name                = var.high_cpu_alarm
  comparison_operator       = var.comp_op_high
  evaluation_periods        = var.eval_periods
  metric_name               = var.metric_name_cpu
  namespace                 = var.namespace
  period                    = var.period
  statistic                 = var.statistic
  threshold                 = var.cpu_threshold_high
  alarm_description         = var.high_cpu_alarm_description
  alarm_actions             = [aws_autoscaling_policy.high.arn]
}

resource "aws_cloudwatch_metric_alarm" "high_memory_alarm" {
  alarm_name                = var.high_memory_alarm
  comparison_operator       = var.comp_op_high
  evaluation_periods        = var.eval_periods
  metric_name               = var.metric_name_memory
  namespace                 = var.namespace
  period                    = var.period
  statistic                 = var.statistic
  threshold                 = var.memory_threshold_high
  alarm_description         = var.high_memory_alarm_description
  alarm_actions             = [aws_autoscaling_policy.high.arn]
}

# Alarms Low Utilization
resource "aws_cloudwatch_metric_alarm" "low_cpu_alarm" {
  alarm_name                = var.low_cpu_alarm
  comparison_operator       = var.comp_op_low
  evaluation_periods        = var.eval_periods
  metric_name               = var.metric_name_cpu
  namespace                 = var.namespace
  period                    = var.period
  statistic                 = var.statistic
  threshold                 = var.cpu_threshold_low
  alarm_description         = var.low_cpu_alarm_description
  alarm_actions             = [aws_autoscaling_policy.low.arn]
}

resource "aws_cloudwatch_metric_alarm" "low_memory_alarm" {
  alarm_name                = var.low_memory_alarm
  comparison_operator       = var.comp_op_low
  evaluation_periods        = var.eval_periods
  metric_name               = var.metric_name_memory
  namespace                 = var.namespace
  period                    = var.period
  statistic                 = var.statistic
  threshold                 = var.memory_threshold_high
  alarm_description         = var.low_memory_alarm_description
  alarm_actions             = [aws_autoscaling_policy.low.arn]
}
