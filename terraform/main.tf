provider "aws" {
    region = "${var.aws_region}"
}

data "aws_ami" "ubuntu" {
    most_recent =  true
    owners = ["099720109477"] # This is the ID of Canonical (the people who own Ubuntu)

    filter {
        name = "name" # This means we are filtering the by the name
        values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"] # This is the value of the name we are filtering by
    }
}

# Create the instance
resource "aws_instance" "app_server" {
    ami = data.aws_ami.ubuntu.id
    instance_type = "${var.instance_type}"

    # Place instance in public subnet created in networking
    subnet_id = aws_subnet.public.id

    # Attach security group
    vpc_security_group_ids = [aws_security_group.web.id]

    tags = {
        Name = "skychatquan" # Naming the instance
    }
}