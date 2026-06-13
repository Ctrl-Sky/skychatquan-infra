# skychatquan-infra

Infrastructure as Code for skychatquan.com

## Prerequisites
- Terraform >= 1.5.0
- Ansible >= 2.14
- AWS Account
- Cloudflare account
- A domain registered with cloudflare as its dns manager. If domain registrar is from another website (ex. Namecheap), ensure cloudflare nameserver has been added to the domain registrar

## Setup
1. Generate ssh key locally by running `ssh-keygen -t ed25519 -f ~/.ssh/deploy_key`
2. Copy terraform.tfvars.example to terraform.tfvars
3. Create cloudflare api token and retrieve zone id to fill in terraform.tfvars
4. Create IAM user and create access key with AmazonEC2FullAccess. Save the access key id and the secret access key
5. Run `aws configure` and input the access key id and secret access key
6. Fill in the variables for terraform/variables.tf
7. Fill in the variables for ansible/group_vars/all.yml
8. Run `bash start_up_server.sh` or run each line in the bash script to do it manually

## Structure
- terraform/ — VPS, DNS, and firewall provisioning
- ansible/ — Server configuration and Nginx setup
