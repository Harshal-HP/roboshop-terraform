apply:
	git pull
	terraform init
	terraform plan
	terraform apply -auto-approve

destroy:
	git pull
	terraform init
	terraform destroy -auto-approve