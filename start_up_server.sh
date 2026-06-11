cd terraform
terraform apply -auto-approve
public_ip=$(terraform output -raw instance_public_ip)

cd ../ansible
ansible-playbook playbook.yml --extra-vars "ansible_host=$public_ip" --limit web
