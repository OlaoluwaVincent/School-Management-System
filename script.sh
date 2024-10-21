#!/bin/bash

# Start the Docker containers in detached mode
docker compose up -d

echo "Waiting...."
sleep 5
dockder ps
# Wait for MySQL to start up
echo "Kindly wait 20secs for MySQL to start so as not to have errors..."
sleep 20

# Connect to MySQL
mysql -h 127.0.0.1 -P 3306 -u root -p
