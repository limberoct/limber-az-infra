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

## Django Hello World App

The infrastructure automatically deploys a Django "Hello World" application using Docker. The app is configured to:

- Run on port 80 (HTTP) 
- Auto-start on VM boot
- Include Docker and Docker Compose setup

### Accessing the Application

After deployment, visit: `http://YOUR_VM_PUBLIC_IP`

The public IP will be shown in the Terraform output:
```bash
terraform output vm_public_ip
```

### Managing the Django App

SSH into the VM and use these commands:

```bash
# Using the management script
/home/ubuntu/manage-app.sh {start|stop|restart|logs|status}

# Using systemctl
sudo systemctl {start|stop|restart|status} django-app

# Using Docker Compose directly
cd /home/ubuntu/django-app
docker compose {up -d|down|logs -f|ps}
```

### Application Structure

The Django app includes:
- `/home/ubuntu/django-app/` - Application directory
- `Dockerfile` - Container definition
- `docker-compose.yml` - Service orchestration
- `requirements.txt` - Python dependencies
- Django project files (settings.py, urls.py, views.py)

### Customizing the App

1. SSH into the VM
2. Edit files in `/home/ubuntu/django-app/`
3. Rebuild and restart: `/home/ubuntu/manage-app.sh restart`

Clean up
```bash
# Destroy only the VM
terraform destroy -target=module.vm -var="admin_ssh_public_key=$(cat ~/.ssh/id_limber.pub)"
# Destroy everything
terraform destroy -var="admin_ssh_public_key=$(cat ~/.ssh/id_limber.pub)"
```