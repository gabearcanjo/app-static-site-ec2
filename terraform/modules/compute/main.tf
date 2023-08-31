
data "template_file" "user_data" {
    template = "${file("./scripts/user_data.sh")}"
}

resource "aws_instance" "ec2_lt" {
    ami                    = "${var.ec2_lt_ami}"
    subnet_id              = "${var.vpc_sn_pub_az1_id}"
    instance_type          = "${var.ec2_lt_instance_type}"
    user_data              = "${base64encode(data.template_file.user_data.rendered)}"
    vpc_security_group_ids = ["${var.vpc_sg_pub_id}"]
}