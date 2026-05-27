provider "aws" {
    region = "${var.aws_region}"
}

provider "cloudflare" {
    api_token = "${var.cloudflare_api_token}"
}

data "aws_ami" "ubuntu" {
    most_recent =  true
    owners = ["099720109477"] # This is the ID of Canonical (the people who own Ubuntu)

    filter {
        name = "name" # This means we are filtering the by the name
        values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"] # This is the value of the name we are filtering by
    }
}

# Register SSH public key with AWS
# AWS places key on the EC2 Instance when it boots
resource "aws_key_pair" "deploy" {
    key_name = "${var.domain_name}-deploy-key"
    public_key = file(var.ssh_public_key_path)
  
    tags = {
        Name = "${var.domain_name}-deploy-key"
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

    # Tells EC2 instance to use this specific SSH key pair for login access.
    key_name = aws_key_pair.deploy.key_name

    tags = {
        Name = "skychatquan" # Naming the instance
    }
}