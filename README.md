# skychatquan-infra

Infrastructure as Code for skychatquan.com

## Prerequisites
- Terraform >= 1.5.0
- Ansible >= 2.14
- DigitalOcean account
- Cloudflare account

## Setup
1. Copy terraform.tfvars.example to terraform.tfvars
2. Fill in your API tokens
3. Run terraform init
4. Run terraform apply
5. Run ansible-playbook ansible/playbook.yml

## Structure
- terraform/ — VPS, DNS, and firewall provisioning
- ansible/ — Server configuration and Nginx setup
