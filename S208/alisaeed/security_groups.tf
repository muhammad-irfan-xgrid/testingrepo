// Create Security groups
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
resource "aws_security_group" "public" {
  name            = var.public_security_group
  description     = var.public_security_group_description
  vpc_id          = module.vpc.vpc_id
  ingress {
      from_port   = var.port_22
      to_port     = var.port_22
      protocol    = var.tcp_protocol
      cidr_blocks = [var.all_allowed_cidr]
    }
  ingress {
      from_port   = var.port_80
      to_port     = var.port_80
      protocol    = var.tcp_protocol
      cidr_blocks = [var.all_allowed_cidr]
    }
    egress {
      from_port   = var.port_0
      to_port     = var.port_0
      protocol    = var.protocol-1
      cidr_blocks = [var.all_allowed_cidr]
    }
  tags = {
    Name = var.public_security_group
  }
}

resource "aws_security_group" "private" {
  name                = var.private_security_group
  description         = var.private_security_group_description
  vpc_id              = module.vpc.vpc_id
  ingress {
      from_port       = var.port_22
      to_port         = var.port_22
      protocol        = var.tcp_protocol
      cidr_blocks     = [var.vpc_cidr]
      security_groups = [aws_security_group.public.id]
    }
  ingress {
      from_port       = var.port_3306
      to_port         = var.port_3306
      protocol        = var.tcp_protocol
      cidr_blocks     = [var.vpc_cidr]
      security_groups = [aws_security_group.public.id]
    }
  egress {
      from_port       = var.port_0
      to_port         = var.port_0
      protocol        = var.protocol-1
      cidr_blocks     = [var.all_allowed_cidr]
    }
  tags = {
    Name = var.private_security_group
  }
}
