## Prereqs
- Azure CLI logged in: `az login`
- Your user has:
  - Storage Blob Data Contributor on storage account `limbertfstate`
  - Contributor on RG `rg-limber-prod` (or least-privilege equivalents)

## Initialize & deploy
Init
```bash
cd infra/envs/prod
terraform init
```
Create SSH key
```bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_limber -N "" -C "peter@azure"
```

Deploy
```bash
# Run terraform with the SSH key
terraform plan -var="admin_ssh_public_key=$(cat ~/.ssh/id_limber.pub)"
terraform apply -var="admin_ssh_public_key=$(cat ~/.ssh/id_limber.pub)"
```
Connect
```bash
ssh -i ~/.ssh/id_limber ubuntu@4.193.202.224
```

Clean up
```bash
terraform destroy -var="admin_ssh_public_key=$(cat ~/.ssh/id_limber.pub)"
```