# clouddrive mount -s mySubscription -g sandbox-rg -n terraformdemofiles  -f cloudshell-logs

#git config --global user.email "atul.ram@gmail.com"
#git config --global user.name "atul"

terraform init -backend-config="backend.tfvars"
#terraform init -backend-config="azure.conf"  -reconfigure
terraform plan -out=tfplan
#terraform apply -auto-approve -input=false

# terraform destroy 
