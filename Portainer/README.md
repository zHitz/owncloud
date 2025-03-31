# Portainer for OwnCloud

This directory contains configuration to run and manage OwnCloud through Portainer.

## Directory Structure

- `docker-compose.yml`: Configuration file to run Portainer
- `owncloud-stack.yml`: Sample stack file to deploy OwnCloud in Portainer
- `setup-owncloud.sh`: Setup script for OwnCloud configuration

## Usage Instructions

### Step 1: Start Portainer

```bash
docker-compose up -d
```

### Step 2: Access Portainer

Open your browser and navigate to: `http://localhost:9000`

When logging in for the first time:
1. Create an administrator account
2. Select the Local environment for management

### Step 3: Create and Deploy OwnCloud Stack

1. From the left menu, select `Stacks`
2. Click on `Add stack`
3. Name the stack (example: "owncloud")
4. Copy the contents from the `owncloud-stack.yml` file into the Web editor field
5. Click on `Deploy the stack`

### Step 4: Access OwnCloud

After successful deployment, you can access OwnCloud at:
- `http://localhost:8080` (if using default port)
- `http://localhost:8081` (if configured in environment variables)

### Managing OwnCloud in Portainer

With Portainer you can:
- Monitor resource usage
- View container logs
- Manage volumes and networks
- Restart, stop, and update containers
- Open terminal console into containers

## Environment Variables

Environment variables can be configured in Portainer when deploying the stack:

### OwnCloud
- `OWNCLOUD_VERSION`: OwnCloud version (default: latest)
- `OWNCLOUD_PORT`: Port to access OwnCloud (default: 8080)
- `OWNCLOUD_DOMAIN`: OwnCloud domain (default: localhost:8080)
- `OWNCLOUD_ADMIN_USERNAME`: Admin username (default: admin)
- `OWNCLOUD_ADMIN_PASSWORD`: Admin password (default: admin_password)

### Database
- `MARIADB_VERSION`: MariaDB version (default: 10.6)
- `DB_ROOT_PASSWORD`: MariaDB root password (default: root_password)
- `DB_NAME`: Database name (default: owncloud)
- `DB_USER`: Database username (default: owncloud)
- `DB_PASSWORD`: Database password (default: owncloud_password)

### Redis
- `REDIS_VERSION`: Redis version (default: 6)

## Security Notes

- For production use, change all default passwords
- Consider using Docker secrets for sensitive information
- Implement proper backup strategies
- Configure HTTPS for secure access 