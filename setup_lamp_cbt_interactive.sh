#!/bin/bash

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo apt update && sudo apt upgrade -y
if [ $? -ne 0 ]; then
    echo "System update/upgrade failed. Exiting..."
    exit 1
fi

# Install Apache
echo "Installing Apache..."
sudo apt install apache2 -y
if [ $? -ne 0 ]; then
    echo "Apache installation failed. Exiting..."
    exit 1
fi

# Install MySQL
echo "Installing MySQL..."
sudo apt install mysql-server -y
if [ $? -ne 0 ]; then
    echo "MySQL installation failed. Exiting..."
    exit 1
fi

# Install PHP and required modules
echo "Installing PHP and necessary modules..."
sudo apt install php libapache2-mod-php php-mysql php-cli php-curl php-xml php-zip -y
if [ $? -ne 0 ]; then
    echo "PHP installation failed. Exiting..."
    exit 1
fi

# Restart Apache to apply PHP configuration
echo "Restarting Apache..."
sudo systemctl restart apache2

# Install p7zip
echo "Installing p7zip..."
sudo apt install p7zip-full -y
if [ $? -ne 0 ]; then
    echo "p7zip installation failed. Exiting..."
    exit 1
fi

# Prompt for MySQL user and password
echo "Please provide the MySQL database user and password for the CBT system."

read -p "Enter MySQL CBT username: " cbt_user
if [ -z "$cbt_user" ]; then
    echo "CBT username cannot be empty. Exiting..."
    exit 1
fi

read -sp "Enter password for user '$cbt_user': " cbt_password
echo # New line for better formatting
if [ -z "$cbt_password" ]; then
    echo "CBT password cannot be empty. Exiting..."
    exit 1
fi

# Prompt for MySQL root password
read -sp "Enter MySQL root password: " root_password
echo # New line for better formatting

# Configure MySQL
echo "Configuring MySQL..."
sudo mysql -u root -p"$root_password" <<MYSQL_SCRIPT
CREATE DATABASE IF NOT EXISTS cbt_database;
CREATE USER IF NOT EXISTS '$cbt_user'@'localhost' IDENTIFIED BY '$cbt_password';
GRANT ALL PRIVILEGES ON cbt_database.* TO '$cbt_user'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

if [ $? -eq 0 ]; then
    echo "MySQL configuration completed successfully!"
else
    echo "MySQL configuration failed. Please check the error messages."
    exit 1
fi

echo "Wes Mari Kabeh, Kang.. Seng Tenang.."
