# Setting up this Project

Kindly go through this documentation before getting into it.

## Setup Docker

Kindly install Docker and Docker Compose on your local machine.

### Step 1: Create Your `docker-compose.yml` File

Add the necessary configurations for your MySQL service in the `docker-compose.yml` file. Here’s an example:

```yaml
version: "3.8"

services:
  db:
    container_name: edums
    image: mysql:8.0
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: your_db
      MYSQL_USER: user
      MYSQL_PASSWORD: password
    ports:
      - "3306:3306" # Exposes MySQL port 3306 to the host machine
    networks:
      - app-network

networks:
  app-network:
    driver: bridge
```

### Step 2: Start the Docker Containers

Run the following command in your terminal to start the containers in detached mode:

```bash
docker-compose up -d
```

### Step 3: Check the Running Containers

To ensure your MySQL container is running, use the following command. You should see your container listed, and its name should be `edums` if you specified it in your `docker-compose.yml` file:

```bash
docker ps
```

### Step 4: Connect to the MySQL Database

You can connect to the MySQL server from within the Docker container using:

**NOTE:** To be able to do this, you need to have the MySQL client installed. Check if it's installed:

```bash
mysql --version
```

If it is not installed, you can install it using:

```bash
sudo apt update
sudo apt install mysql-client
```

To access your database running in the Docker container:

```bash
docker exec -it edums mysql -u root -p
```

### Step 5: Expose Your Container to Your Local Machine

To connect to your MySQL container from your local machine, run:

```bash
mysql -h 127.0.0.1 -P 3306 -u root -p
```

### Step 6: Spin Up Your PHP Server

You can specify your own port for the PHP server. For example, to run it on port 8000, use:

```bash
php -S localhost:8000
```

### Step 7: Set Global SQL Mode (if necessary)

If you encounter errors related to SQL mode, you can set it using:

```bash
docker exec -it edums mysql -u root -p -e "SET GLOBAL sql_mode='';"
```

### Step 8: Adjust SQL Function Declarations (if needed)

If you encounter the following error while running your application:

```bash
Uncaught mysqli_sql_exception: This function has none of DETERMINISTIC, NO SQL, or READS SQL DATA...
```

You can resolve it by allowing function creation without strict mode:

```bash
docker exec -it edums mysql -u root -p -e "SET GLOBAL log_bin_trust_function_creators = 1;"
```

### Step 9: Stop and Remove the Containers

When you're done testing or if you want to stop the services, use:

```bash
docker-compose down
```

### Additional Notes

- **You could run this script to get you up and running after setting up docker**

```bash
 ./script.sh
```

- **Docker Version**: Ensure that your Docker and Docker Compose versions are up-to-date.
- **MySQL Client**: Make sure you have the MySQL client installed on your host machine if you want to connect from there.
- **Environment Variables**: Update the `MYSQL_DATABASE`, `MYSQL_USER`, and `MYSQL_PASSWORD` values in the `docker-compose.yml` file as per your requirements.
- **Error Handling**: If you encounter issues, check the logs with:

  ```bash
  docker-compose logs
  ```
