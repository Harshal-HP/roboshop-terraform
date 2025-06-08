dev-apply:
	git pull
	rm -rf .terraform/terraform.tfstate
	terraform init -backend-config=environments/dev/state.tfvars
	terraform plan -var-file environments/dev/main.tfvars -var token=$(token)
	terraform apply -auto-approve -var-file environments/dev/main.tfvars -var token=$(token)

dev-destroy:
	git pull
	rm -rf .terraform/terraform.tfstate
	terraform init -backend-config=environments/dev/state.tfvars -var token=$(token)
	terraform destroy -auto-approve -var-file environments/dev/main.tfvars -var token=$(token)

prod-apply:
	git pull
	rm -rf .terraform/terraform.tfstate
	terraform init -backend-config=environments/prod/state.tfvars
	terraform plan -var-file environments/prod/main.tfvars -var token=$(token)
	terraform apply -auto-approve -var-file environments/prod/main.tfvars -var token=$(token)

prod-destroy:
	git pull
	rm -rf .terraform/terraform.tfstate
	terraform init -backend-config=environments/prod/state.tfvars -var token=$(token)
	terraform destroy -auto-approve -var-file environments/prod/main.tfvars -var token=$(token)
	