terraform {
  required_version = ">= 1.0.0"  # Specify the minimum version required
}

provider "aws" {
  region = "us-west-2"  # Adjust this to your preferred region
}

# Create VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"  # Adjust CIDR block as needed
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "main-vpc"
  }
}
