.PHONY: inventory

inventory:
	@./generate_inventory.sh

.PHONY: deploy
deploy:
	terraform apply -auto-approve
	@./generate_inventory.sh

.PHONY: destroy
destroy:
	terraform destroy -auto-approve