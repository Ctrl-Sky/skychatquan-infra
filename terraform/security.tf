#  Create the security group for EC2 Instance
resource "aws_security_group" "web" {
    name = "${var.domain_name}-web-sg"
    description = "Security group for the web server"
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "${var.domain_name}-web-sg"
    }
}

# SSH inbound rule - port 22
# Allows you and Ansible to connect to the server
resource "aws_vpc_security_group_ingress_rule" "ssh" {
    security_group_id = aws_security_group.web.id
    description = "SSH access"
    ip_protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_ipv4 = "0.0.0.0/0"
}

# HTTP inbound rule - port 80
# Needed for redirecting visitors from HTTP to HTTPs and Let's Encrypt cert verification
resource "aws_vpc_security_group_ingress_rule" "http" {
    security_group_id = aws_security_group.web.id
    description = "HTTP web traffic"
    ip_protocol = "tcp"
    from_port = 80
    to_port = 80
    cidr_ipv4 = "0.0.0.0/0"
}

# HTTPs inbound rule - port 443
# For website traffic
resource "aws_vpc_security_group_ingress_rule" "https" {
    security_group_id = aws_security_group.web.id
    description = "HTTPs web traffic"
    ip_protocol = "tcp"
    from_port = 443
    to_port = 443
    cidr_ipv4 = "0.0.0.0/0"
}

# Outbound rule
# Allow all out going traffic
resource "aws_vpc_security_group_egress_rule" "name" {
    security_group_id = aws_security_group.web.id
    description = "Allow all outbound traffic"
    ip_protocol = "-1"
    cidr_ipv4 = "0.0.0.0/0"
}
