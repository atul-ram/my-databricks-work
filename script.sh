terraform init -backend-config="azure.conf"
#terraform init -backend-config="azure.conf"  -reconfigure
terraform plan -out=tfplan
terraform apply -auto-approve -input=false