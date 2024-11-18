#!/bin/bash

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo apt update && sudo apt upgrade -y

# Install Apache
echo "Installing Apache..."
sudo apt install apache2 -y

# Install MySQL
echo "Installing MySQL..."
sudo apt install mysql-server -y

# Install PHP and required modules
echo "Installing PHP and necessary modules..."
sudo apt install php libapache2-mod-php php-mysql php-cli php-curl php-xml php-zip -y

# Prompt for MySQL user and password
echo "Please provide the MySQL database user and password for the CBT system."

read -p "Enter MySQL CBT username: " cbt_user
read -sp "Enter password for user '$cbt_user': " cbt_password
echo # New line for better formatting

# Configure MySQL
echo "Configuring MySQL..."
sudo mysql <<MYSQL_SCRIPT
CREATE DATABASE cbt_database;
CREATE USER '$cbt_user'@'localhost' IDENTIFIED BY '$cbt_password';
GRANT ALL PRIVILEGES ON cbt_database.* TO '$cbt_user'@'localhost';
FLUSH PRIVILEGES;
EXIT;
MYSQL_SCRIPT

echo "LAMP Stack setup and MySQL configuration completed!"
