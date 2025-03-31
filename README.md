# OwnCloud Docker Deployment

This repository contains Docker Compose configuration for deploying OwnCloud with MariaDB and Redis.

## Components

- **OwnCloud**: The main application server (latest version)
- **MariaDB**: Database server (version 10.6) 
- **Redis**: Cache server for improved performance (version 6)

## Prerequisites

- Docker Engine (version 19.03.0+)
- Docker Compose (version 1.27.0+)

## Deployment Instructions

1. Clone or download this repository
2. Navigate to the project directory:
   ```
   cd Owncloud
   ```
3. Start the services:
   ```
   docker-compose up -d
   ```
4. Access OwnCloud at `http://localhost:8080`

## Default Credentials

- **OwnCloud Admin**:
  - Username: `admin` 
  - Password: `admin_password`

- **Database**:
  - Root Password: `root_password`
  - Username: `owncloud`
  - Password: `owncloud_password`
  - Database name: `owncloud`

## Data Persistence

All data is persisted using named Docker volumes:
- `owncloud_data`: OwnCloud application data
- `mariadb_data`: Database files
- `redis_data`: Redis cache data

## Customization

You can modify the configuration by editing the `docker-compose.yml` file:
- Change ports by modifying the `ports` section of the OwnCloud service
- Change credentials by updating the environment variables
- Adjust volume settings as needed

## Security Notes

- For production use, change all default passwords
- Consider using Docker secrets for sensitive information
- Implement proper backup strategies
- Configure HTTPS for secure access

## Maintenance

- Stop the services: `docker-compose down`
- View logs: `docker-compose logs -f`
- Restart services: `docker-compose restart`
- Remove everything (including volumes): `docker-compose down -v`

## Troubleshooting

If you encounter issues:
1. Check service status: `docker-compose ps`
2. View detailed logs: `docker-compose logs -f [service_name]`
3. Ensure proper network connectivity between containers
4. Verify volume permissions 