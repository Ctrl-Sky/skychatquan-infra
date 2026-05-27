# Create elastic IP (static IP)
resource "aws_eip" "web" {
    domain = "vpc"
    tags = {
      "Name" = "${var.domain_name}-eip"
    }
}

# Attach elastic IP to EC2 instance
resource "aws_eip_association" "web" {
    instance_id = aws_instance.app_server.id
    allocation_id = aws_eip.web.id
}

