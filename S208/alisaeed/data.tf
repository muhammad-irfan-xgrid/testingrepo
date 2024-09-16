// Linux AMI for EC2
data "aws_ami" "amazon-linux-2" {
 most_recent = true
 filter {
   name   = "owner-alias"
   values = ["amazon"]
 }
 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }
}

data "template_file" "userdata_file" {
  template = file("userdata.tpl")

  vars = {
    username        = "${var.user_name}"
    password        = "${var.password}"
    db_name         = "${var.db_name}"
    rds_endpoint    = "${module.db.db_instance_endpoint}"
  }
}
