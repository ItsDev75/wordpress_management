#!/bin/bash

# Check if docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Installing Docker..."
    # Install Docker

    # Add the installation command for your specific Linux distribution here
    sudo apt-get update
    sudo apt-get install -y docker.io
    sudo systemctl enable --now docker
fi

# Check if docker-compose is installed
if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose is not installed. Installing Docker Compose..."
    # Install Docker Compose
    # Add the installation command for your specific Linux distribution here
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
    export PATH="/usr/local/bin:$PATH"
fi

# Create the WordPress site using docker-compose
create_wordpress_site() {
    # Get the site name as a command-line argument
    local site_name="$1"

    # Create the docker-compose.yml file
    cat << EOF > docker-compose.yml
version: '3'
services:
  wordpress:
    image: wordpress:latest
    ports:
      - 80:80
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_USER: example_user
      WORDPRESS_DB_PASSWORD: example_password
      WORDPRESS_DB_NAME: ${site_name}
    volumes:
      - ./wordpress:/var/www/html

  db:
    image: mysql:5.7
    environment:
      MYSQL_DATABASE: ${site_name}_db
      MYSQL_USER: example_user
      MYSQL_PASSWORD: example_password
      MYSQL_RANDOM_ROOT_PASSWORD: '1'
EOF

    # Create the local directory for WordPress files
    mkdir -p ./wordpress

    # Start the containers
    docker-compose up -d

    # Add /etc/hosts entry
    echo "${public_ip} example.com" | sudo tee -a /etc/hosts

    # Prompt the user to open example.com in a browser
    echo "WordPress site created successfully. Open http://example.com in your browser."
}

# Enable or disable the site
manage_site() {
    local action="$1"

    # Perform the action (stop or start the containers)
    docker-compose $action
}

# Delete the site
delete_site() {
    # Stop and remove the containers
    docker-compose down

    # Remove the local directory for WordPress files
    rm -rf ./wordpress

    # Remove /etc/hosts entry
    sudo sed -i '/example.com/d' /etc/hosts

    echo "WordPress site deleted successfully."
}

# Main script logic
case $1 in
    create)
        create_wordpress_site "$2"
        ;;
    manage)
        manage_site "$2"
        ;;
    delete)
        delete_site
        ;;
    *)
        echo "Usage: ./script.sh [create <site_name>] | [manage <start|stop>] | [delete]"
        exit 1
        ;;
esac