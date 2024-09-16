output "database_endpoint" {
  description = "RDS database endpoint"
  value = module.db.db_instance_endpoint
}

output "DNS_endpoint" {
  description = "Load balancer endpoint for the Wordpress Server"
  value       = "http://${aws_lb.elb.dns_name}"
}
