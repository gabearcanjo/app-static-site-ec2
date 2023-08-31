resource "aws_instance" "instance" {
    ami                    = "ami-02e136e904f3da870"
    instance_type          = "t2.micro"
    subnet_id              = var.network_subnet_pub_id
    vpc_security_group_ids = [aws_security_group.sg_public.id]
    user_data              = "${base64encode(data.template_file.user_data.rendered)}"
}

resource "aws_security_group" "sg_public" {
    name        = "sg_public"
    vpc_id      = var.network_vpc_pub_id
    
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["10.0.0.0/16"]
    }

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    ingress {
        description = "TCP/80 from All"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

}

data "template_file" "user_data" {
    template = "${file("./scripts/user_data.sh")}"
}