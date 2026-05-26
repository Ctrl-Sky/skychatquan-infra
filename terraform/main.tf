provider "aws" {
    region = "us-east-2"
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
    instance_type = "t3.micro"

    # Place instance in public subnet created in networking
    subnet_id = aws_subnet.public.id

    tags = {
        Name = "skychatquan" # Naming the instance
    }
}