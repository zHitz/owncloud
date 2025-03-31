#!/bin/bash
# OwnCloud Monitoring Script
# This script performs basic health checks on OwnCloud services

# Load environment variables
source ./.env

echo "============================================="
echo "OwnCloud Services Health Check"
echo "Date: $(date)"
echo "============================================="

# Check if services are running
echo -e "\n[1] Container Status:"
docker-compose ps

# Check resource usage
echo -e "\n[2] Resource Usage:"
docker stats --no-stream $(docker-compose ps -q)

# Check OwnCloud connectivity
echo -e "\n[3] OwnCloud Web Service:"
curl -sI http://localhost:${OWNCLOUD_PORT} | head -n 1
if [ $? -eq 0 ]; then
  echo "OwnCloud web service is accessible"
else
  echo "WARNING: OwnCloud web service is not responding"
fi

# Check database
echo -e "\n[4] Database Connectivity:"
if docker-compose exec mariadb mysql -u${DB_USER} -p${DB_PASSWORD} -e "SELECT 1" ${DB_NAME} >/dev/null 2>&1; then
  echo "Database connectivity: OK"
else
  echo "WARNING: Database connectivity issue detected"
fi

# Check disk space
echo -e "\n[5] Storage Usage:"
echo "OwnCloud data volume:"
docker run --rm -v owncloud_data:/data alpine df -h /data

echo -e "\nMariaDB data volume:"
docker run --rm -v mariadb_data:/data alpine df -h /data

# Check logs for errors
echo -e "\n[6] Recent Error Logs:"
docker-compose logs --tail=20 | grep -i "error\|warning"

echo -e "\n============================================="
echo "Health check completed"
echo "=============================================" 