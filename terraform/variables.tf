variable "domain_name" {
    type = string
    default = "skychatquan.com"
}

variable "aws_region" {
    type = string
    default = "us-east-2"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "cloudflare_api_token" {
    description = "Cloudflare API token with DNS edit permission"
    type = string
    sensitive = true
}

variable "cloudflare_zone_id" {
    description = "Cloudflare zone id for skychatquan.com"
    type = string
    sensitive = true
}

variable "ssh_public_key_path" {
    description = "Path to your SSH public key file"
    type        = string
    default     = "~/.ssh/deploy_key.pub"
}