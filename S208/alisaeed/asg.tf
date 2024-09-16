// Create auto scailing group for ec2
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group
resource "aws_autoscaling_group" "this" {
  name                      = var.aws_autoscaling_group
  max_size                  = var.asg_max_size
  min_size                  = var.asg_min_size
  desired_capacity          = var.asg_desired_size
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  wait_for_capacity_timeout = var.wait_for_capacity_timeout
  force_delete              = var.force_delete
  vpc_zone_identifier       = module.vpc.public_subnets
  launch_configuration      = aws_launch_configuration.this.name
  tag {
    key                 = "Name"
    value               = "s208-asg-instance"
    propagate_at_launch = true
  }
}

// Register targets with a target group
# https://www.terraform.io/docs/providers/aws/r/lb_target_group.html
resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.this.id
  lb_target_group_arn    = aws_lb_target_group.asg.arn
}

// Create Auto Scaling Policy for High
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy
resource "aws_autoscaling_policy" "high" {
  name                   = var.asp_high
  scaling_adjustment     = var.scale_adj_high
  adjustment_type        = var.adj_type
  policy_type            = var.policy_type
  cooldown               = var.cooldown
  autoscaling_group_name = aws_autoscaling_group.this.name
}

// Create Auto Scaling Policy for Low
resource "aws_autoscaling_policy" "low" {
  name                   = var.asp_low
  scaling_adjustment     = var.scale_adj_low
  adjustment_type        = var.adj_type
  policy_type            = var.policy_type
  cooldown               = var.cooldown
  autoscaling_group_name = aws_autoscaling_group.this.name
}
