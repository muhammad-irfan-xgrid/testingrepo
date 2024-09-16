# S208: Deploying a Highly Available & Scalable Wordpress Server on AWS

<!-- Xgrid Learning and Development Program -->
## Overview

This module focuses on creating a Wordpress Host EC2 connected with RDS database along with the following components
> - Subnets (Public & Private)
> - Nat gateway
> - Internet Gateway
> - DNS endpoint for load balancer
> - Security Groups
> - Route Tables
> - RDS Database
> - Application load balancer
> - Autoscailing group
> - Target group
> - Ec2 instances
> - Launch configuration

## Learning Outcomes

This module has the following learning outcomes:

> - Creating a Virtual Private Cloud 
> - Creating an AWS Relational Database ( Multi-AZ )
> - Connecting Wordpress to the RDS
> - Creating a Launch Configuration and Autoscaling Group ( High Scalability )
> - Creating an Application Load Balancer and Target Group  ( High Availability )
> - Integration of AutoScaling Group with Application Load Balancer

## Prerequisites

### Installation Instructions

You need to install the following tools:

> - [Terraform](https://www.terraform.io/downloads)
> - [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
> - [Terraform docs](https://terraform-docs.io/user-guide/installation/)
> - [AWS IAM User Account](https://aws.amazon.com/console/)  
> - [Wordpress](https://wordpress.org/download/)

## Getting Started

1.  Run the following command to initialize the working directory and download the required provider and modules:

		`terraform init` 

2.  Run the following command to see the changes Terraform will make to your AWS environment:

		`terraform plan` 

3.  If the plan looks good, run the following command to create the resources:

		`terraform apply` 

4.  To delete the resources, run the following command:

		`terraform destroy` 

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.59.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.4.0 |
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_db"></a> [db](#module\_db) | terraform-aws-modules/rds/aws | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_attachment.asg_attachment_bar](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_attachment) | resource |
| [aws_autoscaling_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_autoscaling_policy.high](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy) | resource |
| [aws_autoscaling_policy.low](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy) | resource |
| [aws_cloudwatch_metric_alarm.high_cpu_alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.high_memory_alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.low_cpu_alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.low_memory_alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_key_pair.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_launch_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_configuration) | resource |
| [aws_lb.elb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener_rule.asg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule) | resource |
| [aws_lb_target_group.asg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_security_group.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [local_file.this](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [tls_private_key.rsa](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [aws_ami.amazon-linux-2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [template_file.userdata_file](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_adj_type"></a> [adj\_type](#input\_adj\_type) | n/a | `string` | `"ChangeInCapacity"` | no |
| <a name="input_all_allowed_cidr"></a> [all\_allowed\_cidr](#input\_all\_allowed\_cidr) | n/a | `string` | `"0.0.0.0/0"` | no |
| <a name="input_asg_desired_size"></a> [asg\_desired\_size](#input\_asg\_desired\_size) | n/a | `number` | `1` | no |
| <a name="input_asg_max_size"></a> [asg\_max\_size](#input\_asg\_max\_size) | n/a | `number` | `2` | no |
| <a name="input_asg_min_size"></a> [asg\_min\_size](#input\_asg\_min\_size) | n/a | `number` | `1` | no |
| <a name="input_asl_name"></a> [asl\_name](#input\_asl\_name) | n/a | `string` | `"s208_lc"` | no |
| <a name="input_asp_high"></a> [asp\_high](#input\_asp\_high) | n/a | `string` | `"policy_high"` | no |
| <a name="input_asp_low"></a> [asp\_low](#input\_asp\_low) | n/a | `string` | `"policy_low"` | no |
| <a name="input_availability_zone1"></a> [availability\_zone1](#input\_availability\_zone1) | n/a | `string` | `"us-west-1a"` | no |
| <a name="input_availability_zone2"></a> [availability\_zone2](#input\_availability\_zone2) | n/a | `string` | `"us-west-1c"` | no |
| <a name="input_aws_autoscaling_group"></a> [aws\_autoscaling\_group](#input\_aws\_autoscaling\_group) | n/a | `string` | `"s208_asg"` | no |
| <a name="input_aws_autoscaling_policy"></a> [aws\_autoscaling\_policy](#input\_aws\_autoscaling\_policy) | n/a | `string` | `"s208_as_policy"` | no |
| <a name="input_aws_instance_type"></a> [aws\_instance\_type](#input\_aws\_instance\_type) | n/a | `string` | `"t2.micro"` | no |
| <a name="input_aws_lb_target_group_name"></a> [aws\_lb\_target\_group\_name](#input\_aws\_lb\_target\_group\_name) | Name of the target group for the AWS Load Balancer | `string` | `"s208-asg"` | no |
| <a name="input_aws_load_balancer_type"></a> [aws\_load\_balancer\_type](#input\_aws\_load\_balancer\_type) | Type of AWS Load Balancer | `string` | `"application"` | no |
| <a name="input_comp_op_high"></a> [comp\_op\_high](#input\_comp\_op\_high) | n/a | `string` | `"GreaterThanThreshold"` | no |
| <a name="input_comp_op_low"></a> [comp\_op\_low](#input\_comp\_op\_low) | n/a | `string` | `"LessThanThreshold"` | no |
| <a name="input_cooldown"></a> [cooldown](#input\_cooldown) | n/a | `number` | `180` | no |
| <a name="input_cpu_threshold_high"></a> [cpu\_threshold\_high](#input\_cpu\_threshold\_high) | n/a | `string` | `"40"` | no |
| <a name="input_cpu_threshold_low"></a> [cpu\_threshold\_low](#input\_cpu\_threshold\_low) | n/a | `string` | `"30"` | no |
| <a name="input_create_db_subnet_group"></a> [create\_db\_subnet\_group](#input\_create\_db\_subnet\_group) | n/a | `bool` | `true` | no |
| <a name="input_create_monitoring_role"></a> [create\_monitoring\_role](#input\_create\_monitoring\_role) | n/a | `bool` | `false` | no |
| <a name="input_create_random_password"></a> [create\_random\_password](#input\_create\_random\_password) | n/a | `bool` | `false` | no |
| <a name="input_db_allocated_storage"></a> [db\_allocated\_storage](#input\_db\_allocated\_storage) | n/a | `string` | `"10"` | no |
| <a name="input_db_engine"></a> [db\_engine](#input\_db\_engine) | n/a | `string` | `"mysql"` | no |
| <a name="input_db_engine_version"></a> [db\_engine\_version](#input\_db\_engine\_version) | n/a | `string` | `"5.7"` | no |
| <a name="input_db_family"></a> [db\_family](#input\_db\_family) | n/a | `string` | `"mysql5.7"` | no |
| <a name="input_db_instance_class"></a> [db\_instance\_class](#input\_db\_instance\_class) | n/a | `string` | `"db.t3.micro"` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | n/a | `string` | `"s208db"` | no |
| <a name="input_db_port"></a> [db\_port](#input\_db\_port) | n/a | `string` | `"3306"` | no |
| <a name="input_db_tag"></a> [db\_tag](#input\_db\_tag) | n/a | `string` | `"s208-rds"` | no |
| <a name="input_default_action_lb"></a> [default\_action\_lb](#input\_default\_action\_lb) | Default action for the load balancer | `string` | `"forward"` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | n/a | `bool` | `false` | no |
| <a name="input_elb_name"></a> [elb\_name](#input\_elb\_name) | n/a | `string` | `"s208-elb"` | no |
| <a name="input_enable_nat_gateway"></a> [enable\_nat\_gateway](#input\_enable\_nat\_gateway) | n/a | `bool` | `true` | no |
| <a name="input_enable_vpn_gateway"></a> [enable\_vpn\_gateway](#input\_enable\_vpn\_gateway) | n/a | `bool` | `true` | no |
| <a name="input_eval_periods"></a> [eval\_periods](#input\_eval\_periods) | n/a | `string` | `"2"` | no |
| <a name="input_force_delete"></a> [force\_delete](#input\_force\_delete) | n/a | `bool` | `true` | no |
| <a name="input_health_check_grace_period"></a> [health\_check\_grace\_period](#input\_health\_check\_grace\_period) | n/a | `number` | `300` | no |
| <a name="input_health_check_type"></a> [health\_check\_type](#input\_health\_check\_type) | n/a | `string` | `"ELB"` | no |
| <a name="input_high_cpu_alarm"></a> [high\_cpu\_alarm](#input\_high\_cpu\_alarm) | n/a | `string` | `"alarm_high_cpu"` | no |
| <a name="input_high_cpu_alarm_description"></a> [high\_cpu\_alarm\_description](#input\_high\_cpu\_alarm\_description) | n/a | `string` | `"Notify on CPU usage greater than 40%"` | no |
| <a name="input_high_memory_alarm"></a> [high\_memory\_alarm](#input\_high\_memory\_alarm) | n/a | `string` | `"alarm_high_memory"` | no |
| <a name="input_high_memory_alarm_description"></a> [high\_memory\_alarm\_description](#input\_high\_memory\_alarm\_description) | n/a | `string` | `"Notify on Memory usage greater than 60%"` | no |
| <a name="input_http_protocol"></a> [http\_protocol](#input\_http\_protocol) | n/a | `string` | `"HTTP"` | no |
| <a name="input_interval"></a> [interval](#input\_interval) | n/a | `number` | `5` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | n/a | `string` | `"key_pair"` | no |
| <a name="input_launch_configuration"></a> [launch\_configuration](#input\_launch\_configuration) | n/a | `string` | `"s208_lc"` | no |
| <a name="input_low_cpu_alarm"></a> [low\_cpu\_alarm](#input\_low\_cpu\_alarm) | n/a | `string` | `"alarm_low_cpu"` | no |
| <a name="input_low_cpu_alarm_description"></a> [low\_cpu\_alarm\_description](#input\_low\_cpu\_alarm\_description) | n/a | `string` | `"Notify on CPU usage less than 30%"` | no |
| <a name="input_low_memory_alarm"></a> [low\_memory\_alarm](#input\_low\_memory\_alarm) | n/a | `string` | `"alarm_low_memory"` | no |
| <a name="input_low_memory_alarm_description"></a> [low\_memory\_alarm\_description](#input\_low\_memory\_alarm\_description) | n/a | `string` | `"Notify on Memory usage less than 50%"` | no |
| <a name="input_memory_threshold_high"></a> [memory\_threshold\_high](#input\_memory\_threshold\_high) | n/a | `string` | `"60"` | no |
| <a name="input_memory_threshold_low"></a> [memory\_threshold\_low](#input\_memory\_threshold\_low) | n/a | `string` | `"50"` | no |
| <a name="input_metric_name_cpu"></a> [metric\_name\_cpu](#input\_metric\_name\_cpu) | n/a | `string` | `"Cpu_Utilization"` | no |
| <a name="input_metric_name_memory"></a> [metric\_name\_memory](#input\_metric\_name\_memory) | n/a | `string` | `"Memory_Utilization"` | no |
| <a name="input_multi_az"></a> [multi\_az](#input\_multi\_az) | n/a | `bool` | `true` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | n/a | `string` | `"AWS/EC2"` | no |
| <a name="input_one_nat_gateway_per_az"></a> [one\_nat\_gateway\_per\_az](#input\_one\_nat\_gateway\_per\_az) | n/a | `bool` | `false` | no |
| <a name="input_password"></a> [password](#input\_password) | n/a | `string` | `"password"` | no |
| <a name="input_period"></a> [period](#input\_period) | n/a | `string` | `"300"` | no |
| <a name="input_policy_type"></a> [policy\_type](#input\_policy\_type) | n/a | `string` | `"SimpleScaling"` | no |
| <a name="input_port_0"></a> [port\_0](#input\_port\_0) | n/a | `number` | `0` | no |
| <a name="input_port_22"></a> [port\_22](#input\_port\_22) | n/a | `number` | `22` | no |
| <a name="input_port_3306"></a> [port\_3306](#input\_port\_3306) | n/a | `number` | `3306` | no |
| <a name="input_port_80"></a> [port\_80](#input\_port\_80) | n/a | `number` | `80` | no |
| <a name="input_private_security_group"></a> [private\_security\_group](#input\_private\_security\_group) | n/a | `string` | `"s208_private_sg"` | no |
| <a name="input_private_security_group_description"></a> [private\_security\_group\_description](#input\_private\_security\_group\_description) | n/a | `string` | `"Allow inside traffic from public subnet of VPC"` | no |
| <a name="input_private_subnet1_cidr"></a> [private\_subnet1\_cidr](#input\_private\_subnet1\_cidr) | n/a | `string` | `"10.0.0.0/24"` | no |
| <a name="input_private_subnet2_cidr"></a> [private\_subnet2\_cidr](#input\_private\_subnet2\_cidr) | n/a | `string` | `"10.0.1.0/24"` | no |
| <a name="input_protocol-1"></a> [protocol-1](#input\_protocol-1) | n/a | `string` | `"-1"` | no |
| <a name="input_public_security_group"></a> [public\_security\_group](#input\_public\_security\_group) | n/a | `string` | `"s208_public_sg"` | no |
| <a name="input_public_security_group_description"></a> [public\_security\_group\_description](#input\_public\_security\_group\_description) | n/a | `string` | `"Allow TLS inbound traffic"` | no |
| <a name="input_public_subnet1_cidr"></a> [public\_subnet1\_cidr](#input\_public\_subnet1\_cidr) | n/a | `string` | `"10.0.100.0/24"` | no |
| <a name="input_public_subnet2_cidr"></a> [public\_subnet2\_cidr](#input\_public\_subnet2\_cidr) | n/a | `string` | `"10.0.101.0/24"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-west-1"` | no |
| <a name="input_scale_adj_high"></a> [scale\_adj\_high](#input\_scale\_adj\_high) | n/a | `number` | `1` | no |
| <a name="input_scale_adj_low"></a> [scale\_adj\_low](#input\_scale\_adj\_low) | n/a | `number` | `-1` | no |
| <a name="input_single_nat_gateway"></a> [single\_nat\_gateway](#input\_single\_nat\_gateway) | n/a | `bool` | `true` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | n/a | `bool` | `true` | no |
| <a name="input_statistic"></a> [statistic](#input\_statistic) | n/a | `string` | `"Average"` | no |
| <a name="input_success_code"></a> [success\_code](#input\_success\_code) | Success code | `string` | `"200"` | no |
| <a name="input_target"></a> [target](#input\_target) | n/a | `string` | `"HTTP:80/"` | no |
| <a name="input_tcp_protocol"></a> [tcp\_protocol](#input\_tcp\_protocol) | n/a | `string` | `"tcp"` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | n/a | `number` | `2` | no |
| <a name="input_un_healthy_threshold"></a> [un\_healthy\_threshold](#input\_un\_healthy\_threshold) | n/a | `number` | `2` | no |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | n/a | `string` | `"admin"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | n/a | `string` | `"10.0.0.0/16"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | n/a | `string` | `"s208_vpc"` | no |
| <a name="input_wait_for_capacity_timeout"></a> [wait\_for\_capacity\_timeout](#input\_wait\_for\_capacity\_timeout) | n/a | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_DNS_endpoint"></a> [DNS\_endpoint](#output\_DNS\_endpoint) | Load balancer endpoint for the Wordpress Server |
| <a name="output_database_endpoint"></a> [database\_endpoint](#output\_database\_endpoint) | RDS database endpoint |

## Final Output:

### Deployment Tasks

> - Creating a Virtual Private Cloud
![vpc](https://user-images.githubusercontent.com/126760802/226341006-60a29b8c-461e-4835-87c0-a45be96c7fc6.png)
![subnets](https://user-images.githubusercontent.com/126760802/226341283-301780ed-c60e-4dbf-be85-56aca88d9db7.png)
![sgpublic](https://user-images.githubusercontent.com/126760802/226341455-c7b2f670-1946-4b33-8585-a3767d37b465.png)
![sgprivate](https://user-images.githubusercontent.com/126760802/226341575-4d8ef7b1-d7a9-4dd5-ac7d-61c6187d4a0a.png)
![igw](https://user-images.githubusercontent.com/126760802/226341855-f1ca8a7c-ca01-484c-aa3f-da388dd0a610.png)
![nat](https://user-images.githubusercontent.com/126760802/226341954-2acea671-77f4-4f7b-b380-bbfae04ddef5.png)


> - Creating an AWS Relational Database ( Multi-AZ )
![rds](https://user-images.githubusercontent.com/126760802/226342129-57b83b4c-8935-4a45-8469-50ad52697a92.png)

> - Connecting Wordpress to the RDS
![ec2](https://user-images.githubusercontent.com/126760802/226342997-19862db2-d46a-44aa-9823-44d1b9deb2e2.png)

> - Creating a Launch Configuration and Autoscaling Group ( High Scalability )
![lc](https://user-images.githubusercontent.com/126760802/226342719-b6b99cd4-08f8-4894-ab03-8756a015bb5f.png)
![asg](https://user-images.githubusercontent.com/126760802/226342886-e58ccae9-9a34-40ce-8b12-18487d1b15ea.png)

> - Creating an Application Load Balancer and Target Group  ( High Availability )
![loadbalancer](https://user-images.githubusercontent.com/126760802/226342393-497142c0-6d64-4bca-9deb-3cc24335a6c5.png)
![targetgrp](https://user-images.githubusercontent.com/126760802/226342556-ef32c140-5d01-4011-a789-b8773aa7740c.png)

> - Integration of AutoScaling Group with Application Load Balancer
![registertarget](https://user-images.githubusercontent.com/126760802/226343935-2cc9a139-0490-4f11-b1e4-78a989a2e07e.png)

### Bonus Tasks
> - Setup CloudWatch alarms for CPU/Memory Utilization (High/Low)
![cw_alarms](https://user-images.githubusercontent.com/126760802/226344511-a27b5d95-8910-4754-b4ab-13ede52f1431.png)

### Live Server
> - Wordpress Server
![ec2ip](https://user-images.githubusercontent.com/126760802/226344897-6d424ba5-9e12-4a68-bae8-ca6a83cc087e.png)

> - ALB DNS
![albdns](https://user-images.githubusercontent.com/126760802/226345094-595f8f2f-7973-454c-800e-4ec1ea39372e.png)

## References 
-   [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)
-   [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway)
-   [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)
-   [https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key)
- https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group
- https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb
- https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance
