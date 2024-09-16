// Create Private Key for EC2
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

// Create key pair for EC2
resource "aws_key_pair" "this" {
  key_name   = "key_pair"
  public_key = tls_private_key.rsa.public_key_openssh
}

// Create a local file for key/value pair
resource "local_file" "this" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "key_pair.pem"
}

// Create launch configuration for EC2
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_configuration
resource "aws_launch_configuration" "this" {
  name                        = var.launch_configuration
  image_id                    = data.aws_ami.amazon-linux-2.id
  instance_type               = var.aws_instance_type
  key_name                    = var.key_name
  user_data                   = "${base64encode(data.template_file.userdata_file.rendered)}"
  security_groups             = [aws_security_group.public.id]
}
