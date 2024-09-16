// Create Application load balancer for wordpress server
# https://www.terraform.io/docs/providers/aws/r/lb.html
resource "aws_lb" "elb" {
  name               = var.elb_name
  load_balancer_type = var.aws_load_balancer_type
  subnets            = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]
  security_groups    = [aws_security_group.public.id ]
  tags = {
    Name = var.elb_name
  }
}

// Create a listener for the ALB
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.elb.arn
  port              = 80
  protocol          = var.http_protocol
  default_action {
    type             = var.default_action_lb
    target_group_arn = aws_lb_target_group.asg.arn
  }
  tags = {
    Name  = "s208_elb_listener"
  }
}

// Create a target group for ASG
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group
resource "aws_lb_target_group" "asg" {
  name     = var.aws_lb_target_group_name
  port     = 80
  protocol = var.http_protocol
  vpc_id   = module.vpc.vpc_id
  health_check {
    protocol            = var.http_protocol
    matcher             = var.success_code
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
  tags = {
    Name  = "s208_elb_target_group"
  }
}

// Create Load Balancer Listener Rule resource
# https://www.terraform.io/docs/providers/aws/r/lb_listener_rule.html
resource "aws_lb_listener_rule" "asg" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 100
  action {
    type             = var.default_action_lb
    target_group_arn = aws_lb_target_group.asg.arn
  }
  condition {
    path_pattern {
      values = ["*"]
    }
  }
  tags = {
    Name  = "s208_elb_listner_rule"
  }
}
