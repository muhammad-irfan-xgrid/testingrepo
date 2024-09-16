variable "aws_instance_type" {
  type      = string
}

variable "key_name" {
  type      = string
}

variable "region" {
  type      = string
}

variable "asl_name" {
  type      = string
}

variable "vpc_name" {
  type      = string
}

variable "vpc_cidr" {
  type      = string
}

variable "availability_zone1" {
  type      = string
}

variable "availability_zone2" {
  type      = string
}

variable "public_subnet1_cidr" {
  type      = string
}

variable "private_subnet1_cidr" {
  type      = string
}

variable "public_subnet2_cidr" {
  type      = string
}

variable "private_subnet2_cidr" {
  type      = string
}

variable "all_allowed_cidr" {
  type      = string
}

variable "db_name" {
  type    = string
}

variable "user_name" {
  type    = string
}

variable "password" {
  type    = string
}

variable "public_security_group" {
  type    = string
}

variable "private_security_group" {
  type    = string
}

variable "aws_autoscaling_group" {
  type    = string
}

variable "aws_autoscaling_policy" {
  type    = string
}

variable "aws_lb_target_group_name" {
  description = "Name of the target group for the AWS Load Balancer"
  type        = string
}

variable "default_action_lb" {
  description = "Default action for the load balancer"
  type        = string
}

variable "success_code" {
  description = "Success code"
  type        = string
}

variable "launch_configuration" {
  type    = string
}

variable "elb_name" {
  type    = string
}

variable "aws_load_balancer_type" {
  description = "Type of AWS Load Balancer"
  type        = string
}

variable "asp_high" {
  type    = string
}

variable "asp_low" {
  type    = string
}

variable "low_memory_alarm" {
  type    = string
}

variable "high_memory_alarm" {
  type    = string
}

variable "low_cpu_alarm" {
  type    = string
}

variable "high_cpu_alarm" {
  type    = string
}

variable "scale_adj_high" {
  type    = number
}

variable "scale_adj_low" {
  type    = number
}

variable "adj_type" {
  type    = string
}

variable "policy_type" {
  type    = string
}

variable "cooldown" {
  type    = number
}

variable "comp_op_high" {
  type    = string
}

variable "comp_op_low" {
  type    = string
}

variable "eval_periods" {
  type    = string
}

variable "metric_name_cpu" {
  type    = string
}

variable "metric_name_memory" {
  type    = string
}

variable "namespace" {
  type    = string
}

variable "period" {
  type    = string
}

variable "statistic" {
  type    = string
}

variable "cpu_threshold_high" {
  type    = string
}

variable "cpu_threshold_low" {
  type    = string
}

variable "memory_threshold_high" {
  type    = string
}

variable "memory_threshold_low" {
  type    = string
}

variable "high_cpu_alarm_description" {
  type    = string
}

variable "low_cpu_alarm_description" {
  type    = string
}

variable "high_memory_alarm_description" {
  type    = string
}

variable "low_memory_alarm_description" {
  type    = string
}

variable "asg_min_size" {
  type = number
}

variable "asg_max_size" {
  type = number
}

variable "asg_desired_size" {
  type = number
}

variable "health_check_grace_period" {
  type = number
}

variable "health_check_type" {
  type = string
}

variable "wait_for_capacity_timeout" {
  type = number
}

variable "force_delete" {
  type = bool
}

variable "port_80" {
  type = number
}

variable "port_22" {
  type = number
}

variable "port_0" {
  type = number
}

variable "port_3306" {
  type = number
}

variable "http_protocol" {
  type = string
}

variable "tcp_protocol" {
  type = string
}

variable "protocol-1" {
  type = string
}

variable "public_security_group_description" {
  type = string
}

variable "private_security_group_description" {
  type = string
}

variable "un_healthy_threshold" {
  type = number
}

variable "timeout" {
  type = number
}

variable "interval" {
  type = number
}

variable "target" {
  type = string
}

variable "db_engine" {
  type = string
}

variable "db_engine_version" {
  type = string
}

variable "db_instance_class" {
  type = string
}

variable "db_allocated_storage" {
  type = string
}

variable "db_port" {
  type = string
}

variable "db_tag" {
  type = string
}

variable "skip_final_snapshot" {
  type = bool
}

variable "multi_az" {
  type = bool
}

variable "create_random_password" {
  type = bool
}

variable "create_monitoring_role" {
  type = bool
}

variable "create_db_subnet_group" {
  type = bool
}

variable "deletion_protection" {
  type = bool
}

variable "db_family" {
  type = string
}

variable "enable_nat_gateway" {
  type = bool
}

variable "enable_vpn_gateway" {
  type = bool
}

variable "single_nat_gateway" {
  type = bool
}

variable "one_nat_gateway_per_az" {
  type = bool
}
