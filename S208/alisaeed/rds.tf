// Create RDS database
# https://registry.terraform.io/modules/terraform-aws-modules/rds/aws/latest
module "db" {
  source  = "terraform-aws-modules/rds/aws"
  # parameters
  identifier             = var.db_name
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  allocated_storage      = var.db_allocated_storage
  create_db_subnet_group = var.create_db_subnet_group
  subnet_ids             = module.vpc.private_subnets
  major_engine_version   = var.db_engine_version
  deletion_protection    = var.deletion_protection
  db_name  = var.db_name
  username = var.user_name
  password = var.password
  port     = var.db_port
  family = var.db_family
  skip_final_snapshot                   = var.skip_final_snapshot
  multi_az                              = var.multi_az
  create_random_password                = var.create_random_password
  create_monitoring_role                = var.create_monitoring_role
  vpc_security_group_ids                = [aws_security_group.private.id]
  tags = {
    Name = var.db_tag
  }
}
